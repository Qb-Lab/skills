---
name: content-ideas
description: >
  Generate content ideas for any project by strategic purpose (demonstration, pain, proof,
  opinion, objection handling and more), scored and ranked, checked against what was already
  published so nothing repeats, and logged to the project's content memory. Use when the
  user says "what should we post", "give me content ideas", "I've run out of things to post
  about", "ideas for TikTok / LinkedIn / the launch", or when a content calendar has empty
  slots.
disable-model-invocation: true
argument-hint: "<count, bucket, channel or theme; default 10 ideas for the current objective>"
---

# Content ideas

An idea is worth making when it does a job for the current objective, rests on something
true about this project, and has not been said already. So generate by purpose, not by
brainstorm: decide what the content has to achieve, then find the evidence that can carry
it. Ten ideas the owner will actually make beat fifty they will scroll past.

## 1. Load project context

Find the installed `project-growth-context` skill (a directory named
`project-growth-context` containing `SKILL.md`, wherever the host installs skills) and
follow it: resolve the project and `<state>`, load or build the context, and apply its
rules. If it is not installed, say so with the install command
(`npx skills add qb-lab/skills --skill project-growth-context`) and continue from the
repository alone: nothing is read from or written to growth state, and the output says so.

This skill depends on the context's Product, Audience, Brand, Channels, Goals and Content
rules sections, and on `<state>/content-log.csv`, `learnings.md`, `strategy.md`,
`audience.md` and the newest file in `radar/`.

## 2. Read what already exists

- `content-log.csv`: every row. Note what was published and how it did, and which `idea`
  rows are still open. Open ideas are not regenerated; the best of them are resurfaced.
- `learnings.md`: which buckets, formats and hooks have evidence for or against them. A
  pattern with evidence against it is not proposed again unchanged.
- `strategy.md`: the objective, the messaging pillars, the ranked channels. If it is
  missing, aim at the context's 90-day objective and say in one line that
  `growth-strategist` would sharpen the mix.
- `audience.md`: pains, objections and the verbatim language bank. If it is missing, use the
  context's Audience lines, treat them as Inferred, and say `audience-intelligence` would
  sharpen the hooks.

## 3. Collect the raw material

List the material before writing a single idea, each line with its source:

- product changes a user would notice: the changelog and the last 30 days of the git log;
- what is demonstrable in under 30 seconds (from the context), and the assets on hand:
  screenshots, recordings, photos, numbers the owner supplied;
- dated signals from the newest radar file;
- the audience's own words: complaints, questions, objections, with their URLs;
- decisions and opinions the team actually holds: docs, plan files, commit and PR messages,
  things the owner has said in this session;
- real customer stories and results, only when the owner supplied them with permission.

An idea that cannot point at a line in this list is not generated.

## 4. Choose the buckets

Read `references/content-buckets.md` (relative to this skill's folder). Take the mix for the
project's objective and stage from its mix table, then narrow by the argument (a bucket, a
channel, a theme, a count). Drop every bucket whose required evidence does not exist: no
real customer means no customer story; no real numbers means no proof post. Apply the
context's Content rules: a founder who is not visible gets no talking-head ideas; humor not
allowed means no meme bucket. Say which buckets were dropped and what would unlock each.

## 5. Write the ideas

Generate about twice the requested count, then cut. Each idea has one bucket, one primary
channel from the strategy's ranked channels (without a strategy: the context's active
channels, plus at most one starting channel for this project type from the shared
`project-types.md`, flagged as untested), a format native to that channel (the shared
`platform-playbook.md`, in `project-growth-context`'s `references/`), the concept in under
fifteen words, a hook written to the shared `hooks.md`, the evidence behind it, and the
asset it needs.

- If the idea would work unchanged for a competitor, it is a topic, not an idea. Bad: "Share
  tips on saving money." Good: "Screen-record the 'safe to spend' number dropping the moment
  rent posts; no voiceover, the caption does the talking."
- An idea goes to a second channel only when it earns its own hook and format there; that is
  a second row, not a repost.
- A trend response needs a dated radar entry. Never cite a trend from memory.

## 6. Dedupe, score, rank

Apply the repeat rule in the shared `state.md` (in `project-growth-context`'s
`references/`): same bucket and same core claim in the last 60 days, or the same hook ever,
is a repeat. A repeat survives only as a
deliberate follow-up to a `published` row with a strong `result`, and its notes say so.

Score what is left with `references/scoring.md`. Ideas whose evidence is `INPUT_NEEDED` go
to a "blocked on input" list with the exact input that would unblock them; they are not
ranked. Keep the requested count.

## 7. Output and log

Print one ranked table: id, bucket, channel, format, idea, hook, evidence, score, effort,
asset needed. Under it: the blocked-on-input list, then the dropped buckets. Append the kept
ideas to `<state>/content-log.csv` with status `idea` and the next free ids, creating the
file with its header row if it is missing. Do not draft the content here; the
`human-content-writer`, `short-video-director` and `creative-director` skills do that, and
`content-calendar` schedules it.

End with the three ideas to make first, one line each with the reason. Nothing else.
