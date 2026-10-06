---
name: growth-analyst
description: >
  Analyse a project's marketing and product-growth numbers into decisions: what changed, the
  winners and losers, anomalies, what to stop, continue and scale, and the next experiments.
  Works from analytics tools the agent can reach, CSV exports, pasted numbers and the content
  log; never fabricates a figure. Use when the user says "analyse our numbers", "what's
  working", "how did last week's content do", "why did signups drop", "which channel should
  we double down on", or hands over an analytics export.
disable-model-invocation: true
argument-hint: "<question, period, or path to exports; default last 7 days vs the 7 before>"
---

# Growth analyst

The output of analysis is a decision, not a number. "You received 42,000 impressions" tells
the owner nothing; "demo videos drove 3.2x more landing visits per 1,000 views than opinion
posts across five posts each, so make three more demo variants next week" tells them what to
do on Monday. Report what the data supports, say plainly where it is too thin to support
anything, and never fill a gap with an estimate.

## 1. Load project context

Find the installed `project-growth-context` skill (a directory named
`project-growth-context` containing `SKILL.md`, wherever the host installs skills) and
follow it: resolve the project and `<state>`, load or build the context, and apply its
rules. If it is not installed, say so with the install command
(`npx skills add qb-lab/skills --skill project-growth-context`) and continue from the
repository alone: nothing is read from or written to growth state, and the output says so.

This skill depends on the context's Goals and Analytics sections, and on
`<state>/content-log.csv`, `<state>/experiments/`, `<state>/analytics/`, `<state>/plans/`
and `<state>/learnings.md`.

## 2. Frame the question and the window

- **A question** ("why did installs drop", "is TikTok worth it"): answer that question; skip
  report sections it does not touch.
- **A period or nothing**: the seven days ending yesterday against the seven before. For a
  monthly read, the last 28 days against the 28 before, so both windows hold the same
  weekdays.
- **A path**: analyse those exports; take the window from the data.

State the window, the time zone the data source uses, and the 90-day objective at the top.
Never compare a partial period with a full one.

## 3. Collect the data

Use sources in this order and record, for each, what was pulled, the date range, and what is
missing. `references/analytics-framework.md` (relative to this skill's folder) lists what
to pull from each kind of source.

1. Analytics tools the host exposes (see the shared `capabilities.md` in
   `project-growth-context`'s `references/`), using the providers and exact event names in
   the context.
2. Exports the owner dropped in `<state>/analytics/` (CSV, spreadsheet, screenshots).
3. Numbers the owner pastes when asked. Ask once, with the exact list needed.
4. `result` cells already in the content log, and results on experiment cards.

A number that no source supplied is written "no data". If there is no data at all, do not
write a report: reply with the shortest list of exports or events that would make one
possible for this objective, and stop.

## 4. Check the data before believing it

Before any behaviour claim, rule out the measurement: a release that changed or dropped an
event, a consent or tag change, bot or internal traffic, a definition that differs between
two sources, a campaign link without tracking. A step that falls to zero, or a jump on a
single day with no matching change upstream, is a tracking question first. Unexplained
discrepancies are reported under Anomalies, not smoothed over.

## 5. Analyse for decisions

Follow `references/analytics-framework.md`:

- Start from the objective's metric tree and work down to the step that moved. Everything
  off that tree is context at most.
- Normalise before comparing: outcomes per 1,000 views, per visitor, per post. Totals reward
  whatever was posted most.
- Compare like with like: same platform, same format, same period length. Join content
  results to the log's `bucket`, `format` and `channel` so the unit of comparison is a
  pattern ("before/after demos"), not a single post.
- State the count behind every rate. Below the framework's minimums, a difference is "too
  few to read" or at most "early signal"; it is never a winner.
- Say how each outcome was attributed and what that method cannot see.
- Check `learnings.md`: note whether this period agrees with or contradicts what is on file.

## 6. Write the report

Fill `references/report-template.md`. Every bullet is a finding with its numbers, counts and
source, followed by what to do about it. Hypotheses are labelled `Hypothesis` and paired with
the cheapest way to test them. Stop, continue and scale each name a specific thing, and
"scale" requires evidence above the minimum sample; otherwise it reads "repeat to confirm".

## 7. Save and feed the loop

- Save `<state>/analytics/reports/YYYY-MM-DD.md` and print it.
- Fill the `result` cell of content-log rows the data covers, with unit and date. Leave rows
  without data empty: empty means unknown, never zero. Published posts that appear in an
  export but not in the log are added as `published` rows with the export as `source`, so
  the content memory is complete.
- Append to `<state>/learnings.md` only findings that meet the evidence rules, with honest
  confidence; update an existing entry when this period contradicts it.
- For each proposed experiment, give the observation and the variable in one line; to turn
  them into cards, find the installed `growth-experiment` skill and follow it.

When the context extends `qblab-context`, the site funnel and pipeline belong to the
`growth-brief` skill and its event dictionary: read the week's brief (or follow that skill)
for those numbers and analyse only what it does not cover.

End with three lines: one thing to stop, one thing to scale (or "nothing has enough evidence
to scale yet; repeat <x>"), and the next experiment.
