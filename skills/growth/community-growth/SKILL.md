---
name: community-growth
description: >
  Grow a project through real communities without spamming them: map the subreddits,
  Discord and Slack groups, forums, Facebook and LinkedIn groups, X conversations and niche
  sites where the audience already talks, then surface the questions worth answering,
  discussions worth joining, topics worth posting and the rare honest moments to mention
  the product, each with a promo-risk flag and a draft reply. Also builds a short, researched
  list of creators or streamers and one personal pitch each. Use when the user says "find
  communities for this product", "where should we be active", "any threads worth replying
  to today", "how do I promote this on Reddit without getting banned", "which streamers or
  creators should I pitch", or "community radar".
disable-model-invocation: true
argument-hint: "<map | daily | creators | community name or URL; map on first run, then daily>"
---

# Community growth

Communities reward people who make them better and remove people who use them as an ad
slot. The only route that works is a ladder: contribute, build trust, earn attention, then
mention the product when it is the honest answer to the question asked. This skill finds
where to climb and what to say on each rung. The owner does the talking; the agent never
posts, votes, messages or joins anything.

## 1. Load project context

Find the installed `project-growth-context` skill (a directory named
`project-growth-context` containing `SKILL.md`, wherever the host installs skills) and
follow it: resolve the project and `<state>`, load or build the context, and apply its
rules. If it is not installed, say so with the install command
(`npx skills add qb-lab/skills --skill project-growth-context`) and continue from the
repository alone: nothing is read from or written to growth state, and the output says so.

This skill depends on the context's Product, Audience, Channels, Content rules and
Constraints sections, and reads `<state>/audience.md` (communities and language bank),
`<state>/communities.md`, `<state>/learnings.md` and the newest `<state>/radar/` file when
they exist.

## 2. Pick the mode

- **`map`** (default when `communities.md` does not exist): build the community map.
- **`daily`** (default once it exists): find today's conversations in the mapped
  communities.
- **A community name or URL:** map that one community in depth, or refresh its row.
- **`creators`:** when the audience follows people (streamers for a game, creators for a
  consumer app or a store, tutorial makers for a developer tool), build a list of five to
  ten who already cover this genre and draft one personal pitch each, following
  `references/creator-outreach.md` (relative to this skill's folder).

Both modes need live reading of public pages. Without a web capability (shared
`capabilities.md`, in `project-growth-context`'s `references/`), say so; for `map`, ask the
owner which communities they already know and record those rows with rules marked
`INPUT_NEEDED: read the rules`; for `daily`, work only from threads the owner pastes.

## 3. Map

Find candidates from `audience.md`, the context's Channels, competitor mentions and
searches for the problem in the audience's words. Keep five to ten when research supports that many (fewer is fine); a long list is never
worked. For each, read the rules page and a week of recent posts before judging it, then
fill a row of `references/community-map-template.md`:
name, URL, platform, visible size, the self-promotion rule quoted with its source, our
standing (`none`, `lurker`, `contributor`, `known`), promo risk (`low`, `medium`, `high`),
and what earns attention there. Choose two or three to invest in first and say why; the
rest are parked. Standing is the owner's to state; never assume an account or history.

Drop a community when the audience is not actually there, when it is mostly other vendors
promoting to each other, or when its rules forbid what the project would need to do.

## 4. Daily

For each invested community, read what is new and pick at most five items across all of
them. Zero is a valid result. Each item is one of:

- **Question worth answering:** the owner has real expertise; the answer stands without
  the product.
- **Discussion worth joining:** a view or an experience the owner can add, not a "+1".
- **Topic worth posting:** something the community would thank them for (a teardown, a
  dataset, a lesson with numbers the owner really has, a free tool).
- **Product mention opportunity:** someone asked for exactly this, or the rules provide a
  showcase thread. Rare by design.

For each: the URL, why this one and why the owner, the substance of a useful contribution
in three or four bullets, a draft reply in the owner's voice, and a promo-risk flag with
the reason. Follow `references/engagement-rules.md` for the ladder, the risk levels and
the reply rules. Drafts follow the shared `platform-playbook.md` and `quality-bar.md`:
value first, conversational, no corporate copy, no link unless it is the answer.

## 5. Hard rules

- The agent never posts, comments, votes, reacts, sends direct messages, joins a server or
  creates an account. Output is drafts and a map.
- No sockpuppets, no astroturfing, no asking others to pose as customers, no vote rings.
- Read the rules before drafting. If the rule is unclear, the risk is `high`.
- Whenever the product is mentioned, the draft discloses the affiliation in plain words
  ("I build this").
- One reply per thread, written for that thread. Never the same text in two places.
- Standing decides what is allowed: with `none` or `lurker`, drafts contain no product
  mention at all, whatever the opening.
- No mass messaging, and no direct messages to community members. Creator outreach is the
  one exception to "do not contact": individual, researched pitches to people who publish
  a route for them, under the rules in `references/creator-outreach.md`.

## 6. Save

`map` writes `<state>/communities.md`. `daily` writes `<state>/community/YYYY-MM-DD.md`
and updates `last checked` in the map. When the owner says a draft was posted, add a
`comment` or `text` row to `content-log.csv` with channel `community:<name>` and the URL,
and move standing up only on the owner's word. A removal or a warning is logged in the map
and in `learnings.md`. If the context extends `qblab-context`, replies speak as the owner
of an agency: the same ladder, and no pitching in threads.

End `daily` with the top three conversations to join today, one line each (community,
thread, the contribution in ten words, risk), or "None worth it today". End `map` with the
two or three communities to invest in and the first thing to do in each; end `creators`
with the first pitch to send and why that person.
