---
name: growth-experiment
description: >
  Turn a marketing idea into a measurable experiment card (observation, hypothesis, one
  variable, baseline, success and guardrail metrics, duration, ICE score), keep the project's
  experiment history, and close experiments with an honest verdict and a recorded learning.
  Use when the user says "test this idea", "set up an experiment for <x>", "what experiments
  are running", "what should we test next", "close EXP-004", or "did that test work".
disable-model-invocation: true
argument-hint: "<idea to test | list | next | close EXP-NNN>"
---

# Growth experiment

An idea becomes an experiment when it names one variable, a baseline, a metric and a date on
which it will be judged. Anything less is just activity. This skill designs the card, ranks it
against the others, and closes it with a verdict the evidence can carry: most small tests end
"inconclusive", and saying so is the job. Design and record only; the owner runs the test.

## 1. Load project context

Find the installed `project-growth-context` skill (a directory named
`project-growth-context` containing `SKILL.md`, wherever the host installs skills) and
follow it: resolve the project and `<state>`, load or build the context, and apply its
rules. If it is not installed, say so with the install command
(`npx skills add qb-lab/skills --skill project-growth-context`) and continue from the
repository alone: nothing is read from or written to growth state, and the output says so.

This skill depends on the context's Goals and Analytics sections, and on
`<state>/experiments/`, `<state>/learnings.md`, `<state>/strategy.md` and
`<state>/content-log.csv`.

## 2. Resolve the argument

- **An idea** (free text, a content id, a radar opportunity, a strategist experiment): design
  one card, sections 3 to 5.
- **`list`**: read every card in `<state>/experiments/` and print a table: id, name, status,
  metric, start date, judge date, ICE, verdict. Flag any `running` card past its judge date.
- **`next`**: rank the `proposed` and `ready` cards by ICE, drop any that `learnings.md` has
  since answered, and recommend what to start, respecting the limit in section 5. If there
  are fewer than two candidates, propose new ones from the strategy's experiment list and the
  newest radar and review, each as a card.
- **`close EXP-NNN`**: section 6.

## 3. Check what is already known

Read `learnings.md` and every existing card before designing. If the idea was tested before,
say what happened and with what confidence. A disproven idea is not rerun unchanged: name
what is different this time (audience, channel, creative, offer) or decline and say why. A
`low` confidence learning is a reason to rerun with a larger sample, and the card says so.

## 4. Design the card

Fill `references/experiment-template.md` (relative to this skill's folder), following the
rules in `references/scoring-and-evidence.md`:

- **Observation first.** What was seen that prompted this, with its source. No observation:
  label the whole card `Hypothesis` and score confidence at 3 or below.
- **One variable.** The hook, or the format, or the audience, or the CTA. If two things
  change, split the card or accept that the result will not say which one mattered.
- **A baseline before the start.** From analytics, the content log's `result` cells, or the
  owner. No baseline is `INPUT_NEEDED: baseline for <metric>`; the first week of the
  experiment may be used to measure one, and the card says that the duration is longer for it.
- **One success metric tied to the 90-day objective**, counted in outcomes (visits, signups,
  installs, replies), not exposure. One or two guardrail metrics that must not get worse.
- **Expected signal written in advance**: what result would count as supported, what as not
  supported, and the minimum sample below which the verdict will be inconclusive whatever
  the numbers say.
- **Duration in whole weeks**, at least one, so every weekday is covered equally, and a
  fixed judge date. No stopping early because it looks good.
- Check that the metric can actually be measured with the access in the context. If it
  cannot (no tracked link, no event), the first task on the card is the instrumentation.

## 5. Score and decide

Score Impact, Confidence and Ease from 1 to 10 using the anchors in
`references/scoring-and-evidence.md`; ICE is their mean. Confidence above 6 needs a citation
to `learnings.md` or an analyst report. Keep **two to four experiments running at once**:
fewer than two wastes the week, more than four and a solo owner cannot keep variables apart
or reach sample. If the limit is reached, the new card is saved as `ready` and the reply says
what it is queued behind.

## 6. Close an experiment

Ask the owner for the results, or find the installed `growth-analyst` skill and follow it
when the host has data access. Never fill a result from memory or estimate. If the judge
date has not arrived, say so: either wait, or close it early as `inconclusive` with the
reason the owner gives; an early close is never `supported`. Then:

- Record the raw numbers with units, sample size and dates, next to the baseline.
- Give one verdict: `supported`, `not supported`, or `inconclusive`, applying the sample
  rules in `references/scoring-and-evidence.md`. Below the card's own minimum sample the
  verdict is `inconclusive`. Never write "statistically significant" unless a real test was
  run, and then name the test.
- Write the learning in one sentence on the card. Append it to `<state>/learnings.md` only
  when the verdict is `supported` or `not supported`, or when an `inconclusive` result
  still shows a large, consistent gap (then as an "early signal", confidence `low`); an
  inconclusive result with nothing to say stays on the card alone. Use the format
  from the shared `state.md` (in `project-growth-context`'s `references/`), with
  confidence `low`, `medium` or `high`. If it contradicts an existing entry, update that
  entry with the date instead of adding a silent contradiction.
- Name the follow-up: scale it, rerun it larger, test the next variable, or stop. A
  follow-up test is a new card.

## 7. Save

Cards live at `<state>/experiments/EXP-NNN-<slug>.md`, numbered from the highest existing
id. Status moves `proposed` (designed, still missing a baseline or instrumentation) →
`ready` (complete, waiting for a slot) → `running` → `closed`, or `dropped` with a reason.
Only the owner's word moves a card to `running`; record the date they give, and if it is
earlier than the card, note that the design was written after the start. Put the
experiment id in the `experiment` column of any content-log rows that belong to it.

End with three lines: what is running and when each is judged; the one experiment to start
next and why; the data needed to close the oldest running one.
