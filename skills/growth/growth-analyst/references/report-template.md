# Growth analysis: <project>, <start> to <end> vs <start> to <end>

<!--
Saved as <state>/analytics/reports/YYYY-MM-DD.md. Every finding carries its numbers, the
counts behind any rate, and its source. Missing numbers are "no data", never estimated.
Labels: Observed (measured), Inferred (follows from measurements), Hypothesis (to test).
Delete a section that has nothing real to say rather than padding it.
Winners and Losers hold only patterns above the framework's minimum samples; below them the
section reads "none readable yet" and the pattern goes under Hypotheses. The Change column
shows counts; add a percentage only when the base it is computed on is 30 or more.
-->

- Objective: <90-day objective and its decision metric>
- Question answered: <the owner's question, or "weekly read">
- Time zone of the data: <as reported by the source>

## Data used

| Source | What was pulled | Range | Gaps or caveats |
| --- | --- | --- | --- |
| <tool or file> | <metrics> | <dates> | <missing steps, untracked links, definition notes> |

## Headline

<One or two sentences: the decision this analysis supports, with the number that supports it.>

## What changed

| Metric (in funnel order) | This period | Previous | Change | Read |
| --- | --- | --- | --- | --- |
| <decision metric> | <n> | <n> | <+/- n, %> | <up / down / flat within normal wobble / too few to read> |

## Winners

- <Pattern, not a single post: bucket, format or channel> : <rate with counts, compared with
  what> : <Observed / Inferred> → <what to do with it>

## Losers

- <Pattern> : <rate with counts> → <stop, fix, or give it n more tries and why>

## Anomalies

- <One-off spike, tracking break, source disagreement> : <what is known, what is not> →
  <how to find out>

## Hypotheses

- Hypothesis: <why something moved> : <the cheapest check or experiment that would test it>

## Stop

- <A specific thing, with the evidence, or "nothing has enough evidence against it yet">

## Continue

- <A specific thing that is working or not yet readable, and how many more data points it
  needs>

## Scale

- <A specific thing with evidence above the minimum sample, and what "more" means in
  numbers; otherwise "repeat <x> to confirm before scaling">

## Next experiments

| Observation | Variable to test | Metric | Hand to |
| --- | --- | --- | --- |
| <from this analysis> | <one thing> | <outcome metric> | growth-experiment |

## What would make the next analysis better

- <The one or two tracking or export gaps that most limited this one>

<!--
Bad:  "Reach grew 18% and engagement was strong across channels."
Good: "Before/after demos: 14 link clicks per 1,000 views (median of 5 posts) against 4 for
       founder opinion posts (median of 5). Early signal, not proof. Make three more demo
       variants next week and keep one opinion post as the comparison."
-->
