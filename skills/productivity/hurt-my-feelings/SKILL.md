---
name: hurt-my-feelings
description: Breaks a complex plan, feature, or context into small parts, then aligns on each part through tough one-at-a-time questioning — what it is, how it should be built, and what would make it better. Use when the user has something big or fuzzy and wants to reach a shared, concrete understanding piece by piece, with improvement ideas along the way.
disable-model-invocation: true
argument-hint: <plan, feature, or context to break down and align on>
---

# Hurt My Feelings

Take something big and fuzzy, break it into small parts, and interrogate each part — one question at a time — until you and the user are genuinely aligned on what it is and how it should be built. The questions stay sharp (vague answers don't get a pass), but the goal is shared understanding and a better design, not a takedown.

## Input

The user provides a plan, feature description, design doc, architecture sketch, or messy context — as text, a file path, or a pointer to prior conversation. Read it fully before saying anything else.

## Phase 1 — Break it down

1. Decompose the context into **small, independently discussable parts** — each part should be one decision, one component, or one assumption, small enough to settle in a few questions. Aim for 3–8 parts; if you need more, the top-level cut is too fine — group them.
2. Present the breakdown as a numbered list, one line per part, each with a status marker: `⏳ open`.
3. Ask the user one question: does this breakdown match how they see it — anything missing, mislabeled, or not worth discussing? Adjust until they agree. The breakdown is the shared map for the rest of the session.

## Phase 2 — Align on each part

Work through the parts in order (or the order the user prefers). For the current part:

1. **One question per turn.** Ask exactly one question, then stop and wait. Never batch questions. With each question, offer your **recommended answer** and the one-line reason — the user can accept it with a word or push back, which is faster than answering from scratch.
2. **Ask what matters.** Questions target two things: *what is this, really?* (scope, purpose, who it's for) and *how should it be built?* (approach, data, edge cases, dependencies on other parts). Skip anything the user could answer without thinking. If a question can be answered by exploring the codebase, explore the codebase instead of asking — facts you can look up are never questions for the user; decisions are.
3. **Follow the vague answer.** If an answer is hedged or hand-wavy, the next question digs into the same spot. Don't move on until the answer is concrete or the user explicitly parks it as an open problem.
4. **Say your understanding back.** When you think the part is settled, restate it in 2–3 sentences — what it is and how it will be built — and ask the user to confirm or correct. The part is **aligned** only when they confirm.
5. **Offer one improvement.** Once a part is aligned, if you see a way to make it better — simpler approach, existing tool instead of new code, an edge case worth designing for now — offer **one** concrete idea and let the user accept, reject, or defer it. Then move to the next part. If you have nothing genuinely useful, offer nothing.
6. **Keep the map current.** When returning to the breakdown between parts, show it with updated statuses: `✅ aligned`, `⏳ open`, `❗ parked` (open problem the user chose to defer).
7. **Know the terrain.** If the context targets an Nx monorepo with Prisma or an Expo app, read `references/stack-probes.md` (relative to this skill's folder) — it holds stack-specific questions (migration rollback, old mobile builds against a changed schema, OTA vs native releases) that generic questioning misses.

Answers to one part may reopen another — that's fine. Flip the reopened part back to `⏳ open`, say why, and come back to it.

## Ending

Stop when one of these happens:

- Every part is `✅ aligned` or `❗ parked`
- The user says stop (any phrasing — "enough", "that's clear", "wrap up")
- Questioning reveals the whole thing needs a rethink and the user agrees to restart from a new breakdown

Before the summary, optionally bring in a second reviewer: if the `codex` CLI is installed, offer to run the breakdown plus the Q&A transcript through the profile in `references/second-reviewer.yaml` (relative to this skill's folder) and surface any alignment gaps or improvement ideas it finds that you missed — discussed one at a time, same rules. If `codex` is not installed, skip silently.

Then deliver the alignment summary:

```markdown
## Where we landed
**The breakdown:** <final list of parts with statuses>
**Aligned:** <per part: one line — what it is and how it will be built>
**Parked:** <open problems deferred on purpose, and what would unblock each>
**Improvements adopted:** <ideas the user accepted, per part>
**Improvements declined/deferred:** <ideas raised but not taken, so they aren't lost>
```

The summary is the shared source of truth — it should be concrete enough that either of you could hand it to a fresh agent session and get the right thing built.
