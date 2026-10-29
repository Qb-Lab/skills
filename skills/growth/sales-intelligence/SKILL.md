---
name: sales-intelligence
description: >
  Daily sales summary and weekly sales review from CRM and mailbox data: discovered,
  researched, qualified, drafted, sent, replies, positive replies, meetings, follow-ups,
  opportunities, performance by campaign and message variant, objections, and recommended
  experiments with next week's plan. Use when the user says "daily summary", "how did
  outreach do this week", "/leadgen report", "/leadgen weekly-review", or on the scheduled
  17:00 and Friday runs.
disable-model-invocation: true
argument-hint: "<daily [date] | weekly [from to]>"
---

# Sales intelligence

Numbers first, then decisions. Every number comes from a record; a rate on a small sample
is labelled as directional; nothing estimated is presented as a result.

## 1. Load the shared rules

Find the installed `leadgen` skill and read `references/rules.md`,
`references/workspace.md` and `references/data-contracts.md`.

## 2. Build the snapshot

From the CRM (companies with `leadgen_*` properties, their contacts, meetings and deals in
the configured pipeline) and the workspace (`runs/*/drafts`, `data/sent-log.jsonl`, the
latest `followups.json`), write `runs/<date>/snapshot.json` in the snapshot shape. Use the
dates on the records, in the workspace time zone. Values you could not read are `null` and
are listed under "Not available" in the report.

## 3. Daily

```
node src/cli.ts report daily --snapshot runs/<date>/snapshot.json --date <date> --out reports/daily-<date>.md
```

Add, below the engine's table, at most three lines on what changed and why it matters, each
tied to a record. Save, then notify as the `leadgen` rules allow (email to the owner's own
address, or the file only).

## 4. Weekly

```
node src/cli.ts report weekly --snapshot runs/<date>/snapshot.json --from <monday> --to <friday> --out reports/weekly-<iso-week>.md
```

Then add the analysis, in this order, each point tied to a number or a record:

1. **ICPs to prioritise next week:** campaigns or segments with the best positive-reply and
   meeting rates, or the most high-priority leads waiting.
2. **Companies to exclude:** patterns in disqualified leads and negative replies (size,
   sub-industry, already-has-a-vendor).
3. **Messages to improve:** variants with replies versus none; what differs between them.
   With fewer than 20 first touches per variant, say the comparison is not yet meaningful.
4. **Recurring problems:** hypotheses that research confirmed most often and what replies
   mentioned.
5. **The offer to test next:** one experiment with one variable, a baseline, a sample size
   and a judge date.

Then next week's operating plan: campaigns to run, daily caps, the variants to send, the
one experiment. Mark every change to targeting, caps or messaging as **proposed**: the
owner approves before any configuration file changes.

## 5. Never

- Never fill a missing number with an estimate or a typical industry rate.
- Never compare variants or campaigns without showing the sample sizes.
- Never present pipeline value as revenue; it is the sum of amounts the owner entered.
