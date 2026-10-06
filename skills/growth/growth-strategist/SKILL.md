---
name: growth-strategist
description: >
  Decide how a project should grow and write it down as a strategy: one primary objective,
  segments, positioning, messaging pillars, ranked channels, the first growth loop, a
  30/60/90 plan, ranked experiments, and this week's first three actions. Adjusts to the
  project type (B2B SaaS, consumer app, marketplace, ecommerce, game, developer tool,
  service, AI product). Use when the user says "how should we grow this", "what's our
  growth strategy", "which channel should we focus on", "write a 90-day growth plan",
  "position this product", or "review the strategy".
disable-model-invocation: true
argument-hint: "<objective or question; 'review' to revise the strategy from learnings>"
---

# Growth strategist

A strategy is a set of choices, and most of its value is in what it rules out. Pick one
objective, one primary channel and one loop, say why, and name what is not being done yet.
Every recommendation must be something only this project could be told; advice that fits
any product in the category is cut. The output is a plan the owner can start on today.

## 1. Load project context

Find the installed `project-growth-context` skill (a directory named
`project-growth-context` containing `SKILL.md`, wherever the host installs skills) and
follow it: resolve the project and `<state>`, load or build the context, and apply its
rules. If it is not installed, say so with the install command
(`npx skills add qb-lab/skills --skill project-growth-context`) and continue from the
repository alone: nothing is read from or written to growth state, and the output says so.

This skill depends on the context's Project, Product, Positioning, Goals, Content rules and
Constraints sections, and reads `<state>/audience.md`, `<state>/learnings.md`, the newest
file in `<state>/radar/`, and `<state>/experiments/` when they exist.

## 2. Read what is already known

- `learnings.md` first. A channel, message or format it has disproven is not proposed again
  unless something material changed, and the strategy says what changed.
- `audience.md` for segments. If it is missing, write one provisional segment from the
  context, label it Hypothesis, and recommend running `audience-intelligence` before the
  60-day mark. Do not build personas here.
- The newest radar file for competitor moves and openings. If there is none, say so in one
  line; `market-radar` would sharpen the channel and positioning choices.
- The shared `project-types.md` (in `project-growth-context`'s `references/`) for the
  starting heuristics of this type and stage. They are a first guess; audience evidence and
  learnings override them, and the strategy says when they did.

## 3. Make the choices

Work in this order; each choice constrains the next.

1. **Objective.** One, with its metric and the baseline (or `INPUT_NEEDED: baseline`). The
   stage decides it: before launch the objective is a validated message and a list; with no
   traction it is the first ten customers or hundred active users, won by hand; with early
   traction it is one repeatable channel. If the owner's stated goal does not fit the
   stage, say so plainly and recommend the one that does.
2. **Positioning.** The category the buyer would name, the alternatives they use today,
   why this instead, and a promise the product can keep. Checkable differences only.
3. **Messaging pillars.** Three at most. Each names the proof that exists today or
   `INPUT_NEEDED: <proof>`. A pillar with no proof is a claim to earn, and is marked so.
4. **Channels.** One primary, one secondary, one experiment, chosen from where the audience
   already is, what the product can show, and the owner's real capacity. Then a "not now"
   list with a reason per channel; this list is mandatory. Communities and creator or
   streamer pitches count as channels; `community-growth` does that work.
5. **The first loop.** Written step by step, from the first touch to the action that
   produces the next touch, with the weakest link named and what would strengthen it.
6. **30/60/90.** Each stage has a focus, the work, and exit criteria that can be checked.
   A stage without an exit criterion is a wish. Criteria use the owner's numbers where they
   exist; otherwise a default milestone, labelled as one, never dressed as a target.
7. **Experiments.** The top five, ranked by ICE (impact, confidence and ease, each 1 to
   10; ICE is their mean, as `growth-experiment` scores it), each one line. Hand them to the
   `growth-experiment` skill for full cards; do not design them here.
8. **This week.** Three actions, each doable in the hours the context says are available.

The test for every line:

- Bad: "Post consistently on social media and engage with your audience."
- Good: "First loop: 20-second screen recordings of an invoice being extracted → pinned
  comment with the free-trial link → the trial ends on an export the user forwards to their
  accountant, with the product's name in the footer. Weakest link: nothing prompts the
  forward. Add a 'send to accountant' button before making more videos."

## 4. Review mode

With `review`: read `learnings.md`, the reviews in `<state>/reviews/` and closed
experiments since the strategy's date. Change only what the evidence changes. Keep the rest
word for word. List every change as "was → now, because <evidence>", and move disproven
channels to "not now" with the learning that put them there.

## 5. Critique the positioning

Run one critique round on the positioning and pillars per the shared `quality-bar.md`: is
it specific, credible, and would the audience recognise their own words in it. Fold in what
survives. One round; a second only if the first found a factual problem. Skip this step
when the context extends `qblab-context`: that positioning is not this skill's to rewrite.

## 6. Write and save

Fill `references/strategy-template.md` (relative to this skill's folder) and save it to
`<state>/strategy.md`. Label claims Observed, Inferred or Hypothesis. Update the context's
Positioning and Goals lines if this run settled them, with source and date. If the context
extends `qblab-context`, positioning and proof come from that pack unchanged, and channel
work routes to the existing specialists (`linkedin-post`, `outreach`, `seo-audit`,
`blog-post`); this strategy only ranks and sequences them.

End with three things, nothing else: the objective and its metric; the first loop in one
line; the first three actions.
