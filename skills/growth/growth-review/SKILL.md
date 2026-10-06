---
name: growth-review
description: >
  Growth retrospective for any project: a weekly review (wins, losses, learnings, surprises,
  what to stop, what to double down on, new hypotheses, next week's objective, top three
  actions), a midweek check on running experiments and content, or a monthly strategy review
  that proposes changes to the strategy. Use when the user says "weekly growth review", "how
  did the week go", "midweek check", "what did we learn this month", "monthly growth review",
  or on a scheduled Friday or month-end run.
disable-model-invocation: true
argument-hint: "<weekly | midweek | monthly> [week or month]; default weekly"
---

# Growth review

The review is where the week's work turns into next week's plan. It compares what was
planned with what happened, keeps only the lessons the evidence supports, and ends with one
objective and three actions. It is honest about missed work without commentary, and honest
about small numbers: a week of posts is rarely enough to prove anything, and the review says
so instead of declaring winners.

## 1. Load project context

Find the installed `project-growth-context` skill (a directory named
`project-growth-context` containing `SKILL.md`, wherever the host installs skills) and
follow it: resolve the project and `<state>`, load or build the context, and apply its
rules. If it is not installed, say so with the install command
(`npx skills add qb-lab/skills --skill project-growth-context`) and continue from the
repository alone: nothing is read from or written to growth state, and the output says so.

This skill depends on the context's Goals section, and on `<state>/plans/`,
`<state>/content-log.csv`, `<state>/experiments/`, `<state>/analytics/reports/`,
`<state>/radar/`, `<state>/campaigns/`, `<state>/strategy.md` and `<state>/learnings.md`.

## 2. Resolve the mode and the window

- **`weekly`** or no argument: the ISO week ending on the coming Sunday if run Thursday to
  Sunday, otherwise the week just ended. Accept an explicit week (`2026-W41`).
- **`midweek`**: the current ISO week so far.
- **`monthly`**: the calendar month just ended, or the current one if run in its last five
  days. Accept an explicit month (`2026-10`).

State the window on the first line. Templates for all three are in
`references/review-template.md` (relative to this skill's folder).

## 3. Weekly review

Collect, skipping and naming anything that does not exist:

- The week's `plans/YYYY-Www.md`: the objective, the experiments, the planned actions.
- The content log: rows planned for the week against rows the owner marked `published`.
  Ask the owner once which planned items went out if the log does not say; never assume.
- Experiment cards: started, running, due for judgement, closed this week.
- The newest analyst report covering the week. If there is none and the host has data
  access or the owner has dropped exports in `<state>/analytics/`, find the installed
  `growth-analyst` skill and follow it first. With no data, the review covers execution
  only and says "no performance data this week" where numbers would go.
- Radar and community files dated in the week; campaign plans with milestones in the week.

Then write, in this order: a completion table (planned, done, not done, carried over; facts
only, no judgement), **Wins**, **Losses**, **Learnings**, **Surprises**, **What we should
stop**, **What we should double down on**, **New hypotheses**, **Next week's objective**,
**Top 3 actions**. Rules:

- Every win, loss and learning cites a number with its count, a file, or an experiment id.
  Without evidence it belongs under Surprises or New hypotheses, labelled `Hypothesis`.
- "Double down" needs evidence above the sample minimums the analyst and experiment skills
  use; otherwise write "repeat to confirm". No statistical claims on a week of small numbers.
- Next week's objective is one sentence with one metric, serving the 90-day objective. The
  three actions are concrete, owned and dated, and the first can be started today.
- Missed work is listed with the reason if known. If the same item is carried over a third
  time, the action is to cut it or shrink it, not to carry it again.

## 4. Midweek check

Short, and biased toward changing something while the week can still be saved. Answer four
questions from the plan, the log, the cards and whatever numbers exist:

1. Are the planned experiments actually running? If not, what is blocking each.
2. Is any content performing unusually well or badly against this project's own recent
   posts? Name it with its numbers, or say it is too early to read.
3. Is there a winner worth cloning? If so, hand it on: find the installed `content-ideas`
   skill (and `human-content-writer` for the drafts) and follow it to produce two or three
   variations that change one element each.
4. Is there anything to stop this week: a campaign, a format, an experiment that cannot
   reach its sample?

End the check with at most two changes to the rest of the week.

## 5. Monthly strategy review

Read the month's weekly reviews, every analyst report, closed experiment cards, and
`learnings.md` in full. Answer: which channels produce meaningful outcomes; which content
patterns perform; which audiences respond; which acquisition loops work; what should be
stopped; what should receive more resources; does the positioning need adjusting. Each
answer cites its evidence and its confidence, and "not enough data yet" is an acceptable
answer that names what would settle it.

End with a numbered list of **proposed changes to `strategy.md`**, each as "change <what>
from <current> to <proposed> because <evidence>". Do not edit the strategy here: on the
owner's go-ahead, find the installed `growth-strategist` skill and follow it in `review`
mode with that list.

## 6. When the context extends `qblab-context`

The agency funnel and pipeline are owned by the `growth-brief` skill. Read the brief for
the same ISO week under `~/.qblab/briefs/` and use its numbers and its one action as
inputs, under an "Agency funnel (from growth-brief)" heading; do not rebuild the funnel
here. The brief's window is the seven days before it was run, so state both windows when
they differ. Only if no brief exists for that week, find the installed `growth-brief` skill
and follow it; never rerun one that exists, because a rerun overwrites it.

## 7. Save and record

Save the weekly review to `<state>/reviews/YYYY-Www.md` and the monthly to
`<state>/reviews/YYYY-MM.md`, and print it. The midweek check is saved as a
`## Midweek check` section in the same week's file; the weekly review keeps that section at
the end when it writes the file. Append to `<state>/learnings.md` only learnings that carry
evidence and are not already recorded there by an experiment or an analysis; update an entry
this period contradicts.

End with next week's objective on one line, then the top three actions, numbered.
