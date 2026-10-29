---
name: growth-content
description: >
  Turn what prospect research keeps finding into a weekly plan of two or three LinkedIn
  posts for the agency: real operational problems, before-and-after workflows, automation
  opportunities, engineering lessons and industry-specific challenges, with hypothetical
  examples clearly labelled and no invented results. Use when the user says "what should I
  post this week from the leads work", "content from prospect research", or at the end of
  the weekly sales review.
disable-model-invocation: true
argument-hint: "[week such as 2026-W45]"
---

# Growth content

Research on dozens of companies in one industry shows patterns no single client could:
how enquiries flow, where people re-type data, what everyone is hiring for. Those
patterns, told plainly, are the agency's most credible content. Draft only; the owner
posts.

## 1. Load the shared rules and voice

Find the installed `leadgen` skill and read `references/rules.md` and
`references/workspace.md`. When the agency id is `qblab`, load `qblab-context` and follow
`voice.md` and `proof.md`; also read the installed `linkedin-post` skill's
`references/post-patterns.md` and its posting log, and do not repeat a source it already
used.

## 2. Collect patterns

From this week's and last week's `runs/*/research/*.json`: count how often each fact type
and hypothesis appeared (for example "9 of 14 brokerages route enquiries to WhatsApp"),
and the objections from the latest weekly review. Counts are from your own research and
are labelled as such ("in the 14 company websites we read this month"). Never name a
prospect, quote their site, or describe a company in a way that identifies it.

## 3. Choose two or three posts

One per category at most, from: a real automation problem seen in research; a
before/after workflow (clearly labelled as an illustration); an engineering lesson from
the agency's own shipped work in `proof.md`; an industry-specific operational challenge;
a technical founder insight. Prefer the pattern with the highest count.

## 4. Draft

Per post: hook line, body under 200 words, the evidence line (where the pattern came from),
a suggested visual, and a posting day. Hypothetical examples start with "Illustration:"
or "For example, a typical setup looks like" and never carry numbers that look like
results. No client outcomes unless `proof.md` or the private overlay lists them.

## 5. Save

Write `reports/content-<iso-week>.md` with the calendar (day, post, category, status
`draft`). Nothing is posted or scheduled on any platform.
