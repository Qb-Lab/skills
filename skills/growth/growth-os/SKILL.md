---
name: growth-os
description: >
  Run growth for any project as its head of growth: load the project's context, judge its
  stage and the one objective that matters now, check what evidence and data exist, route
  each job to the focused growth skill that owns it (audience, market radar, strategy,
  experiments, content ideas, calendar, copy, creative, video, community, launch, analytics,
  review), and return a short prioritised plan, the week's actions and a recurring routine.
  Use when the user says "grow this app", "use growth-os", "I want to grow this product",
  "what should I do next for growth", "plan this week's marketing", "why aren't we growing",
  or "set up a marketing routine".
disable-model-invocation: true
argument-hint: "[next | diagnose | ideas | weekly | midweek | review | monthly | daily | launch <what> | routine] [goal in your words]"
---

# Growth OS

Act as this project's head of growth: decide what matters now, hand each job to the skill
that owns it, and come back with a short list of things to do. This skill coordinates; it
does not contain the other skills' instructions and must not grow to. One objective at a
time. The output is a plan the owner can execute this week with the people and hours they
actually have, not a strategy deck.

## 1. Load project context

Find the installed `project-growth-context` skill (a directory named
`project-growth-context` containing `SKILL.md`, wherever the host installs skills) and
follow it: resolve the project and `<state>`, load or build the context, and apply its
rules. If it is not installed, say so with the install command
(`npx skills add qb-lab/skills --skill project-growth-context`) and continue from the
repository alone: nothing is read from or written to growth state, and the output says so.

This skill depends on every section of the context and reads the whole of `<state>`.

## 2. Take stock

Before choosing anything, look at what exists under `<state>` and how old it is: the
context and its open inputs, `audience.md`, `strategy.md`, `learnings.md`, the newest
`radar/` file, `content-log.csv` (rows by status), `experiments/` (running, closed), the
current `plans/` file, the last `reviews/` file, `campaigns/`, `routine.yaml`, and whether
any analytics source is reachable (the shared `capabilities.md`, in
`project-growth-context`'s `references/`).

Then state the position in six lines or fewer: type and stage, the objective, what is in
place and fresh, what is missing or stale, what data is available, and the biggest open
input. Stage and objective follow the shared `project-types.md`. A goal the owner gave in
the argument is the objective, unless the stage makes it premature (a follower target for
a product nobody can use yet); then say so plainly and name the objective that comes first.

## 3. Pick the mode

| Argument | Job | Detail |
| --- | --- | --- |
| none, or a goal | first pass or full refresh: context to plan | `references/modes.md` |
| `next` | the one thing to do now, from the current plan; no new research | same file |
| `diagnose` | find the bottleneck when growth is not happening | same file |
| `ideas` | content ideas for the current objective | same file |
| `weekly` | Monday: review inputs, set the week's objective, experiments, content and targets | same file |
| `midweek` | Wednesday check | follows `growth-review` |
| `review` / `monthly` | Friday retrospective / monthly strategy review | follows `growth-review` |
| `daily` | trend radar and community radar; a content action only if something is time-sensitive | same file |
| `launch <what>` | integrated launch campaign | follows `launch-campaign` |
| `routine` | create or update the recurring routine and its scheduling | `references/routines.md` |

Read `references/modes.md` (relative to this skill's folder) for the chosen mode's recipe
and follow only that recipe.

## 4. Route, do not re-implement

- Call a skill by finding the installed skill of that name and following its `SKILL.md`,
  passing the mode or argument the recipe gives. Its output lands in `<state>`; read the
  result from there rather than carrying it in your head.
- A followed skill's own "End with" lines apply when it runs alone. When routed from here,
  take its result from `<state>` and carry on with the recipe.
- Run only what the mode needs. Skip a skill whose output is fresh: `audience.md` under 90
  days, `strategy.md` under 30 days or newer than the last monthly review, a radar file
  under 7 days. Say what was reused.
- If a needed skill is not installed, name it with its install command, do the smallest
  useful version of its job from the shared references, and label that part "reduced".
- Independent research jobs (audience, radar, community map) may run in parallel when the
  host supports parallel agents; otherwise run them in the recipe's order.
- No skill is run to fill a quota. "Nothing worth doing today" is a valid daily result.
- When the context extends `qblab-context`, the existing QBLab skills own their jobs
  (LinkedIn posts, site articles, outbound, site search, the weekly funnel, case studies):
  route by the table in `project-growth-context`'s section 3. The generic skills cover
  what those do not.

## 5. Write the plan

For the default and `weekly` modes, fill `references/plan-template.md` and save it to
`<state>/plans/YYYY-Www.md` (ISO week): one objective with its metric and target, why this
and not the alternatives, two to four experiments, the content and distribution for the
week, measurable targets, a ranked action table, and what is blocked on the owner.

Rules: at most three actions are marked **now**. Every action names what done looks like
and fits the capacity line in the context. Anything that depends on a fact nobody has is
listed under "Blocked on input" with the `INPUT_NEEDED` item, not disguised as a task.

## 6. Keep the routine honest

If `<state>/routine.yaml` does not exist after the first plan, propose one from
`references/routines.md`, sized to the owner's capacity, and write it with the chosen
entries `recommended` and the ones left out `paused`. Ask for the time zone if the context
does not give one; unanswered, it is `INPUT_NEEDED`. Offer real scheduling through `references/scheduler-handoff.md`. An entry
becomes `scheduled` only when a scheduler was actually configured in this session or the
owner confirms one; never write or say that something "will run" otherwise.

End with **Now:** the single action to do today in one sentence, then the next two actions,
one line each, then the one input from the owner that would most improve the plan.
