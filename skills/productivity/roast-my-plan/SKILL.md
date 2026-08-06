---
name: roast-my-plan
description: Write a phased implementation plan (.md) for a large feature, where each phase is one AI coding-agent session — or roast an existing plan into that shape. Use when the user has a feature, refactor, or roadmap item to plan, or a plan they want critiqued.
disable-model-invocation: true
argument-hint: <feature, roadmap item, or existing plan to roast>
---

Write an implementation plan for the requested feature or roadmap item as a Markdown document.
The reader is **an AI coding agent in a fresh session** told "build phase N of this plan" — not
a human project manager. Every choice below follows from that.

If the user handed over an **existing plan**, first roast it honestly: call out phases that are
too big for one session, vague exit criteria, hidden dependencies, and missing verification.
Be direct — they asked for a roast, not a compliment. Then rebuild it to the skeleton below.

## Before writing: align, then research

1. If the task has decisions that shape the whole approach — architecture, data model, library
   choice, scope boundaries — settle them with the user **before** drafting the plan. Ask one
   question at a time, leading with your recommended option. Skip this when the direction is
   already clear from the request, the docs, or prior decisions.
2. Research the entire change enough to establish every phase's boundaries, dependencies, and
   exit criteria. Research phase 1 deeply enough that you could implement it yourself. For later
   phases, specify exact contracts and files where they are already knowable; do not invent
   internals that depend on earlier implementation results. Delegate heavy or open-ended
   research when the host supports it.
3. Facts you can look up are never questions for the user; decisions are.
4. **House-stack check:** if the target repo is an Nx monorepo with Prisma (`nx.json` at root
   plus a `prisma/` dir or `prisma.config.ts`) or a standalone Expo app (`app.config.ts` +
   `expo` in package.json), read `references/stack-playbook.md` (relative to this skill's
   folder) before cutting phases — it defines where phase boundaries are allowed to fall in
   that stack and which verification commands count.

## Required skeleton

Only these four elements are mandatory. Adapt everything else — section names, extra sections,
depth, ordering — to what's being planned; a schema design plan and a migration plan should not
look alike.

1. **Title + goal** — one paragraph on what exists when the plan is done. Include a one-line
   **non-goals** statement: what this plan deliberately does not do.
2. **Progress tracker**, directly under the goal: a phase/status table using only `not started`,
   `in progress`, `done`, or `blocked`, plus "current phase" and "recommended next phase" lines.
   End it with a literal instruction that the executing agent updates the tracker at the end of
   its run, noting any deviations in one line each.
3. **Decisions & context** — everything a fresh session needs that it can't get from the repo:
   load-bearing decisions made, rejected alternatives that would otherwise be relitigated,
   constraints, and pointers to the files and docs that matter. If rationale already has a
   durable home in architecture docs or an ADR, link it instead of duplicating it.
4. **Phases** — each with: goal, what to build (concrete — file paths, names, shapes), a coarse
   task checklist, and exit criteria another agent or the user can verify, including the exact
   commands to run. Every phase leaves the repo green (build, lint, test).

Include this standing execution rule in the plan: at the start of each phase, verify the plan
against the live repo and prior-phase deviations. Do not reopen settled decisions without new
evidence. If an assumption is invalidated, update the plan and surface the deviation rather
than silently changing direction.

## Sizing phases

A phase is **one agent session**, not a human workday. A capable model implements a multi-file
feature — schema, logic, tests, wiring — in a single run, managing its own todo list. Never
phase by kind of work (a scaffolding phase, a testing phase); phase only at real seams:

- The user should review output or make a decision before the next part starts.
- The output of one phase genuinely determines the design of the next.
- The work is too large for one session's context even executed efficiently.

Merge test: if an agent could execute two adjacent phases in one session with no ambiguity and
no lost checkpoint, they are one phase. Most large features land at 2–4 phases; more is fine
for genuinely large work, but each extra seam must be one of the three above.

Front-load the risky and unknown parts into early phases (fail fast). Keep task checklists
coarse — outcomes ("`ToolCallExecutor` with denial path + tests"), not micro-steps. The
implementing agent plans its own steps; the checklist exists so the user can see the shape of
the run and the agent can self-verify coverage.

## Saving

Follow the repo's existing conventions for plan location and retention. If it has no location
convention, default to `docs/plans/<feature>.md`, or `docs/plans/<area>/<feature>.md` when plans
are naturally grouped by area. If `docs/plans/` is unavailable or inappropriate, ask where
plans should live. Make the final phase move any lasting architecture, operational, or product
facts into their canonical docs; retire or archive the implementation plan only when the repo's
convention requires it.

## Second opinion (optional)

If the `codex` CLI is installed, offer to run the finished plan past the reviewer profile in
`references/second-opinion.yaml` (relative to this skill's folder) and fold any confirmed
critique back into the plan before delivering. If `codex` is not installed, skip silently.

## Handoff

End your final message with two things:

1. **The roast summary** — one paragraph: the single biggest risk in this plan and which phase
   will hurt most.
2. **The kickoff prompt for phase 1**, in a code block so it can be copied into a fresh
   session. Keep it dead simple — the plan carries the context, the prompt just points at it:

   ```
   Read <plan-path> and build phase 1.
   ```

   Add a trailing sentence of extra context only when something matters that the plan can't
   know (e.g. "phase 1's migration is already half-applied locally"). Later phases reuse the
   same prompt shape with the phase number changed, so only show phase 1's.
