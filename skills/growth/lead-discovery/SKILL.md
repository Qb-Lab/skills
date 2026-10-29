---
name: lead-discovery
description: >
  Find companies that match a configured ICP campaign, identify the decision-maker roles to
  approach, deduplicate against the CRM and earlier runs, and output standardized lead
  records with source URLs. Use when the user says "find new leads", "discover companies in
  <industry/city>", "/leadgen discover", or imports a CSV or prospecting-tool export.
disable-model-invocation: true
argument-hint: "[campaign-id] [--csv <file>] [--limit N]"
---

# Lead discovery

Turn a campaign definition into a short list of real companies worth researching. Quality
over volume: ten companies with a source and a reachable decision-maker beat fifty names.

## 1. Load the shared rules

Find the installed `leadgen` skill (a directory named `leadgen` containing `SKILL.md`,
wherever the host installs skills). Read its `references/rules.md` and
`references/workspace.md`, locate the workspace as it describes, and run
`config check`. Read the campaign file. Skip paused campaigns unless named.

## 2. Load what already exists

From the CRM, export every company in this campaign or with the same domain as a
candidate (key, name, domain, city) into `runs/<date>/existing-<campaign>.json`. If the CRM
is not available, use every `leads-*.json` under `runs/` instead and say so. This is what
deduplication runs against.

## 3. Collect candidates, cheapest reliable source first

Stop when you have about twice `discover_per_run` candidates or the source quotas are spent.

1. **A CSV or export the owner provided** (including LinkedIn Sales Navigator exports):
   use it as is.
2. **Prospecting tool (Apollo) through the host's connector**, when `sources.apollo` is
   enabled: an organization search with the campaign's `apollo` filters, then a people
   search per kept company with `decision_maker_titles`. Request only the fields you need;
   do not reveal or enrich contacts beyond `limits.apollo_credits_per_day`. Keep the tool's
   record URL as `source.url`. Use an email only if the tool marks it verified.
3. **Web search**: queries built from the campaign keywords and cities (for example
   `property management company Dubai`). Use company websites, official registries and
   business directories as sources. Listing portals are where companies are found, not the
   company's identity: the candidate's `website` must be its own domain.

Never scrape LinkedIn or log in anywhere. A person found only through a search snippet,
with no page that shows their role, is not a contact.

## 4. Shape and import

Write candidates in the shape in the `leadgen` skill's `references/data-contracts.md`:
omit what you do not know. Then:

```
node src/cli.ts import --campaign <id> --file runs/<date>/candidates-<id>.json \
  --existing runs/<date>/existing-<id>.json --limit <discover_per_run> \
  --out runs/<date>/leads-<id>.json
```

The engine drops duplicates, suppressed companies, shared-platform domains and exclude
keywords, and validates every record. Read its notes: a defaulted country or industry must
be confirmed during research.

## 5. Decision-maker check

For each new lead with no contact, name which `decision_maker_titles` to look for during
research. Do not add a person without a source page showing their name and role.

## 6. Report

One table: company, city, source, decision-maker found (yes/role/no), channel and whether
it is verified. Then the counts the engine printed (new, duplicates, possible duplicates,
rejected with reasons) and the quota used. Possible duplicates go to the owner, never
merged automatically.
