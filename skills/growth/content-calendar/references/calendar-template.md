# Calendar template and planning rules

## File skeleton

```
# Content calendar: <start date> to <end date> (<N> days, <time zone>)

- Objective this week: <one, with its metric>
- Channels: <primary> · <secondary> · <experimental, if any>
- Capacity: <who, hours per week> (<owner-supplied | assumption>)
- Languages: <from the context>
- Running experiments: <EXP ids, or none>
- Active campaign: <slug and next milestone, or none>

| Date | Platform | Objective | Format | Idea | Hook | CTA | Required asset | Effort | Status | Experiment | Id |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Mon 2026-10-12 | tiktok | awareness | short-video | <under 15 words> | <first frame or line> | <one action, or "none"> | <what must exist, and whether it does> | S / M / L | planned | EXP-003 A | C-0041 |

## Production order
1. <asset> for <id>, due <date>, made with <skill or by the owner>

## Empty slots
- <date, platform>: <why nothing earned it>

## Weeks 3 and 4 (30-day calendars only)
- Week 3 theme: <theme>, <N> slots, decided by: <which result or learning>
- Week 4 theme: <theme>, <N> slots, decided by: <…>
- Rerun on: <date> with the first two weeks' results
```

Objective is one of `awareness`, `engagement`, `trust`, `conversion`. Status starts at
`planned` and follows the content log. CTA `none` is a legitimate choice for awareness items;
a CTA on every post reads as an ad account.

## Effort budget

| Effort | Time to produce | Typical item |
| --- | --- | --- |
| S | up to 30 minutes | text post, reply-style post, screenshot with caption, repurposed clip |
| M | 1 to 2 hours | short video from a screen recording, carousel, thread with visuals, short email |
| L | half a day or more | filmed video, article, launch asset, anything needing another person |

Slots per week from capacity: add up the hours, reserve a quarter for replies and comments
(distribution is part of the job), and spend the rest. Two hours a week is about three S
items or one M and one S. Five hours is roughly one L or two M, plus three S. Never plan
more than one L per person per week.

## Mix by stage

Shares of the week's items. They bend to `learnings.md`: a pattern with evidence gets more
slots, and the calendar says which learning moved it.

| Stage | Awareness | Engagement | Trust | Conversion |
| --- | --- | --- | --- | --- |
| Pre-launch | half | a third | the rest | one waitlist or follow ask per week |
| Launched, no traction yet | half | a fifth | a fifth | one clear ask per week |
| Early traction | a third | a fifth | a third | the rest |
| Growing | a third | a fifth | a quarter | a quarter |

- With three or fewer items in a week, do not split four ways: two awareness and one trust
  or conversion.
- Never two conversion items back to back on the same channel.
- A launch week belongs to its campaign plan; the mix does not apply.

## Anchor and derivatives

One substantial piece a week (the anchor), cut into smaller native pieces (derivatives).
The anchor is whatever the project can make best: a demo recording, a build log, a teardown,
a customer conversation. Derivatives are new items made from it, not excerpts with the same
caption.

Example, for a made-up invoice-extraction SaaS: the anchor is a four-minute screen recording
of a messy supplier invoice going from PDF to the accounting export. Derivatives: a
25-second vertical cut of the one field every other tool gets wrong (short video); the
before and after of the export as two screenshots with one line each (LinkedIn); a text post
on why totals are checked against line items (X); an honest answer in a bookkeeping
community thread where someone asked about exactly this (community, value first, no link
unless asked).

## Batching

- Group production by kind, not by date: record every screen capture in one sitting, write
  every text post in another.
- Items that share an asset are scheduled at least two days apart on the same channel.
- Both variants of an experiment are produced in the same sitting, so the only difference is
  the variable under test.

## Per-item checklist

- [ ] The idea is a row in the content log and is not a repeat under the rule in the
      shared `state.md` (in `project-growth-context`'s `references/`).
- [ ] The hook is written for this platform, not copied from another row.
- [ ] The required asset exists, or its production has an owner and a due date.
- [ ] Every claim in the hook and the idea has a source; nothing is `INPUT_NEEDED`.
- [ ] The CTA is one action, and the place it points to exists and works.
- [ ] For a community platform, the community's self-promotion rule was checked
      (`<state>/communities.md`), and the item gives value without the link.
