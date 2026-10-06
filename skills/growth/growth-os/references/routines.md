# The growth routine

A routine is a small set of recurring runs that keep the loop turning: look, plan, check,
review, learn. It is written to `<state>/routine.yaml` (machine-readable, from
`routine.template.yaml` in this folder) and summarised for the owner in plain words.

An agent skill cannot schedule anything by itself. The routine file is a definition; a
scheduler makes it real. Keep those separate at all times (statuses are defined in the
shared `capabilities.md`).

## The `routine` mode

1. Read the capacity line in the context (who, hours per week) and the active channels.
2. Choose entries from the table below, sized to capacity. State what was left out and why.
3. Ask the owner for the time zone and preferred times if unknown; otherwise write
   `INPUT_NEEDED` for the time zone and leave cron expressions as given.
4. Write `<state>/routine.yaml` with the chosen entries `recommended` and the entries left
   out `paused`, so the owner can switch them on later.
5. Follow `scheduler-handoff.md` to offer real scheduling. Update an entry to `scheduled`
   only after a scheduler is configured or the owner confirms it, and record which one.
6. Print the routine as a short table: when, what runs, where the output lands, status.

On later runs, show the current file, apply the owner's changes, and never reset a
`scheduled` entry to something else without saying so.

## Entries

| Entry | When | Prompt to run | Produces | Time budget |
| --- | --- | --- | --- | --- |
| Trend and community radar | daily, weekday mornings | `Use growth-os daily` | `radar/` and `community/` files; a content action only when something is time-sensitive | 10 minutes of the owner's reading |
| Weekly growth plan | Monday morning | `Use growth-os weekly` | last week's review if missing, an analyst report when data exists, a radar file, `plans/YYYY-Www.md` | 30 minutes to read and adjust |
| Midweek check | Wednesday | `Use growth-os midweek` | are experiments running, a winner to clone, something to stop | 10 minutes |
| Weekly growth review | Friday afternoon | `Use growth-os review` | `reviews/YYYY-Www.md`, new entries in `learnings.md` | 20 minutes |
| Growth strategy review | first Monday of the month | `Use growth-os monthly` | `reviews/YYYY-MM.md`, proposed changes to `strategy.md` | 45 minutes |

What each run reviews and returns is defined by the skill it follows (`growth-review` for
midweek, Friday and monthly; `modes.md` for daily and weekly), not repeated here.

## Sizing to capacity

- **Solo founder, a few hours a week.** Monday plan, Friday review, monthly review. The
  radar runs inside the Monday plan; no daily entry. The midweek check is folded into
  Friday. Three entries a person keeps beat five they ignore.
- **Someone owns growth part-time.** Add the Wednesday check and a radar twice a week
  (Tuesday and Thursday).
- **A team, or a launch window.** All five entries; daily radar on weekdays.
- **Pre-launch.** Monday plan and Friday review only, plus the launch campaign's own
  timeline.

## Rules

- The daily run never produces posts to fill a quota. Most days its correct output is two
  or three lines.
- Every run reads `learnings.md` first and the plan for the current week.
- Unattended runs draft and report. They do not post, send, spend or change a status that
  means something went out.
- A run that needs something only the owner has (an export, a decision) says so at the top
  of its output rather than guessing, so a scheduled run never silently degrades.
- If two consecutive scheduled runs produced nothing the owner acted on, the Friday review
  proposes cutting or slowing that entry.
