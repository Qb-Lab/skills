---
name: outreach-personalization
description: >
  Draft short, specific outreach for qualified leads (cold email, LinkedIn connection
  request and follow-up, first and final follow-up email) from verified research, lint each
  draft, save email drafts unsent in the mail tool and queue everything for the owner's
  review. Use when the user says "prepare outreach", "draft emails for the top leads",
  "/leadgen outreach", or leads are ready for review.
disable-model-invocation: true
argument-hint: "[campaign-id | company domain] [--limit N]"
---

# Outreach personalization

A message earns a reply when its first line is a true observation about the reader and its
ask is small. Write fewer, better drafts. Nothing here is sent; the owner reviews and sends.

## 1. Load the shared rules and voice

Find the installed `leadgen` skill and read `references/rules.md`,
`references/workspace.md`, `references/data-contracts.md` and, in this skill's folder,
`references/message-patterns.md`. Read `config/outreach.json` (limits, banned phrases,
opt-out line, signature) and `config/agency.json`. When the agency id is `qblab`, load the
`qblab-context` skill and follow `voice.md` and `proof.md`.

## 2. Pick recipients

Leads in CRM status `ready_for_review` (then high-scoring `qualified` ones with a reachable
contact), never contacted before, highest score first, up to `limits.drafts_per_run`.
Skip any company with an open draft or a message sent in the last 90 days.

For each, before writing anything, run `suppress check` for the email, LinkedIn URL and
domain, and read the CRM opt-out flag. Suppressed: skip and say why.

## 3. Choose the channel

Email when the lead has a verified business email; LinkedIn connection request when there
is only the person's own profile URL. One channel per first touch.

## 4. Write

Follow `references/message-patterns.md`. The non-negotiables:

- The first sentence is a verified fact about them, taken from research `facts`.
- The bridge to what the agency does is phrased as a question or a possibility, never as
  knowledge of their internals.
- One achievable outcome tied to the campaign's pilot, no numbers you cannot source.
- One low-friction ask. No price, no attachment, no calendar link in a first touch unless
  the owner configured one.
- The opt-out line and signature from `config/outreach.json`, verbatim, on email.
- Cold email under the configured word limit (default 110); LinkedIn note under 300
  characters.

List each factual statement in `claims` with the evidence ids that support it. Pick a
`variant` id that names the angle (for example `observation-routing-v1`) so results can be
compared later.

## 5. Build, lint, fix

```
node src/cli.ts draft build --input <input> --out runs/<date>/drafts/<id>.v1.json
node src/cli.ts draft lint --draft <file> --research runs/<date>/research/<company>.json --domain <domain>
```

Fix every error and rebuild. A draft that cannot pass lint without inventing something is
dropped, with the reason in the queue.

## 6. Save for review

- **Email:** create the draft in the mail tool, addressed to the prospect, unsent. Record
  its draft id in the draft file. Never call a send tool.
- **LinkedIn:** text only, in the review queue, for the owner to paste.
- Write `runs/<date>/review-queue.md`, one block per draft: company and person, score and
  class, the evidence with links, the message, the lint warnings, and the owner's options:
  approve (send it yourself), edit, reject, regenerate, mark not relevant.
- Hand to `crm-manager`: a review task per company, contact property
  `leadgen_outreach_status: draft_pending`, `leadgen_variant`.

## 7. Owner decisions

When the owner replies with decisions, record each with `approval record` against the
exact draft file. An edit goes through `draft revise` (new version, new hash) and lint
again. "Regenerate" writes a new draft with a different angle. "Not relevant" adds the
company to suppression with reason `not_relevant` and sets the CRM status. Approving one
draft never approves another.
