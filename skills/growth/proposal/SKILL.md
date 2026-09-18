---
name: proposal
description: >
  Turn discovery-call notes, a transcript, or a saved pre-call brief into a fixed-scope QBLab
  proposal the client can say yes to: their goal in their words, scope table, exclusions,
  timeline, plan and price, assumptions, what QBLab needs from them, ownership, next step.
  Use after a call when the user says "write the proposal", "send them a quote", or "turn
  these notes into a proposal".
disable-model-invocation: true
argument-hint: <call notes, transcript, or lead name>
---

# Proposal

Write the document that follows the 30-minute call. On the call the owner already gave a
plan and a fixed quote; the proposal writes it down so the client can forward it, get a
yes from whoever else decides, and start. Same-day turnaround is the point: keep it under
two pages and do not ask for more than one round of clarification.

## 1. Load QBLab context

Find the installed `qblab-context` skill (a directory named `qblab-context` containing
`SKILL.md`, wherever the host installs skills) and follow it: read the references and the
private overlay at `~/.qblab/context.local.md`. If the skill is missing, tell the user to
run `npx skills add qb-lab/skills --skill qblab-context` and mark every fact you would have
taken from it as `INPUT_NEEDED`.

## 2. Gather the inputs

- **Call notes or transcript** from the argument or pasted text. Read fully first.
- **The pre-call brief**, if one exists: look in the leads directory (overlay, default
  `~/.qblab/leads/`) for a file whose slug matches the lead's name or company. Use it for
  research facts; the call notes win on any conflict.
- **What was agreed on the call.** Extract: the product in one sentence, what exists today,
  the scope items named, the plan chosen (subscription or project), the price quoted, the
  start date, the deadline that matters, integrations named, who decides.

If the notes do not contain a price, take the overlay's price for the size in the brief and
label it "to confirm" in the handoff, never in the client-facing text. Without an overlay,
the price line reads `INPUT_NEEDED: price` and you say so.

If a scope item is too vague to write as a testable line (see rule below), ask the user
about it in **one batch** of questions, then write. Do not drip-feed questions.

## 3. Write the proposal

Fill `references/proposal-template.md` (relative to this skill's folder). Rules:

- **Their goal in their words.** The opening paragraph quotes or closely paraphrases what
  the client said they need to be true in three months. No QBLab pitch here.
- **Every scope line is testable.** "Patients book, reschedule and cancel appointments from
  the mobile app" passes. "Appointment management" fails. Group lines by area (web app,
  mobile app, backend, dashboard, integrations, AI features).
- **Exclusions are explicit.** List what a reasonable client might assume is included and is
  not: content, app store accounts, ongoing ad spend, data migration, third-party fees.
- **Timeline follows the site's shape** for a first version: week one plan and design, weeks
  two and three build with working software every few days, week four launch. Stretch only
  when the scope clearly needs it, and say why. Subscription proposals describe the request
  flow and the two-to-five-day delivery cadence instead of a week table.
- **One price, fixed.** Never hourly, never a range in the client-facing text. Payment terms
  come from the overlay; if absent, `INPUT_NEEDED: payment terms`.
- **Ownership section is mandatory** and uses the site's wording: repositories and cloud
  accounts belong to the client from day one; if they stop, nothing changes.
- **Assumptions and "what we need from you"** are concrete: accounts to create, assets to
  send, decisions to make, and by when.
- **Next step is one action** with a date: reply yes, or book the kickoff.
- Voice per `voice.md`. Tables for scope and timeline, prose for reasoning, numbers on their
  own line.

## 4. Save and hand off

Save as `<leads dir>/YYYY-MM-DD-<slug>-proposal.md`. If the host has an email tool, also
create a **draft** to the client with the cover note from `references/cover-email.md` and
the proposal as the body or attachment. Never send it.

End with three lines: the price and plan, the start date, and the one assumption most
worth double-checking before sending. Nothing else.
