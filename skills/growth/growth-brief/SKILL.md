---
name: growth-brief
description: >
  Weekly one-page growth brief for QBLab: the site funnel from Mixpanel (visits, CTA clicks,
  bookings, confirmed), pipeline by stage, outreach and follow-ups due, posts drafted versus
  posted, stale proposals, and the single most important action this week. Use when the
  user says "growth brief", "how did the week go", "what should I do this week", or on a
  scheduled Monday run.
disable-model-invocation: true
argument-hint: "<week such as 2026-W38, or last week; defaults to the last 7 days>"
---

# Growth brief

One page, every Monday. Numbers first, then the one thing to do. It reads every file the
other growth skills write and the site's analytics, so it is the place where the whole
system becomes visible. It reports; it does not send, post, or change any status.

## 1. Load QBLab context

Find the installed `qblab-context` skill (a directory named `qblab-context` containing
`SKILL.md`, wherever the host installs skills) and follow it, mainly for the overlay's
capacity, targets, and file locations.

## 2. Define the window

Default: the seven days ending yesterday, compared with the seven days before. Accept a
week argument. State the window at the top of the brief with the time zone Asia/Dubai.

## 3. Collect

**Site funnel (Mixpanel).** Event names are the site's dictionary in
`references/site-events.md` (relative to this skill's folder). If the host has a Mixpanel
tool or the environment provides Mixpanel credentials, pull per-window counts of unique
users for: `Page View`, `Book Call Clicked` (broken down by `location`), `Calendar
Opened`, `Calendar Booked`, `Booking Confirmed` (the canonical count), `Case Study Viewed`
by `slug`, and top `utm_source` for confirmed bookings. Without access, ask the user to
paste the numbers from the Mixpanel funnel report once, or write "no data" in every cell
and continue; never estimate.

**Pipeline files** under `~/.qblab/` (skip any that do not exist and say so):

| File | What to read |
| --- | --- |
| `leads/*.md` | briefs created in the window; proposals created; proposals older than 7 days with no `won` / `lost` note |
| `outreach/pipeline.csv` | rows by status; `next_action_date` on or before today |
| `posts/log.md` | drafted versus posted in the window; last posted date |
| `followups/*.md` and `clients.md` | follow-ups drafted; clients due (launch 30+ days ago and never followed up; subscription with no follow-up in 90 days) |
| `briefs/` | last week's brief, to carry forward its "one action" and check whether it happened |

## 4. Write the brief

Fill `references/brief-template.md`. Rules:

- Numbers in tables, never in prose. This week, last week, change.
- The funnel table always has the same rows in the same order so weeks are comparable.
- "What moved" is at most three bullets, each tied to a number or a file.
- **The one action** is exactly one sentence, chosen by this order of priority: a proposal
  waiting on the owner beats a follow-up due beats an outreach message due beats a post
  to publish beats a new campaign. Say why it beats the alternatives in one line.
- "Stale" lists anything older than its threshold with the date, so nothing silently rots.
- Carry-over: state whether last week's one action was done, in one line, no judgement.

## 5. Save

Save `~/.qblab/briefs/YYYY-Www.md` (ISO week). If it exists, overwrite it; the brief is a
snapshot, not a log. Print the whole brief.

End with the one action, alone on its own line.
