---
name: blog-post
description: >
  Write a qblab.co blog post as an MDX file the site's blog route renders (frontmatter
  title, description, date), in QBLab's voice, from a working title or a query family in an
  SEO audit, anchored in real work rather than generic advice. Use when the user says
  "write a blog post about <x>", "draft the post from the audit", or "we need an article
  on <topic>".
disable-model-invocation: true
argument-hint: "<working title, query family, or topic>"
---

# Blog post

The site's blog exists but is gated behind `BLOG_ENABLED` in `content/site.ts`. Posts are
MDX files in `content/blog/<slug>.mdx` with frontmatter `title`, `description`, `date`,
rendered with the `.prose-site` utility. This skill writes a post that fits that plumbing
and QBLab's voice, and reminds the owner what turning the blog on entails. It never flips
the gate.

## 1. Load QBLab context

Find the installed `qblab-context` skill (a directory named `qblab-context` containing
`SKILL.md`, wherever the host installs skills) and follow it. `proof.md` is the only
source of numbers; `voice.md` is the style; the overlay's NDA list decides which client
stories may be told and how.

## 2. Choose the post

- **From an SEO audit**: if `docs/seo/` in the current repo or `~/.qblab/seo/` holds an
  audit, take the working title and query family from its ideas table.
- **From a title or topic**: map it to a query family in the `seo-audit` skill's
  `references/query-map.md` if that skill is installed; otherwise state the search the post
  should answer in one line and continue.

Every post needs **one real anchor**: a shipped product from `proof.md`, a decision from a
real engagement (anonymised per the overlay), or a number QBLab can stand behind. No
anchor, no post: say so and ask for one instead of writing generic advice.

## 3. Write

Follow `references/post-shape.md` (relative to this skill's folder). Rules:

- The title answers the query in the reader's words, under 60 characters, sentence case.
- The description is one sentence under 155 characters that a searcher would click.
- The first paragraph gives the answer. The rest earns it. No "in this article we will".
- 700 to 1,200 words. Headings are questions or plain claims, not puns.
- One idea per section; a table where numbers or comparisons appear; no stock images.
- Prices: only if the post is about cost, and then as public market ranges with sources,
  never as QBLab's price. QBLab's price is given on the call, and the post says so once.
- Ends with the call, in the site's words: book a free 30-minute call, leave with a plan
  and a fixed quote. No other call to action.
- Nothing from the banned list. Read the draft once as the founder it is for and cut
  every sentence they would skim.

## 4. Save

Write `content/blog/<slug>.mdx` when the current directory is the qblab.co repo, with the
frontmatter exactly:

```
---
title: "<title>"
description: "<description>"
date: "<YYYY-MM-DD>"
---
```

Otherwise save the same file under `~/.qblab/posts/blog/`. Also append one row to
`~/.qblab/posts/log.md` (date, source `blog`, title, status `draft`), creating the file
with a header row if missing, so `linkedin-post` can turn it into a post later.

Then run the repo's typecheck and build if defined and report the result; MDX errors show
up at build time.

## 5. Hand off

End with three lines: the slug and word count; the query the post answers; and the reminder
that the blog is gated, with what enabling it changes (routes go live, the sitemap and
feed include posts, and a navigation link is still absent by design until added).
