---
name: launch-campaign
description: >
  Plans an integrated launch campaign for a product, a mobile app release, a feature, a
  redesign, a new market or a milestone: one launch claim with its proofs, the channels this
  audience actually uses, a dated timeline from T-14 to T+14 with assets, owners and status,
  success metrics against a baseline, and briefs for every asset. Use when the user says
  "plan the launch", "we ship on <date>", "launch this feature", "Product Hunt launch",
  "announce the app", "we are entering <market>", or "what do we do after launch day".
disable-model-invocation: true
argument-hint: "<what is launching> [launch date]"
---

# Launch campaign

A launch is one claim, repeated in the right places, on a schedule, with something to show
for it. Most launches fail before launch day (no audience warmed, no asset ready) or after
it (nothing planned for T+1 onward), so the plan covers both sides and is sized to what is
actually launching. Plan and draft only; nothing is posted, submitted or sent.

## 1. Load project context

Find the installed `project-growth-context` skill (a directory named
`project-growth-context` containing `SKILL.md`, wherever the host installs skills) and
follow it: resolve the project and `<state>`, load or build the context, and apply its
rules. If it is not installed, say so with the install command
(`npx skills add qb-lab/skills --skill project-growth-context`) and continue from the
repository alone: nothing is read from or written to growth state, and the output says so.

This skill depends on the context's Product, Audience, Positioning, Channels, Goals, Content
rules and Constraints sections, and on `<state>/strategy.md`, `<state>/audience.md`,
`<state>/communities.md`, `<state>/learnings.md` and `<state>/content-log.csv` when they
exist. Without a strategy or audience file, proceed from the context and say in one line
that `growth-strategist` or `audience-intelligence` would sharpen the channel choice.

## 2. Define the launch

- **What:** read the changelog, the git log and the product itself so the launch is
  described by what a user can now do, not by a version number.
- **Type and scale:** classify it with `references/launch-types.md` (relative to this
  skill's folder): product launch, mobile app release, feature, redesign, new market, or
  milestone. The type sets how much campaign it deserves; a feature does not get T-14.
- **Date:** if none was given, the date is `INPUT_NEEDED: launch date` and the timeline
  stays relative (T-7, T+3). If the date is fewer than fourteen days away, compress: keep
  the milestones that still fit, and list what was cut and what that costs.
- **Readiness:** list what must be true on launch day (store approval, pricing page live,
  onboarding works, analytics events firing). Anything unverified is flagged, because a
  campaign pointing at a broken flow is worse than a quiet launch.

## 3. Build the message house

Fill the message house in `references/campaign-template.md`: one launch claim in the
audience's words, three proofs, and the objections with honest answers.

- Bad: "Introducing version 2.0 of our budgeting app, reimagined from the ground up."
- Good: "The app now reads your receipts. Photograph one and it is categorised before you
  put your phone down."

Every proof is something that can be shown or sourced: a recording, a number the owner
supplied, a real user's words with permission. A proof that does not exist is
`INPUT_NEEDED`, and the plan says how to get it before launch day. Run one critique round on
the message house as described in the shared `quality-bar.md` (in `project-growth-context`'s
`references/`); a second only if the first changed the claim.

## 4. Choose channels

Start from where the audience already is (strategy, audience file, community map), then
apply the type's defaults from `launch-types.md` and the per-platform rules in the shared
`platform-playbook.md`. Pick one primary channel that gets the best asset and the owner's
attention on the day, two or three supporting ones, and write an explicit **skipped** list
with a reason each. Capacity from the context's Content rules caps the count. Community
launches (Reddit, Hacker News, Discord, Product Hunt) follow each community's own rules and
are only planned where standing already exists or can be earned honestly before the date.

## 5. Build the timeline and the asset list

Fill the timeline in `campaign-template.md`: T-14, T-7, T-3, T-1, launch day, T+1, T+3,
T+7, T+14. Each milestone has a goal, the assets due, the channel, an owner and a status.
Before launch the job is warming and preparing; on the day it is one coordinated push with
the owner present to reply; after it the job is proof, follow-up content and learning. The
asset list names every piece once with its format, the proof it carries and the skill that
produces it. Languages and markets follow the context and the shared `languages.md`; a
second language is a second set of natively written assets, not a translation pass.

## 6. Set metrics and risks

One primary metric tied to the context's objective, with its baseline (or `INPUT_NEEDED:
baseline`) and how it will be measured; two or three supporting metrics; no targets
invented on the owner's behalf. List the risks that are specific to this launch (store
review delay, a thread removed by moderators, a bug on the day) with a fallback for each.
If the installed `growth-experiment` skill is available, name the one or two launch
elements worth running as experiments.

## 7. Produce the nearest assets

Asset production is delegated: find the installed `human-content-writer`,
`creative-director`, `short-video-director` and `community-growth` skills and follow them
for the pieces they own. Produce only the nearest milestone's assets unless the owner asks
for more; later assets get a one-line brief in the plan. When the context extends
`qblab-context`, LinkedIn and site articles go to `linkedin-post` and `blog-post` instead.

## 8. Save and log

Save `<state>/campaigns/<slug>/plan.md`. Add one `content-log.csv` row per planned content
asset with `campaign=<slug>` and status `planned`. On a later run for the same slug, update
statuses from what the owner reports and add a dated note; do not overwrite the plan.

End with the launch claim on one line, then the next three dated actions. Nothing else.
