---
name: human-content-writer
description: >
  Write social and short-form copy for any project that reads like a person wrote it: posts,
  threads, captions, community posts, launch blurbs and short emails for LinkedIn, X, Reddit,
  TikTok, Instagram, YouTube, Product Hunt and email, in the project's own voice and in the
  requested language, with every claim traced to evidence. Use when the user says "write
  the post for <idea>", "draft a tweet / thread / caption", "write this for Reddit", "make
  this sound less like AI", "write it in Arabic", or hands over a content id or calendar
  item to draft.
disable-model-invocation: true
argument-hint: "<content id, calendar item, or topic> [platform] [mode] [language]"
---

# Human content writer

Default machine copy is recognisable in one line, and readers scroll past it. This skill
writes the way a specific person at this project would: from something that actually
happened, in their register, for one platform at a time, and no more polished than a person
would make it. Drafts only; the owner posts.

## 1. Load project context

Find the installed `project-growth-context` skill (a directory named
`project-growth-context` containing `SKILL.md`, wherever the host installs skills) and
follow it: resolve the project and `<state>`, load or build the context, and apply its
rules. If it is not installed, say so with the install command
(`npx skills add qb-lab/skills --skill project-growth-context`) and continue from the
repository alone: nothing is read from or written to growth state, and the output says so.

This skill depends on the context's Product, Audience, Brand, Content rules and Constraints
sections, and on `<state>/content-log.csv`, `audience.md`, the current `calendar/` file and
earlier files in `drafts/`.

## 2. Resolve the job

- **A content id or calendar item:** read its row: channel, format, bucket, idea, hook,
  source. The row decides the platform; an argument can override the mode or language.
- **A topic:** pick the platform from the argument, else the strategy's primary channel.
  Check the content log for a repeat under the rule in the shared `state.md` (in
  `project-growth-context`'s `references/`) before writing, and say so if it is one.
- **Mode** (founder, professional, educational, humorous, technical, opinionated): from the
  argument, else from the context's Brand and Content rules. See `references/voice-modes.md`
  (relative to this skill's folder).

When the context extends `qblab-context`: a LinkedIn post goes to the installed
`linkedin-post` skill and a site article to `blog-post`; find it and follow it instead of
writing here. Everything else, and every other project's LinkedIn, is written by this skill.
Long articles for other projects are allowed but are not the focus: apply the same steps and
the blog notes in the shared `platform-playbook.md`.

## 3. Find the voice

In this order, stopping when there is enough to imitate: the context's Brand section (tone,
vocabulary, banned phrases); existing copy in the repository (landing page, onboarding,
emails, README); the owner's own past posts. In founder mode with no samples on file, ask
once for two or three posts the owner wrote and liked, then save the traits you observe
(sentence length, how they open, what they never say) to the context's Brand section so no
later run asks again. Imitate traits, never reuse sentences.

## 4. Gather the evidence, then state the point

Collect what the piece will stand on: the commit, the screenshot, the number with its
source, the audience quote with its URL, the decision and who made it. Then write the point
in one sentence a stranger would understand. If the point needs "and", it is two posts; pick
one. If there is no evidence, there is no post: say what is missing instead of writing
around it.

## 5. Draft two variants

Write for the one platform, to the shape in the shared `platform-playbook.md` and with an
opening built from the shared `hooks.md` (both in `project-growth-context`'s `references/`).
Two variants that differ in **angle** (the story versus the claim; the problem versus the
result), never the same post reworded. Rules:

- Start in the middle. No greeting, no announcement, no scene-setting sentence.
- Use the audience's words from `audience.md`, not the category's.
- Imperfect where a person would be: uneven sentence length, a fragment where it lands, no
  tidy closing line. Not fake typos, and not lowercase as a costume unless the voice
  already writes that way.
- One ending: a question you want answered, one action, or nothing. Stop when it is said.
- For Arabic or any other language, write natively from the evidence per the shared
  `languages.md`; never translate the English variant. Dialect comes from the context.

`references/rewrite-examples.md` shows the gap between default copy and publishable copy on
each platform. Read it before the first draft of a session.

## 6. Edit, then check the claims

**Edit pass**, against the shared `quality-bar.md`: remove every banned phrase and
structural tell it lists, then read the draft as the reader and cut each sentence they
would skim. If cutting leaves nothing, the idea was the problem; go back to step 4.

**Claims check**, line by line: every number, outcome, customer, name and comparison is
traced to a source in the context, the repository or the owner's words. Anything untraced
is cut, or left visibly as `INPUT_NEEDED: <what>`. Check the context's claims to avoid and
names that must not be used. A competitor is described only by facts with a URL.

For a high-value asset (a launch post, a pinned post, copy that will run as an ad), run one
critique round as the shared `quality-bar.md` defines it. Not for routine posts.

## 7. Save and log

Save `<state>/drafts/YYYY-MM-DD-<slug>.md`: the point, the evidence with sources, both
variants, the recommended one, the asset needed, and any `INPUT_NEEDED` lines. Update the
content-log row to `drafted`, or add a row if the piece came from a topic. Never mark
anything `published`.

End with the recommended variant in full, one line on why it wins, and the asset it needs.
Nothing else.
