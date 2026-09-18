---
name: linkedin-post
description: >
  Draft LinkedIn posts in QBLab's voice from something real: a case study, a commit range
  that shipped, a topic, or the week's work. Produces three variants with hooks, a suggested
  visual and posting time, and keeps a log so posts are never repeated. Use when the user
  says "write a LinkedIn post about <x>", "what should I post this week", or "turn this
  case study into a post".
disable-model-invocation: true
argument-hint: <case study slug, commit range, topic, or "weekly">
---

# LinkedIn post

Speed is QBLab's promise, so the best post is proof of speed: what shipped, for whom, in
how many days. Write from evidence, never from a content calendar of generic advice. Draft
only; the owner posts.

## 1. Load QBLab context

Find the installed `qblab-context` skill (a directory named `qblab-context` containing
`SKILL.md`, wherever the host installs skills) and follow it. The LinkedIn notes in
`voice.md` and the banned-phrase list apply to every word. The overlay's NDA list decides
which clients and products may be named; anything not cleared is described generically
("a clinic group", "a meal-planning app").

## 2. Pick the source

Resolve the argument:

- **Case study slug or product name:** read its entry from the qblab.co repo's
  `content/work.ts` if the current directory is that repo, else from
  `~/.qblab/case-studies/<slug>.md`, else from `proof.md`. Use only supplied fields.
- **Commit range** (for example `main@{7.days.ago}..main` or two SHAs) in the current
  repository: read the log, group commits into two to four things a client would notice,
  and compute elapsed days from the first and last commit dates. Those dates are the only
  numbers you may use.
- **Topic:** a lesson or opinion. Anchor it in one real thing that happened; if there is no
  real anchor, say so and ask for one rather than writing a generic take.
- **`weekly`** or no argument: scan the current repository's log for the last seven days
  and `~/.qblab/posts/log.md` for what was already posted, then choose the most showable
  thing not yet used. Also produce a two-week plan of four to six post ideas from the
  available sources, each one line.

Before writing, check `~/.qblab/posts/log.md`; if the same source was posted in the last
30 days, pick a different angle and say why.

## 3. Write three variants

Use the patterns in `references/post-patterns.md` (relative to this skill's folder): a
build-log post, a lesson post, and a founder-question post, all from the same source.
For each:

- Hook line of at most twelve words that stands alone; no "excited to announce".
- Body under 150 words, one idea, short lines, a blank line between thoughts.
- Numbers only from commit dates or `proof.md`. "AI-assisted" is shown by what shipped and
  how fast, not claimed as a headline.
- One ending: a plain invite to the free 30-minute call (booking link from the overlay), a
  "DM me", or a question. At most three hashtags.
- A suggested visual (which screenshot, a short screen recording, or none) and a suggested
  slot: Tuesday to Thursday, 08:00 to 10:00 Asia/Dubai, unless the log shows a better day.

## 4. Save and log

Save `~/.qblab/posts/YYYY-MM-DD-<slug>.md` with the three variants and a `status: draft`
line. Append one row to `~/.qblab/posts/log.md` (date, source, hook of the recommended
variant, status `draft`); create the file with a header row if missing. The owner updates
the row to `posted` and adds results later; never mark anything posted yourself.

End with the recommended variant's hook, why it wins, and the visual to attach. Nothing
else.
