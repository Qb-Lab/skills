---
name: follow-up-manager
description: >
  Check the mailbox and CRM for sent messages, replies, bounces and opt-outs, stop
  sequences that should stop, and draft the follow-ups that are due (business day 4, then
  about a week later) for the owner's review. Use when the user says "check follow-ups",
  "who replied", "/leadgen followups", or on the scheduled morning follow-up run.
disable-model-invocation: true
argument-hint: "[campaign-id]"
---

# Follow-up manager

Most replies come from the second or third touch, and most damage comes from a follow-up
sent to someone who already answered. Check replies first, then draft.

## 1. Load the shared rules

Find the installed `leadgen` skill and read `references/rules.md`,
`references/workspace.md`, `references/data-contracts.md` and `references/crm.md`. Read
`config/schedule.json` for working days, holidays and cadence.

## 2. Reconcile what actually happened

For every contact with `leadgen_outreach_status` in `draft_pending`, `initial_sent`,
`followup_1_sent`:

1. **Sent:** search the mailbox's sent folder for messages to the contact's address since
   the draft was created. A sent message whose text matches a draft records the send date
   in the CRM and a line in `data/sent-log.jsonl` (draft id, version, hash, recipient,
   sent at). A sent message that matches no draft is logged as `sent_outside_queue`, not
   attributed to a variant.
2. **Replies:** search for messages from the contact or their domain after the send date.
   Any reply stops the sequence. Run `reply classify` on it: opt-out or decline language is
   handled as an opt-out immediately (CRM flag, statuses, `suppress add`). Everything else
   is summarised for the owner in one line, tagged `positive`, `neutral` or `negative`,
   with the objection in a few words if there is one, and never answered by the run.
3. **Bounces:** a delivery failure for the address marks the contact `bounced` and adds the
   email to suppression with reason `bounced`.
4. **LinkedIn:** there is no supported way to read it. Ask the owner in the summary which
   LinkedIn requests were accepted or answered; record only what they say.

Hand all CRM updates to `crm-manager`.

## 3. Decide the next step

Build one outreach state per contact (shape in `data-contracts.md`) from the reconciled CRM
values, including `pending_draft_kinds` for drafts already waiting, then:

```
node src/cli.ts followups --state runs/<date>/outreach-state.json --out runs/<date>/followups.json
```

The engine returns `draft`, `wait`, `stop` or `already_queued` per contact. Do not draft
anything it did not return as `draft`.

## 4. Draft what is due

For each `draft`, write the step's message with `outreach-personalization`'s
`references/message-patterns.md`, in the same thread as the original, then build, lint and
save it unsent exactly as that skill does. Check suppression again first. Respect
`limits.followups_per_run`.

## 5. Notify

At the top of the run's output: replies that need the owner (who, sentiment, one-line
summary, link), opt-outs handled, bounces, follow-ups drafted, overdue items with days
overdue. If the run is unattended, include this in the notification described in the
`leadgen` rules.
