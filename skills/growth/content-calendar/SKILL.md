---
name: content-calendar
description: >
  Turn a project's strategy and logged content ideas into an executable 7, 14 or 30 day
  publishing plan across its real channels (TikTok, Instagram, LinkedIn, X, Reddit, YouTube
  and Shorts, Product Hunt, blog, email, communities), sized to the time the owner actually
  has, with each item adapted to its platform. Use when the user says "plan this week's
  content", "build a content calendar", "what do we post when", "schedule these ideas", or
  "plan the next 30 days of posts".
disable-model-invocation: true
argument-hint: "<7 | 14 | 30> [start date] [channels]; default 7 days from the next Monday"
---

# Content calendar

A calendar is a promise about the owner's time, so it is sized from capacity, not ambition.
Three items that ship beat ten that slip. Every slot is filled by an idea that earned it; a
slot with no good idea stays empty. This skill plans and tracks; it does not write the
content and it never schedules anything on a platform.

## 1. Load project context

Find the installed `project-growth-context` skill (a directory named
`project-growth-context` containing `SKILL.md`, wherever the host installs skills) and
follow it: resolve the project and `<state>`, load or build the context, and apply its
rules. If it is not installed, say so with the install command
(`npx skills add qb-lab/skills --skill project-growth-context`) and continue from the
repository alone: nothing is read from or written to growth state, and the output says so.

This skill depends on the context's Channels, Goals, Content rules and Constraints sections,
and on `<state>/strategy.md`, `content-log.csv`, `experiments/`, `campaigns/`, `learnings.md`
and the previous file in `calendar/`.

## 2. Set the window, the channels and the capacity

- **Window:** 7, 14 or 30 days from the argument; default 7 days starting the next Monday.
  State the dates and the time zone from the context's geography (the owner's own time
  zone when the audience is worldwide; `INPUT_NEEDED` if neither is known).
- **Channels:** the strategy's primary and secondary channels, plus at most one experimental
  channel. Without `strategy.md`, use the context's active channels and say
  `growth-strategist` would rank them. A channel named in the argument overrides both. Never
  add a channel because it exists.
- **Capacity:** who makes content and their hours per week, from the context's Content
  rules. Convert hours to slots with the effort budget in `references/calendar-template.md`
  (relative to this skill's folder). If capacity is `INPUT_NEEDED`, ask once; with no
  answer, plan three items a week, label that as an assumption, and keep going.
- **One objective per week.** Take it from the week's `plans/` file if one exists, else the
  strategy's current stage, else the context's 90-day objective.

## 3. Gather the supply

Read the `idea` rows in `content-log.csv`, highest scored first where a score is noted.
Then add the fixed points: milestones from any active campaign in `campaigns/` (they take
their dates as given), content that a running experiment in `experiments/` needs (both
variants, on comparable days), and follow-ups that `learnings.md` or a strong `result` in
the log calls for.

If there are fewer good ideas than slots, find the installed `content-ideas` skill and
follow it for the missing buckets, or leave the slot empty and say so. Never invent filler
to meet a count, and never plan an idea whose evidence is `INPUT_NEEDED`.

## 4. Place the items

Follow the mix rules for the project's stage in `references/calendar-template.md`: the
balance of awareness, engagement, trust and conversion, the anchor-and-derivatives pattern,
and production batching. Then:

- Put the highest-effort item early in the week and leave one day with nothing due; that day
  absorbs the slip.
- Use posting days and times the log's results support. With no results yet, use the
  starting point in the shared `platform-playbook.md` (in `project-growth-context`'s
  `references/`) and mark the slot as untested; do not present a posting time as known.
- Check the previous calendar: an item that slipped is carried forward once, then dropped or
  rethought, not carried forever.

## 5. Adapt each item to its platform

The same idea on two platforms is two items, each with its own hook, format and CTA, written
to the shared `platform-playbook.md` and `hooks.md`. A demo that is a 20-second vertical
video on TikTok is a carousel of four annotated screenshots on LinkedIn and a text post with
one image on Reddit, if it belongs on Reddit at all. Cross-posting the same file with the
same caption is not adaptation; do not plan it.

For each language in the context, plan the item natively per the shared `languages.md`: an
Arabic item is its own row with its own hook, not a translation task attached to an English
row.

## 6. Write the calendar

Fill `references/calendar-template.md`. Every item carries: date, platform, objective,
format, idea, hook, CTA, required asset, effort, status, related experiment, content id.
For 30-day calendars, fix weeks one and two item by item and give weeks three and four as
themes with a slot count; learnings from the first two weeks decide the rest, and the
calendar says when to rerun this skill.

## 7. Save and log

Save `<state>/calendar/YYYY-MM-DD-<N>d.md` using the start date. Move each used row in
`content-log.csv` from `idea` to `planned`, add rows for platform adaptations (same `idea`
text, new id), and fill `campaign` and `experiment` where they apply. Nothing is marked
`drafted` or `published` here.

Print the calendar, then the empty slots and why they are empty.

End with the assets that must be produced first this week, in the order to make them, each
with its due date and the skill that produces it (`human-content-writer`,
`creative-director`, `short-video-director`). Nothing else.
