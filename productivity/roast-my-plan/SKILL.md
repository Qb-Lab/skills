---
name: roast-my-plan
description: Write phased implementation plans sized to one AI coding-agent session per phase. Use when the user has a feature, refactor, or project to plan and wants it broken into independently executable phases with clear success criteria.
---

# Roast My Plan

Turn a rough task, feature idea, or existing plan into a phased implementation plan where **every phase fits inside one AI coding-agent session** — one context window, one sitting, one verifiable outcome.

## Input

The user provides either:
- A rough description of what they want to build, or
- An existing plan to restructure ("roast")

If they gave an existing plan, first critique it honestly: call out phases that are too big, vague success criteria, hidden dependencies, and missing verification steps. Be direct — the user asked for a roast, not a compliment.

## Sizing rule (the core of this skill)

A phase is correctly sized when a fresh AI coding agent, with no memory of previous sessions, could:
1. Read the phase description and the codebase, and know exactly what to do
2. Complete the work without running out of context
3. Verify success mechanically (tests pass, command output, visible behavior)

If a phase needs "and then also..." — split it. If a phase can't be verified without doing the next phase — merge or re-cut the boundary.

Rules of thumb:
- A phase touches a handful of files with one coherent purpose, not a sweep across the codebase
- Each phase leaves the repo in a working, committable state (builds, tests green)
- Later phases must not require remembering *why* earlier phases did something — write that context into the plan itself

## Process

1. Understand the goal. Explore the codebase if one is present; ask only questions that change the plan's shape.
2. Identify the risky/unknown parts and front-load them into early phases (fail fast).
3. Cut phases along verification boundaries, not along file or layer boundaries.
4. Write the plan using the output format below.
5. End with a one-paragraph roast summary: the single biggest risk in this plan and which phase will hurt most.
6. Optional second opinion: if the `codex` CLI is installed, offer to run the finished plan past the reviewer profile in `agents/openai.yaml` (relative to this skill's folder) and fold any confirmed critique back into the plan before delivering.

## Output format

```markdown
# Plan: <title>

**Goal:** <one sentence>
**Non-goals:** <what this plan deliberately does not do>

## Phase N: <verb-first title>
- **Objective:** what exists after this phase that didn't before
- **Context a fresh agent needs:** files to read, decisions already made, gotchas
- **Steps:** concrete, ordered
- **Done when:** mechanical verification (exact commands / observable behavior)
- **Depends on:** previous phases by number, or "nothing"
```

Every phase must be executable by pasting only that phase (plus the Goal line) into a new agent session.
