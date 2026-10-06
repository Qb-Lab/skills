# Growth OS modes

Each recipe lists the skills to follow, in order, and what to pass them. "Follow `<skill>`"
means: find the installed skill of that name and follow its `SKILL.md`. Skip any step whose
output is fresh (see the freshness rule in `SKILL.md`), and say what was reused.

## Default: first pass, or "grow this"

The long one. It takes a project from nothing to a week the owner can execute.

1. **Context.** Built or loaded in section 1. If the open inputs include the objective, ask
   for it now; everything else can stay open.
2. **Audience.** No `audience.md`: follow `audience-intelligence` for a full pass.
3. **Market.** No radar in the last 7 days and live research is available: follow
   `market-radar` with `weekly`. Without live research, skip it and say so.
4. **Strategy.** Follow `growth-strategist` with the owner's goal. Show its objective, first
   loop and "not now" list in five lines, then continue; do not wait for approval unless
   the owner asked to review each step.
5. **Experiments.** Follow `growth-experiment` for the strategy's top two or three
   experiments, so each has a card with a metric and a baseline.
6. **Ideas.** Follow `content-ideas` for ten ideas aimed at the objective.
7. **Calendar.** Follow `content-calendar` with `7`.
8. **First asset.** Produce the first calendar item only, so the owner sees finished work:
   follow `human-content-writer` for copy, `short-video-director` for a video item,
   `creative-director` when it needs a visual. Leave the rest for the week.
9. **Community and creators.** If the strategy ranks a community channel, follow
   `community-growth` with `map`; if it ranks creators or streamers, with `creators`.
10. **Plan and routine.** Sections 5 and 6 of `SKILL.md`.

If the run has to stop early (the host's limits, the owner's time), stop after a completed
step, save what exists, and list the remaining steps in the plan as actions with the skill
to run for each. A finished strategy and a three-action plan beat a half-finished
everything.

## next

No research. Read the current `plans/` file, the content log, running experiments and
`routine.yaml`.

- A plan exists for this ISO week: return the first action not done, what done looks like,
  and what it unblocks. If an experiment has passed its end date, closing it is the next
  action. If a calendar item is due today and not drafted, that is the next action.
- The plan is from a previous week, or missing: say so in one line, then run `weekly` if
  `strategy.md` exists and the default mode if it does not. This is the only case in which
  `next` writes anything.

Ten lines at most.

## diagnose

For "we are doing things and nothing is happening". Find the one bottleneck; do not list
twelve improvements.

1. If any data is reachable, follow `growth-analyst` with the question "where does the
   funnel lose the most people". Otherwise diagnose from evidence, and say that is what
   was done.
2. Walk the chain and stop at the first link that is clearly broken:
   - **Execution.** Did content and experiments in the plan actually ship (the log,
     experiment cards)? If little shipped, the bottleneck is capacity or scope, and no
     amount of strategy fixes it.
   - **Audience.** Is there an evidence-based segment, or a guess? Is the content reaching
     that segment or the builder's peers?
   - **Message.** Read the landing page or store listing as a stranger: is it clear in five
     seconds what this is and for whom? Does content use the audience's words?
   - **Channel.** Is one channel being worked consistently, or five thinly? Does the
     channel fit the type (the shared `project-types.md`)?
   - **Conversion.** Attention exists but few people try the product: the step between
     content and product is broken (no link, a weak page, a heavy signup).
   - **Product.** People try it and do not come back. That is a retention problem; more
     marketing makes it worse. Say so plainly.
3. Output: the bottleneck in one sentence, the evidence, three fixes ranked by expected
   effect over effort, and the single measurement that would confirm the diagnosis.

Label every conclusion `Observed`, `Inferred` or `Hypothesis`.

## ideas

1. If there is no radar file in the last 7 days and live research is available, follow
   `market-radar` with `daily` first so trend-response ideas have evidence.
2. Follow `content-ideas` with the owner's count, bucket or theme.
3. Return its top ideas and the three to make first. Do not build a calendar unless asked.

## weekly (Monday)

1. **Close last week.** If there is no review for the previous ISO week, follow
   `growth-review` with `weekly` for that week.
2. **Numbers.** If any data is reachable, follow `growth-analyst` for the last 7 days
   against the 7 before.
3. **Market.** Follow `market-radar` with `weekly`.
4. **Project changes.** Read the changelog and the last week of the git log for anything
   users would notice; these feed product-demonstration and launch ideas.
5. **Decide.** One primary objective for the week, derived from the strategy's current
   30/60/90 stage and last week's review. Then two to four experiments: follow
   `growth-experiment` with `next` to pick from the backlog, and add cards for new ones.
6. **Content.** Follow `content-ideas` to top up if fewer than a week's worth of `idea`
   rows remain, then `content-calendar` with `7`.
7. **Distribution.** If a community channel is active, follow `community-growth` with
   `daily` to seed the week's conversations. Add any campaign milestones due this week.
8. **Targets.** Each target is a number with a baseline from data or the owner. No
   baseline: the target is "establish the baseline", not an invented number.
9. Write the plan (section 5 of `SKILL.md`).

## daily

Fifteen lines of output at most.

1. Follow `market-radar` with `daily`.
2. If a community channel is active, follow `community-growth` with `daily`.
3. Only if one of them surfaced a strong, time-sensitive opening: propose one response and
   follow `human-content-writer` or `short-video-director` to draft it. Otherwise produce
   no content.
4. Return: what changed (or "nothing new worth acting on"), the conversations worth
   joining, and the optional content action.

## midweek, review, monthly

Follow `growth-review` with `midweek`, `weekly` or `monthly`. After `monthly`, if it
proposes strategy changes and the owner accepts them, follow `growth-strategist` with
`review`. After `midweek`, when it names a winner worth cloning, follow `content-ideas`
with that winner as the theme.

## launch

Follow `launch-campaign` with what is launching and the date. Before it, make sure the
context's recent-changes line and `audience.md` are current. After it, add the milestones
that fall in this ISO week to the current plan, and during the launch window suggest
switching the routine's daily entry on.

## routine

See `routines.md`.
