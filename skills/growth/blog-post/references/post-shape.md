# Post shape

```mdx
---
title: "How long does it take to build an MVP?"
description: "Four weeks for a first version, if the scope is decided. Here is the week-by-week shape and what makes it slip."
date: "2026-09-18"
---

<The answer, in the first two sentences. Then one sentence on what the rest of the post
covers, only if it is not obvious.>

## <A question the reader has, or a plain claim>

<Two to four short paragraphs. One idea. A concrete example from a real product where
possible, named only if cleared.>

## <Next question>

<If comparing options or timelines, a table:>

| Option | Time to first version | What you own | Where it breaks |
| --- | --- | --- | --- |

## <The objection>

<Address the thing a sceptical founder is thinking. Say what the honest downside is.>

## What to do next

<One paragraph that turns the answer into a decision the reader can make this week.>

If you have a product that needs to be live this quarter, book a free 30-minute call. You
leave with a plan and a fixed quote.
```

## Constraints the route imposes

- File name is the slug: lowercase letters, digits, hyphens only (`/^[a-z0-9-]+$/`).
- Frontmatter fields are `title`, `description`, `date` (ISO). Anything else is ignored.
- Plain MDX: headings, paragraphs, lists, tables, links, code blocks. No imported
  components, no HTML islands; the route renders with `next-mdx-remote/rsc` and the
  `.prose-site` utility.
- Newest post first is by `date`, so two posts on one day sort arbitrarily.

## Types that work for QBLab

| Type | Query intent | Anchor |
| --- | --- | --- |
| Honest cost or time explainer | cost and time | the four-week shape, public market ranges with sources |
| Ownership and lock-in explainer | trust | the site's ownership stance, one anonymised story |
| Comparison with a stated winner | comparison | a decision from a real engagement |
| Build log | sector | a shipped product, elapsed time from commits |
| "What we ask on the call" | hire | the questions that change the estimate |

## Do not write

Listicles of tools, "trends in 2026", anything about AI in general, anything that could be
published by any agency by changing the logo.
