# Scoring ideas

Seven factors, each 1 to 5. The score ranks a batch; it is not a prediction. Score fast,
score honestly, and let the anchors do the arguing.

## Factors and anchors

| Factor | 1 | 3 | 5 |
| --- | --- | --- | --- |
| Audience relevance | a general interest of the category | a known pain of the primary segment | a pain or question quoted from the segment's own words |
| Hook strength | announces a topic ("3 tips for…") | names a specific situation | the first line or frame shows the result, the stake or a real gap in what the viewer expects |
| Shareability | no reason to send it to anyone | useful enough to save | the viewer knows the exact person to send it to, or it says something about them to share it |
| Conversion intent | no path to the product | the product is visibly the answer | the next step is obvious and happens in one tap or click |
| Novelty | already in the log, or every competitor has posted it | familiar idea, new evidence or angle | only this project could post it |
| Production effort (inverted) | needs a shoot, a designer or days | an hour or two with assets on hand | under 30 minutes with assets on hand |
| Evidence strength | the evidence is `INPUT_NEEDED` | inferred from the repo or a single source | observed and owner-confirmed, with the asset already in hand |

Effort labels used in the table: `S` (score 5), `M` (score 3 to 4), `L` (score 1 to 2).

## Weights

The objective decides whether reach or action counts for more. Total is out of 75.

| Factor | Users, installs, audience, traffic | Leads, customers, revenue |
| --- | --- | --- |
| Audience relevance | x3 | x3 |
| Hook strength | x3 | x3 |
| Shareability | x3 | x1 |
| Conversion intent | x1 | x3 |
| Evidence strength | x2 | x2 |
| Production effort (inverted) | x2 | x2 |
| Novelty | x1 | x1 |

## Gates (applied before ranking)

- **Evidence 1**: the idea is not ranked. It goes to "blocked on input" with the exact thing
  the owner must supply ("a real customer who agreed to be named", "the signup count for
  September").
- **Audience relevance 2 or lower**: dropped. A clever idea for the wrong people is noise.
- **Repeat** under the rule in the shared `state.md` (in `project-growth-context`'s
  `references/`): dropped, unless it is a deliberate follow-up to a `published` row with a
  strong `result`.
- **Against the context's constraints** (claims to avoid, names that must not be used,
  content rules): dropped, with the constraint named.

## Adjustments from learnings

Read `<state>/learnings.md` before scoring. For each idea that matches an entry's "Applies
to" line:

- evidence for the pattern, confidence medium or high: add 5;
- evidence for it, confidence low: add 2;
- evidence against it: subtract the same amounts.

Show the adjustment next to the score (`58 +5 learnings`) so the owner sees why an idea
moved.

## Reading the result

- Under 40: not worth making this round. Do not pad the batch with these; return fewer.
- Ties go to the lower effort, then to the bucket the batch has least of.
- The top three should not all be the same bucket or the same channel unless the owner
  asked for that. Swap in the next best idea from a different bucket and say so.
- The score never overrides the owner. If they love the idea ranked eighth, it gets made;
  note the factor that held it down so they can fix it.
