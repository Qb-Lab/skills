# EXP-NNN: <name in under eight words>

<!--
Saved as <state>/experiments/EXP-NNN-<slug>.md. Everything above "Result" is written before
the experiment starts and is not edited afterwards, except Status and dates. If the plan
changes mid-run, add a dated note under "Changes during the run" instead of rewriting it.
-->

- Status: proposed | ready | running | closed | dropped
- Created: YYYY-MM-DD
- Started: <date the owner says it began, or blank>
- Judge on: <fixed date, a whole number of weeks after the start>
- ICE: I <n> · C <n> · E <n> = <mean, one decimal>
- Objective it serves: <the 90-day objective from the context>
- Related content: <content-log ids, campaign slug, or none>

## Observation

<What was seen that prompted this, with its source: an analyst report, a radar entry, a
`result` cell, a learning, something the owner noticed. If there is none, write
"Hypothesis only: no observation yet".>

## Hypothesis

If we <change one thing> for <audience> on <channel>, then <metric> will <move, by roughly how
much>, because <reason drawn from the observation>.

## Design

| Field | Value |
| --- | --- |
| Target audience | <segment from audience.md, or the provisional one> |
| Channel | <one platform or surface> |
| Creative | <what is made: content ids, formats, number of pieces per arm> |
| Variable | <the one thing that differs> |
| Control or baseline | <the unchanged arm, or the baseline value with its period and source> |
| Held constant | <posting time, format, length, CTA, landing page: whatever is not the variable> |
| Success metric | <one outcome metric, with its exact definition and where it is read> |
| Guardrail metrics | <one or two things that must not get worse> |
| Minimum sample | <outcome events per arm, or pieces per arm, below which the verdict is inconclusive> |
| Duration | <whole weeks> |
| Effort | <hours, and who> |
| Instrumentation needed | <tracked link, event, export; or "none, already measurable"> |

## Expected signal (written before the start)

- Supported if: <result that would count, at or above the minimum sample>
- Not supported if: <result that would count against it, at or above the minimum sample>
- Inconclusive if: <below the minimum sample, or the arms differ by less than the usual
  week-to-week or post-to-post spread>

## Changes during the run

- <YYYY-MM-DD: what changed and why; "none" if nothing>

## Result

- Period measured: <start> to <end>
- Baseline or control: <number, unit, sample size>
- Variant: <number, unit, sample size>
- Guardrails: <each metric, before and after>
- Data source: <tool, export file, or "owner-reported on YYYY-MM-DD">
- Anything that muddies it: <a launch, a holiday, one outlier post, a tracking gap>

## Verdict

<supported | not supported | inconclusive> : <one sentence of why, naming the sample size.
Directional results say "directional". No "statistically significant" without a named test.>

## Learning

<One sentence, as it was appended to learnings.md, with its confidence.>

## Follow-up action

<Scale it, rerun larger, test the next variable (new card id), or stop. One line, with who
and when.>
