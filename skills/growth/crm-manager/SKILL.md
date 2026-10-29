---
name: crm-manager
description: >
  Keep the CRM (HubSpot by default) in sync with the lead pipeline: idempotent upserts of
  companies and contacts by stable keys, associations, status transitions, research notes,
  review and follow-up tasks, outreach dates, replies, meetings, deals and opt-outs. Use
  when the user says "sync to HubSpot", "update the CRM", "create the leadgen properties",
  or another leadgen step hands over records to sync.
disable-model-invocation: true
argument-hint: "[sync | setup | mark <company> <status> | deal <company>]"
---

# CRM manager

The CRM is the single source of truth for status. This skill is the only place that
writes to it, so every write follows the same keys and the same rules.

## 1. Load the shared rules

Find the installed `leadgen` skill and read `references/rules.md`,
`references/workspace.md` and `references/crm.md`. Read `config/crm.json` and the
workspace's CRM definition file (`hubspot/properties.json`).

Use the host's CRM connector when it exists. Outside an agent host, the engine's
`crm apply --plan <file> --live` does the same over the REST API with a private app token
from the environment. If neither is available, write the plan files, say the CRM was not
updated, and stop.

## 2. `setup`

Compare the definition file with the CRM's existing properties and pipelines. Show what is
missing. Create the property group, the properties (unique-value flag on the key
properties) and the deal pipeline only after the owner says yes in this session. Read them
back and report what exists now.

## 3. `sync` (the default)

For each lead handed over (lead file, score file, target status):

1. Search the CRM by company key. Take its current `leadgen_status` if it exists.
2. `node src/cli.ts crm plan --lead <lead> --score <score> --status <target> --current <current> --summary-file <summary> --pilot "<pilot title>" --out runs/<date>/crm/<company-id>.json`.
   The summary is five lines: business model, top facts with URLs, main hypothesis, pilot,
   score line.
3. Apply each operation in order: upsert companies, upsert contacts, associate, then the
   note (search for its dedupe key first; skip if present).
4. Respect the plan's warnings: a refused transition keeps the current status.

Applying the same plan twice must change nothing. If a call fails, retry rate-limit and
server errors with backoff up to `limits.max_retries`, log anything else to
`logs/errors.jsonl` with the company key, and continue with the next company.

## 4. Tasks

For outreach waiting on the owner: one open task per company titled
`Review outreach: <company>`, due today, body with the draft location. For follow-ups:
`Follow-up due: <contact> (<step>)`. Search open tasks with the same title first.

## 5. Outreach facts from the mailbox

When the follow-up manager reports a sent message, a reply, a bounce or a booked meeting,
set the contact properties in `references/crm.md` from the message dates, move the company
status (`contacted`, `responded`, `meeting_booked`), and on a booked meeting create a deal
in the configured pipeline at Discovery with no amount.

## 6. `mark` and opt-outs

`mark <company> <status>` applies one transition after the engine allows it. For opt-outs
follow `references/crm.md`: CRM opt-out flag, contact status, company status when the whole
company asked, and `suppress add` in the workspace, all in the same run.

## 7. Report

Counts of companies and contacts created versus updated, notes added versus skipped,
tasks created versus already open, refused transitions, and errors with their log line.
