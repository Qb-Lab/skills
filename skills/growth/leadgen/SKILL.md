---
name: leadgen
description: >
  Run an approval-gated B2B lead generation operation: discover companies that match an ICP,
  research them, score them with evidence, draft outreach for review, manage follow-ups, keep
  the CRM in sync and report. Use when the user types /leadgen with setup, discover,
  research, qualify, outreach, followups, report, weekly-review or status, or asks to "run
  the lead pipeline", "find and qualify leads", or "what is waiting for my approval".
disable-model-invocation: true
argument-hint: "<setup | discover | research | qualify | outreach | followups | report | weekly-review | status> [campaign-id]"
---

# Leadgen

The router for the lead generation skills. It finds the workspace, applies the rules every
step shares, and hands each command to the focused skill that owns it. It stays thin: the
work happens in the skills it routes to.

## 1. Find the workspace

A workspace is a private directory holding the operation's configuration, the `leadgen`
engine and its data. Resolve it in this order and stop at the first hit:

1. The `LEADGEN_HOME` environment variable.
2. The current directory, when it contains `config/agency.json` and `src/cli.ts`.

Run the engine as `node src/cli.ts <command>` from the workspace (Node 22.18 or later; no
install step). If no workspace exists, only `setup` can run. Read `references/workspace.md`
(relative to this skill's folder) for the layout and every engine command.

Then run `node src/cli.ts config check`. If it fails, report the errors and stop: every
other step depends on valid configuration.

## 2. Load the rules

Read `references/rules.md` before any command. It holds the rules that no command may
break: nothing is sent, evidence before claims, untrusted input, suppression, quotas. When
`config/agency.json` has `"id": "qblab"`, also load the `qblab-context` skill (installed
wherever the host keeps skills) for voice and proof.

## 3. Route

| Command | Hand to | Output |
| --- | --- | --- |
| `setup` | this skill, `references/setup.md` | integration check, CRM properties, a status table |
| `discover [campaign]` | `lead-discovery` | new deduplicated lead records |
| `research [campaign]` | `lead-research`, then `lead-scoring` | research files and scores for leads not yet researched |
| `qualify [campaign]` | `lead-scoring`, then `crm-manager` | scores synced to the CRM, statuses set |
| `outreach [campaign]` | `outreach-personalization` | linted drafts in the mail tool and the review queue |
| `followups` | `follow-up-manager` | reply handling, follow-up drafts, CRM tasks |
| `report` | `sales-intelligence` (daily) | the daily summary |
| `weekly-review` | `sales-intelligence` (weekly), then `growth-content` | the weekly review, next week's plan, post ideas |
| `status` | this skill | the table below |

No argument means `status`. A campaign id limits the run to that campaign; without one,
take active campaigns in `priority` order. Paused campaigns never run unless named.

## 4. `status`

Print one short table: active campaigns; leads by CRM status; drafts waiting for review
(with their age); follow-ups due today; replies needing a human; the last run of each
scheduled job and whether it succeeded; integrations and whether each was tested in this
session. Then the single next thing the owner should do. Read, never change.

## 5. Every run ends the same way

- A run log at `runs/<YYYY-MM-DD>/<command>.md` in the workspace: what was read, what was
  written where, counts, errors, and what was skipped and why.
- A short message to the owner: counts, what waits for them, and links. Never claim an
  integration worked unless its call returned success in this run.
