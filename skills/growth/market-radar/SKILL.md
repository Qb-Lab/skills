---
name: market-radar
description: >
  Research what is changing around a project right now (competitor moves, adjacent
  products, community complaints, review-site patterns, search and store movement, content
  formats that are working) and return a few dated, evidenced opportunities with a
  recommended response, urgency and confidence. Use when the user says "find opportunities
  for this project this week", "what are competitors doing", "any trends we should react
  to", "run the radar", "what changed in our market", or on a daily or weekly schedule.
disable-model-invocation: true
argument-hint: "<daily | weekly | competitor name | topic; default weekly>"
---

# Market radar

The radar exists to change what gets done this week. It returns a handful of opportunities,
each with evidence someone can click, and it is allowed to return nothing. A trend is
something observed in several independent places with dates; anything recalled from memory
is a lead to verify, never a finding. Fewer, better, dated.

## 1. Load project context

Find the installed `project-growth-context` skill (a directory named
`project-growth-context` containing `SKILL.md`, wherever the host installs skills) and
follow it: resolve the project and `<state>`, load or build the context, and apply its
rules. If it is not installed, say so with the install command
(`npx skills add qb-lab/skills --skill project-growth-context`) and continue from the
repository alone: nothing is read from or written to growth state, and the output says so.

This skill depends on the context's Product, Positioning, Competitors, Channels and
Constraints sections, and reads `<state>/audience.md`, `<state>/strategy.md`, earlier files
in `<state>/radar/` and `<state>/radar/competitors.md` when they exist.

## 2. Check that live research is possible

Check for a web search or fetch capability per the shared `capabilities.md` (in
`project-growth-context`'s `references/`).

- **Available:** continue. Everything reported is from pages read in this run.
- **Not available:** say so in the first line. Analyse only material the owner supplies
  (pasted pages, exports, screenshots, links they summarise). Do not list "trends",
  competitor moves or market shifts from memory, and do not date anything you did not
  read. If nothing was supplied, output the research plan from step 3 as a checklist the
  owner can run, and stop.

## 3. Scope the run

- **`weekly`** (default): the full sweep in `references/research-playbook.md` (relative to
  this skill's folder), time-boxed. Three to five opportunities.
- **`daily`**: only what is new since the last radar file: competitor changelogs and
  launches, the top threads in the mapped communities, anything time-sensitive. Zero to
  two opportunities; "nothing new worth acting on" is a complete and good result.
- **A competitor name:** a deep look at that one product; update its row in
  `competitors.md` and report only what the project should do about it.
- **A topic:** the same playbook narrowed to that question.

Before searching, read the previous radar files. An item already reported is repeated only
if it moved (new evidence, a deadline closer), and the entry says what changed.

## 4. Research

Follow the playbook's sources in order and stop when the time box is spent; list what was
skipped. For every observation record the URL, the date of the thing observed (not the date
you read it), and what exactly was seen. Competitors come from the context or from this
run's research with a URL; a competitor added this run is flagged "new, unconfirmed by
owner". Public pages only. Never copy a competitor's copy, creative or a creator's script
into the output beyond a short quoted fragment as evidence.

## 5. Turn observations into opportunities

An observation becomes an opportunity only if the project can respond with something it
actually has: a feature, a proof point, a channel, an asset. Otherwise it goes on the
"watch" list in one line. For each opportunity fill `references/radar-template.md`:

1. What's changing 2. Why it matters 3. Evidence 4. Opportunity for us
5. Recommended response 6. Urgency 7. Confidence

Rules:

- Label every statement Observed, Inferred or Hypothesis. "Competitor raised its price"
  is Observed with a URL; "their users are looking for alternatives" is Inferred unless
  threads say so; "a comparison page would convert them" is a Hypothesis.
- Urgency is `now` (days, a window closes), `this week`, `this month`, or `watch`.
- Confidence is high only with three or more independent, dated sources or one primary
  source (the competitor's own page). One thread is low, whatever its upvotes.
- The response names the skill that would execute it (`content-ideas`,
  `human-content-writer`, `community-growth`, `growth-experiment`, `launch-campaign`) and
  the first concrete step. It never recommends "monitor closely" as an action.
- Rank by urgency, then by how directly it serves the context's primary objective. Cut
  everything below the fifth.

## 6. Save

Write `<state>/radar/YYYY-MM-DD.md`. Update `<state>/radar/competitors.md`: one row per
competitor (what they are, positioning line, pricing as published, last notable change with
date and URL), changing only rows with new evidence. Add confirmed competitors to the
context with their source. If the context extends `qblab-context`, the market is other
agencies and studios for the same founder; opportunities route to `outreach`,
`linkedin-post` and `blog-post`.

End with one line: the opportunity to act on first and its first step. On a quiet day, end
with "Nothing new worth acting on" and the date of the next thing to check.
