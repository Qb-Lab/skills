---
name: audience-intelligence
description: >
  Work out who actually cares about a product, from evidence: segments defined by situation
  and trigger, jobs to be done, a pain hierarchy, buying triggers, objections, alternatives,
  the communities and searches they use, the words they say, and why they would share it.
  For B2B it maps user, champion, buyer, decision maker and blocker. Use when the user says
  "who is this for", "find our ICP", "research the audience", "who would pay for this",
  "what do users complain about", or "how do our customers talk about this problem".
disable-model-invocation: true
argument-hint: "<segment or question; defaults to a full pass>"
---

# Audience intelligence

An audience profile is only useful if it changes a marketing decision: where to show up,
what to say first, which objection to answer. So segments are defined by the situation a
person is in and the trigger that makes them look for a fix, never by demographics, and
every line traces to something a real person wrote, searched or did. No fictional personas:
"Sarah, 34, marketing manager, loves coffee" is banned in every form.

## 1. Load project context

Find the installed `project-growth-context` skill (a directory named
`project-growth-context` containing `SKILL.md`, wherever the host installs skills) and
follow it: resolve the project and `<state>`, load or build the context, and apply its
rules. If it is not installed, say so with the install command
(`npx skills add qb-lab/skills --skill project-growth-context`) and continue from the
repository alone: nothing is read from or written to growth state, and the output says so.

This skill depends on the context's Product, Audience, Positioning, Competitors and
Constraints sections, and reads `<state>/audience.md` (to refine rather than restart),
`<state>/learnings.md` and `<state>/radar/competitors.md` when they exist.

## 2. Decide the question

A full pass covers every section of the template that evidence can fill. A narrower argument
("why do trial users
not convert", "the agency segment") researches only that and updates only the affected
sections. Either way, write down the two or three marketing decisions the answer should
settle before researching; research that settles nothing is not done.

## 3. Collect evidence, strongest first

1. **Real users and customers.** The owner's customer list, support tickets, sales notes,
   reviews of this product, analytics segments. Ask for them once; never guess who the
   customers are.
2. **People describing the problem unprompted.** Reviews of competitors and substitutes
   (the three-star ones say the most), community threads, forum questions, comment
   sections on the category's popular content.
3. **Search behaviour.** Autocomplete and "people also ask" for the problem in the
   audience's words, comparison and "alternative to" queries, app-store search suggestions.
4. **The category's own material.** Competitor landing pages and pricing tiers show who
   they think the buyer is; treat that as their hypothesis, not as fact.

If the host has web search, spend most of the effort on the second source. Record a URL and
date for every observation, and collect short verbatim quotes (under 25 words) for the
language bank. Public pages only: no logins, no sign-ups, no scraping behind a wall, and no
personal data beyond what a quote needs (no usernames in the output).

**Without web research:** say so first. Work from the repository and one batch of at most
six owner questions (who bought or used it and how they found it; what they did before;
what nearly stopped them; the exact words they use for the problem; who else was involved
in the decision; who churned and why), skipping any the context already answers. What the
owner states about real users is Observed with an owner tag; everything reasoned from it
is Hypothesis, with the specific searches and sources that would confirm each.

## 4. Build the profile

- **Segments:** one primary, up to two secondary. A segment is "people in <situation> who
  hit <trigger>", for example "freelancers who just lost a day reconciling invoices at
  quarter end". If two segments would get the same message on the same channel, they are
  one segment.
- **Jobs, pains, triggers, objections, alternatives:** ranked, not listed. The pain
  hierarchy orders pains by how often they appear in the evidence and how much people
  already spend (time, money, workarounds) to relieve them.
- **B2B only:** user, champion, buyer, decision maker, blocker; what each needs to hear and
  what proof each asks for. Mark roles you could not evidence as Hypothesis.
- **Where and how:** communities, searches, content they already consume, and the reasons
  they would share the product (status, usefulness to a peer, a visible output, a reward).
- **Language bank:** their phrases for the problem, the desired outcome and the
  alternatives, each with its source. Copy is written from this, not from the product's
  own vocabulary.

Tag every claim Observed (with source), Inferred (say from what) or Hypothesis. Count the
evidence: "9 of 14 competitor reviews mention setup time" beats "users find setup hard".
A sample that small is still written as a count, never as a percentage of the market.

## 5. Save and propagate

Fill `references/audience-template.md` (relative to this skill's folder) and save it to
`<state>/audience.md`; on a refresh, keep confirmed lines and mark what changed with the
date. Update the context's Audience summary lines with source tags. Add any competitor or
community found on the way to the context or to `<state>/communities.md` if that file
exists. If the context extends `qblab-context`, its `icp.md` is the profile of record:
report differences the evidence shows instead of writing a rival one.

End with four lines, nothing else: the primary segment in one sentence; its top pain; the
trigger that makes them look; where to find them this week.
