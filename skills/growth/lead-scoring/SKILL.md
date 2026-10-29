---
name: lead-scoring
description: >
  Score researched leads out of 100 with the configured criteria (ICP fit, business need,
  buying signals, decision-maker access, delivery fit), each point backed by evidence, and
  classify them as high priority, investigate or low priority. Use when the user says
  "score these leads", "qualify", "/leadgen qualify", or research files are waiting to be
  scored.
disable-model-invocation: true
argument-hint: "[campaign-id | research file]"
---

# Lead scoring

The model decides each signal; the engine does the arithmetic. That split keeps scores
reproducible: the same research always gives the same number.

## 1. Load the shared rules

Find the installed `leadgen` skill and read `references/rules.md` and
`references/workspace.md`. Read `config/scoring.json` for criteria, signal points and
thresholds.

## 2. Score

For each research file without a score for its current content:

```
node src/cli.ts score --research runs/<date>/research/<company-id>.json \
  --out runs/<date>/scores/<company-id>.json
```

The engine rejects research that cites missing evidence, marks a signal true without
evidence, or uses a signal the configuration does not define. Fix the research (usually
by changing a guess to `null`), never the scoring configuration, to make it pass.

## 3. Read the result honestly

- `classification`: high priority at or above the high threshold, investigate between the
  thresholds, low priority below.
- `confidence`: the share of signal weight that was known. Low confidence means the score
  is a floor, not a verdict.
- `needs_more_research: true`: list the unknown signals that carry the most points and what
  page or question would resolve each. These leads stay `qualified` rather than being
  dropped.

Do not round, adjust or override a score by hand. If the owner disagrees with a score,
change the signal with new evidence or propose a configuration change for them to approve.

## 4. Status

- High priority with a reachable decision-maker: target `ready_for_review`.
- Investigate, or high priority without a reachable contact: target `qualified`.
- Low priority with confidence at or above `min_confidence`: target `disqualified`.
- Low priority with low confidence: target `qualified` and flag for research.

Hand the leads, scores and targets to `crm-manager` for syncing.

## 5. Report

One table sorted by score: company, score, class, confidence, top two reasons (from the
engine's justification), what would change it. No score without its justification line.
