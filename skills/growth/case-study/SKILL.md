---
name: case-study
description: >
  Draft a QBLab case study for a shipped product from its repository, its live URL, or the
  owner's notes, in the exact shape qblab.co renders (client, summary, problem, what was
  built, stack, outcome, duration, year, live URL). Use when the user says "write the case
  study for <product>", "add <product> to the work section", or points at a client repo and
  asks for a write-up.
disable-model-invocation: true
argument-hint: <product name, repo path, or live URL>
---

# Case study

Produce one complete case-study entry for a product QBLab shipped. Proof is the agency's
weakest asset, so the job is to make writing it cheap without making anything up: mine the
repository and the live product for what can be checked, and ask the owner once for the
rest.

## 1. Load QBLab context

Find the installed `qblab-context` skill (a directory named `qblab-context` containing
`SKILL.md`, wherever the host installs skills) and follow it. `proof.md` lists the existing
case studies and their known fields; `voice.md` governs the writing. The private overlay's
NDA list decides whether the client may be named.

## 2. Collect what can be checked

Read `references/entry-shape.md` (relative to this skill's folder) for the fields and the
register of each one. Then gather, in this order:

- **Repository** (if a path was given or the current directory is the product): README,
  package manifests and lockfiles for the stack; routes, screens and modules for what was
  built; first and last commit dates for duration and year; any docs or plan files for the
  original problem statement. Name only stack items that are actually in the manifests.
- **Live URL** (fetch if the host can): what the product is, who it serves, its visible
  features. Note whether it is a demo or a production site.
- **Existing entry** in the site's `content/work.ts` if the target directory is the qblab.co
  repo, or a previous draft under `~/.qblab/case-studies/`. Keep supplied fields; fill only
  `INPUT_NEEDED` ones.

## 3. Ask the owner once

Facts only the owner knows go in **one batch** of questions from
`references/intake-questions.md`, skipping any the repository or live site already answered.
Wait for the answers. Anything left unanswered stays `INPUT_NEEDED: <what>`; never fill it
from imagination, and never write an outcome number that was not supplied.

If the overlay's NDA list says the client cannot be named, or the overlay is missing, use
the sector ("a Dubai clinic group") and say in the handoff that the name is withheld.

## 4. Write the entry

- `summary`: one sentence, what it is and who it serves. This is the card text and the meta
  description.
- `problem`: what the client had before and why it was not working, two or three sentences,
  in plain words a founder would use.
- `built`: five to eight lines a client would recognise as features, not engineering tasks.
  "Patients book and reschedule from the app" passes; "set up CI" fails.
- `stack`: plainly named, from the manifests.
- `outcome`: real, checkable statements only. If the only checkable fact is "launched in N
  weeks and still shipping", that is the outcome.
- `duration` and `year` from commit dates, confirmed by the owner.

Then write a **150-word narrative** version of the same facts for reuse in proposals and
posts, following `voice.md`.

## 5. Save

- If the current directory is the qblab.co repository (`content/work.ts` exists): add or
  update the entry in `content/work.ts` in place, keep the array order, and remind the user
  that a screenshot at 16:10 must exist at the `image` path before the study counts as
  complete. Do not touch other entries. Run the repo's typecheck if one is defined and
  report the result.
- Otherwise save `~/.qblab/case-studies/<slug>.md` containing the entry as a TypeScript
  object in a code block, the narrative, and a list of remaining `INPUT_NEEDED` fields.

End with two lines: which fields are still `INPUT_NEEDED`, and whether the client is named
or withheld.
