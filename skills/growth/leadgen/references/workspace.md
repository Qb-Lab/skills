# Workspace and engine

## Layout

```
<workspace>/
├── config/
│   ├── agency.json          identity, owner, booking link, services, proof policy
│   ├── offers.json          offers (prices stay private; never written into outreach)
│   ├── campaigns/<id>.json  ICP per campaign: industries, geography, size, titles,
│   │                        keywords, pain hypotheses, pilot ideas, signal guidance,
│   │                        prospecting-tool filters
│   ├── scoring.json         criteria, signals and points (sum to 100), thresholds
│   ├── outreach.json        word limits, banned phrases, forbidden patterns, opt-out line,
│   │                        signature
│   ├── limits.json          per-run and per-day caps
│   ├── schedule.json        time zone, working days, holidays, follow-up cadence, jobs
│   ├── notifications.json   where summaries go
│   ├── crm.json             CRM provider, key properties, stages, retention
│   └── sources.json         which discovery sources are on
├── hubspot/properties.json  CRM properties and deal pipeline the engine expects
├── data/
│   ├── suppression.json     global suppression list
│   ├── approvals.jsonl      append-only approval decisions
│   └── sent-log.jsonl       append-only record of what was sent, when, to whom
├── runs/<YYYY-MM-DD>/       candidates, leads, research, scores, drafts, run logs
├── reports/                 daily and weekly reports
├── prompts/                 the prompts scheduled runs execute
└── src/cli.ts               the engine
```

## Engine commands

Run from the workspace: `node src/cli.ts <command>`. Exit code 0 means success; any other
code means stop and report.

| Command | Use |
| --- | --- |
| `config check` | validate configuration; run first |
| `status` | configuration, credentials present, data counts |
| `validate <lead\|research\|draft\|approval\|suppression\|outreach_state> <file>` | schema check before using a file |
| `import --campaign ID --file F [--existing F] [--limit N] --out F` | candidates (.json or .csv) to deduplicated lead records |
| `score --research F --out F` | deterministic score with evidence and confidence |
| `draft build --input F --out F` | add id, version, hash and status to a draft |
| `draft lint --draft F --research F [--domain D] [--crm-opted-out]` | length, voice, prices, placeholders, evidence, suppression; exit 3 on errors |
| `draft revise --draft F --body-file F [--subject S] --out F` | owner edit; new version and hash |
| `approval record --draft F --decision approved\|rejected\|regenerate\|not_relevant --by NAME` | append a decision |
| `approval check --draft F` | exit 0 only if this exact version may be sent |
| `suppress check [--email] [--domain] [--linkedin] [--company]` | exit 5 if suppressed |
| `suppress add --type --value --reason` | add an entry (idempotent) |
| `reply classify --text T` | flags unambiguous opt-out language |
| `followups --state F` | next step per contact: draft, wait, stop, already queued |
| `crm plan --lead F [--score F] --status S [--current S] [--summary-file F] [--pilot T] --out F` | idempotent CRM operations |
| `crm apply --plan F [--live]` | apply a plan over the CRM's REST API outside an agent host |
| `report daily --snapshot F [--date D]` / `report weekly --snapshot F --from D --to D` | report from a CRM snapshot |
| `retention` | run folders past the retention window |

Record shapes are in `data-contracts.md`.

## Files a run writes

`runs/<date>/candidates-<campaign>.json`, `leads-<campaign>.json`,
`research/<company-id>.json`, `scores/<company-id>.json`, `drafts/<draft-id>.v<n>.json`,
`review-queue.md`, `snapshot.json`, and one log per command. Never write outside the
workspace except through the CRM and mail tools.
