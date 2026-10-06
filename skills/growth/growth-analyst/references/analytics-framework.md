# Analytics framework

## Metric tree by objective

Read the decision metric first, then walk down the inputs to find the step that moved.
Use the project's own event names from the context; the names below are placeholders.

| Objective | Decision metric | Inputs, in funnel order | Usually vanity here |
| --- | --- | --- | --- |
| Users or installs | new activated users per week (did the first meaningful action) | reach → profile or link clicks → store or landing visits → installs or signups → activation; week-1 retention as the guardrail | impressions, follower count, raw installs without activation |
| Leads or first customers | qualified conversations or demos booked per week | targeted reach → site visits from that audience → lead action → qualified → closed; reply rate for outbound | traffic volume, likes, list size |
| Revenue | new paying customers and revenue per week | visits → trial or cart → purchase → repeat or renewal; refund and churn as guardrails | signups that never reach the paywall |
| Audience or followers | followers gained from the target audience, and returning viewers | reach → profile visits → follows; saves, shares and replies as quality signals | views on content off the positioning |
| Traffic | visits from the intended source that do something | impressions or rankings → clicks → engaged sessions → next action | sessions that bounce in seconds |

A metric is a decision metric only if a change in it would change next week's plan.

## Normalise, then compare like with like

- Rates, not totals: link clicks per 1,000 views, signups per 100 visits, replies per 100
  messages. A bucket with five posts will always out-total a bucket with one.
- Same platform, same format, similar age. A "view" is defined differently on each platform,
  so raw views are never compared across platforms; compare what happened after the view.
- Give a post time to settle before judging it (a few days for short video and social, weeks
  for search content), and compare posts at the same age.
- Group by the content log's `bucket`, `format`, `hook` type and `channel`. Use medians when
  one post dwarfs the rest, and report that post separately as an anomaly.
- Same window length and the same weekdays in both periods; note holidays, launches and
  outages inside either window.

## Minimum samples

State counts beside every rate. Working thresholds, not statistics:

- Fewer than about 10 outcome events on either side: "too few to read".
- Roughly 10 to 100 per side: "early signal" at most, and only for a large, consistent gap.
- A pattern needs at least three posts per group; one post is an anecdote.
- Week-over-week moves inside the normal wobble of the last four to eight weeks are "flat".
  With no history to judge the wobble, say that the baseline is one week old.
- "Statistically significant" is used only when a named test was actually run.

## Attribution caveats

Say which method produced each number and what it misses.

- Last-click and UTM reports undercount social and community: people see a post, then search
  the name or type the URL, and land as "direct" or "organic". A rise in direct and branded
  search after a content push is a clue, labelled `Inferred`.
- App installs cannot be tied to a post without a tracked link or store campaign parameter.
  Timing alone ("installs rose the day after the video") is `Inferred`, weaker when anything
  else shipped that day.
- Platform dashboards and product analytics count differently (clicks versus sessions,
  time zones, bots, consent). Expect a gap; report both, do not average them.
- A "how did you hear about us" answer, where one exists, is the best check on dark social.
- One channel can assist another. "Channel X produced nothing" needs more than last-click.

## Check tracking before behaviour

Suspect the measurement when: a step drops to zero or an event disappears after a release;
a ratio exceeds 100%; one day spikes with no upstream cause; two sources disagree by far more
than usual; the change coincides with a consent banner, tag or SDK change. Look at the git
log and release dates around the break. If it cannot be resolved, report the affected
metrics as "unreliable from <date>" and decide nothing on them.

## What to pull

| Source | Pull |
| --- | --- |
| Product analytics (PostHog, Mixpanel, Amplitude, GA4) | unique users per funnel step for both windows, broken down by source / UTM and landing page; activation and week-1 retention for new users; the event definitions used |
| Web analytics and search (GA4, Plausible, Search Console) | sessions and engaged sessions by source and landing page; queries, clicks and position for the pages that matter |
| Social platform exports (TikTok, Instagram, LinkedIn, X, YouTube) | per post: date, views or impressions, average watch time or retention, saves, shares, comments, profile visits, link clicks, follows gained; account-level follower change |
| App Store Connect and Play Console | impressions, product page views, installs by source type, conversion rate, ratings and review text; both windows |
| Email tools | delivered, opens (soft signal), clicks, replies, unsubscribes per send; list growth by source |
| Campaign or ad data | spend, clicks, outcome events, cost per outcome, by creative |
| Content log and experiment cards | `result` cells, bucket, format, hook, experiment id |

When the owner must export by hand, ask for exactly the columns needed and the two date
ranges, once.
