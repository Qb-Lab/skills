# Growth state

One directory per project. Templates and schemas live in the skills; real project data lives
here and never in the skills catalog.

## Where it lives

| Scope | Path | When |
| --- | --- | --- |
| user (default) | `~/.qblab/growth/<project-id>/` | always, unless the project opted in below |
| project | `<repo>/.growth/` | only when the owner created `.growth/` in the repository |

- `GROWTH_OS_HOME` overrides the user-level base (`~/.qblab/growth`). Useful for tests and
  for owners who keep growth state on a synced drive.
- Project scope is for teams that want the plan versioned with the product. It is committed
  unless the repository ignores it, so before the first write in project scope check whether
  `.growth/` is ignored and tell the owner which case applies. Private facts (unpublished
  pricing, revenue, customer names, raw analytics exports) still go to the user-level
  overlay `~/.qblab/growth/<project-id>/context.local.md`, never into `.growth/`.
- Never create `.growth/` yourself. Suggest it when the owner asks to share the plan with a
  team.

## Project id

Stable, lowercase, hyphenated. Resolution order (`scripts/growth-state.sh` implements it):

1. A name the owner gave ("the Zadi app", a monorepo app name), slugified. Match it against
   existing project directories first so "zadi" and "Zadi app" do not become two projects.
2. `owner-repo` from the `origin` remote of the current repository.
3. The repository's directory name.

One product, one id. A monorepo with two products has two ids, both passed by name. If a
remote is renamed, move the directory rather than starting a second project.

## Files

`<state>` is the resolved directory. Skills create files on first write. Dates are ISO
(`YYYY-MM-DD`), weeks are ISO weeks (`YYYY-Www`).

| Path | Written by | What it is |
| --- | --- | --- |
| `context.md` | project-growth-context (any skill may update a line) | the project's facts, each with a source |
| `context.local.md` (user scope only) | the owner | private overrides; wins on conflict |
| `audience.md` | audience-intelligence | evidence-based segments, jobs, pains, language |
| `strategy.md` | growth-strategist | objective, positioning, channels, loops, 30/60/90 |
| `radar/YYYY-MM-DD.md` | market-radar | dated opportunities with evidence |
| `radar/competitors.md` | market-radar | standing competitor sheet, diffed run to run |
| `communities.md` | community-growth | community map: rules, standing, risk; and the creators list |
| `community/YYYY-MM-DD.md` | community-growth | dated conversations worth joining |
| `content-log.csv` | content-ideas, content-calendar, writers | content memory (schema below) |
| `calendar/YYYY-MM-DD-<N>d.md` | content-calendar | a 7, 14 or 30 day plan starting that date |
| `drafts/YYYY-MM-DD-<slug>.md` | human-content-writer | copy drafts per platform |
| `creative/YYYY-MM-DD-<slug>.md` | creative-director | creative brief, prompt, generated file paths |
| `video/YYYY-MM-DD-<slug>.md` | short-video-director | shot-by-shot script and handoff |
| `campaigns/<slug>/plan.md` | launch-campaign | timeline, assets, owners, status |
| `experiments/EXP-NNN-<slug>.md` | growth-experiment | one card per experiment: `proposed` → `ready` → `running` → `closed`, or `dropped` |
| `analytics/` | the owner | exports dropped in for analysis (CSV, screenshots) |
| `analytics/reports/YYYY-MM-DD.md` | growth-analyst | dated analysis |
| `plans/YYYY-Www.md` | growth-os | the week's objective, experiments, actions |
| `reviews/YYYY-Www.md`, `reviews/YYYY-MM.md` | growth-review | weekly (with the midweek check as a section) and monthly retrospectives |
| `learnings.md` | growth-experiment, growth-analyst, growth-review; community-growth for removals and warnings | what has been proven or disproven |
| `routine.yaml` | growth-os | the recurring routine and its real scheduling status |

## content-log.csv

Content memory. One row per content idea; the row follows the idea through its life. Header
row exactly:

```
id,date,status,channel,format,bucket,idea,hook,source,campaign,experiment,url,result,notes
```

- `id`: `C-0001`, incrementing. Other files refer to content by this id.
- `date`: when the row was created; on publish, the publish date replaces it.
- `status`: `idea` → `planned` → `drafted` → `published`, or `dropped`. Only the owner's
  word or a live URL moves a row to `published`.
- `channel`: one platform per row (`tiktok`, `instagram`, `linkedin`, `x`, `reddit`,
  `youtube`, `youtube-shorts`, `producthunt`, `blog`, `email`, `community:<name>`). An idea
  adapted for a second platform is a second row with the same `idea` text.
- `format`: `short-video`, `carousel`, `image`, `text`, `thread`, `article`, `comment`, …
- `bucket`: the strategic purpose (see the `content-ideas` skill).
- `idea`: the concept in under fifteen words. `hook`: the opening line or first frame.
- `notes`: free text; skills keep the score, effort, planned date and file paths here
  (`score 51; effort S; planned 2026-10-13; brief creative/2026-10-06-cover.md`).
- `source`: the evidence behind it (`commit a1b2c3`, `radar 2026-10-05 #2`, `review of X`).
- `result`: filled after publishing, numbers with their unit and date
  (`1.2k views, 14 profile visits @ 2026-10-12`). Empty means unknown, never zero.

Quote any field containing a comma. Before proposing or writing content, read the log and
treat a new idea as a repeat if the same bucket and the same core claim (the one thing the
piece asserts or shows) appeared on any channel in the last 60 days, or the same hook ever
appeared. Repeats are allowed only as a
deliberate follow-up to a `published` row with a strong `result`, and the notes say so.

## learnings.md

The memory that makes next month's plan better than this month's. One entry per learning,
newest first:

```
## YYYY-MM-DD: <the learning in one sentence>
- Evidence: <experiment id, report, or numbers with sample size>
- Confidence: low | medium | high
- Applies to: <channel, audience, format, message>
- Do: <what changes because of it>
```

Rules: a learning needs evidence, not a feeling. Tiny samples are written down as `low`
confidence and phrased as "early signal". A later result that contradicts an entry updates
that entry (strike it or lower its confidence, with the date) rather than adding a silent
contradiction. Every planning skill reads this file before proposing anything.

## General rules

- Read before writing; append to logs, never rewrite history. Snapshots (`plans/`,
  `reviews/`, `radar/`) are overwritten only for the same date or week.
- If a file a skill expects is missing, say so and continue; a missing file is information
  ("no experiments have been run"), not an error.
- Nothing under `<state>` is ever copied into a public repository, an issue, or a post.
