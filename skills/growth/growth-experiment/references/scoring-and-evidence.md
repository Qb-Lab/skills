# Scoring and evidence

## ICE

Three scores from 1 to 10; ICE is their mean, to one decimal. It ranks cards against each
other; it is not a forecast. On a tie, the higher Ease wins, because a faster test teaches
sooner.

| Score | Impact (on the 90-day objective's metric) | Confidence (evidence it will work) | Ease (to run properly) |
| --- | --- | --- | --- |
| 1 to 3 | moves a side metric, or a step far from the objective | a hunch; no observation | weeks; needs engineering, budget approval or a new tool |
| 4 to 6 | improves one step of the main funnel | inferred from audience evidence, a radar entry, or a comparable product | a few days; new assets to produce |
| 7 to 8 | directly moves the objective metric if it works | our own data points to it: an analyst report or a `low` / `medium` learning | half a day with assets that exist |
| 9 to 10 | could change which channel or message the strategy bets on | we have already seen it work once here and are replicating | under an hour of work |

Rules: Confidence above 6 cites the entry in `learnings.md` or the report. Ease is hours of
work, not calendar time: it counts the
instrumentation and the full duration, not only making the creative. Do not raise a score to
get a favourite idea to the top; change the idea instead.

## Design rules

- **One variable.** Hook A against hook B with the same footage, length, caption style, CTA
  and posting slot. "New hook and new format and new time" is three experiments run badly.
- **Baseline first.** The same metric, the same definition, a period of the same length just
  before the start. A baseline from a different season, a launch week, or a week with one
  runaway post is not a baseline; say so and use a longer period or the median.
- **Whole weeks.** Behaviour differs by weekday, so run seven, fourteen or twenty-one days.
  A test that needs more than four weeks to reach its sample is too small a change or too
  small a channel: test something bolder or somewhere with more volume. If nothing bolder is
  available, say that the
  test cannot reach its sample at current volume; a metric one step earlier in the funnel
  may stand in only if the card labels it a proxy.
- **Fix the judge date and the minimum sample before starting.** Looking daily and stopping
  when the variant is ahead produces winners that vanish on rerun.
- **Guardrails.** A hook that doubles views and halves watch time, or a CTA that lifts
  signups and lifts refunds, did not win. Name the metric that would expose that.
- **Before/after is weaker than side by side.** When there can be no parallel control, list
  everything else that changed in the period and cap the confidence at `low`.

## How much evidence a result carries

Judge on outcome events (clicks, signups, installs, replies), not on views or impressions,
and always state the counts next to any rate.

| What you have | What you may say |
| --- | --- |
| Fewer than about 10 outcome events in either arm | nothing: `inconclusive`, regardless of the percentages |
| Roughly 10 to 100 outcome events per arm, below the card's minimum sample | still `inconclusive`; the learning may be recorded as an early signal (`low`), and only when the gap is large (about 2x or more) and shows up on most days or most posts, not from one outlier |
| The card's pre-set minimum sample reached | `supported` or `not supported`, per the lines written in advance |
| The same, plus a real test run (the analytics tool's calculator, a two-proportion test) | the same verdict, naming the test; the only route to `high` confidence from one run |
| The same direction in two separate periods or audiences | the learning may move up one confidence level |

For organic content the unit is the post, not the view. Reach varies several-fold between
posts for reasons that have nothing to do with the variable, so:

- at least three posts per arm, five when capacity allows, before any read; this floor
  and the outcome-event floor above must both be met;
- compare rates (per 1,000 views, per visitor) and medians, never totals and never the best
  post against the average;
- one post that outperforms everything is an anomaly to investigate, not a result.

Rates on tiny denominators mislead: 2 signups from 40 visits against 1 from 40 is "5% versus
2.5%" and means nothing. Write "2 of 40 versus 1 of 40: no read".

## Verdicts and confidence

- `supported`: met the "supported if" line at or above the minimum sample.
- `not supported`: met the "not supported if" line at or above the minimum sample. A clean
  negative is a useful result; record it with the same care.
- `inconclusive`: below the minimum sample, within normal spread, or muddied by something
  else that changed. Expect this often. The follow-up is to rerun larger, simplify, or drop.

Learning confidence: `low` for a directional result or a single before/after; `medium` for a
clear result at the pre-set sample, or a directional one seen twice; `high` only for a real
test or a result replicated across two periods. Phrase `low` entries as "early signal".

Never round up: no "significant", "proven" or "X% lift" without the counts and the method
beside it, and no numbers that were not measured.
