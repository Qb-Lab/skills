---
name: qblab-context
description: >
  Use when doing any business, sales, marketing, content, or client-facing work for QBLab —
  writing a proposal, a LinkedIn post, an outreach message, a case study, a pre-call brief,
  SEO copy, or anything that speaks as QBLab or about QBLab. Loads the agency's positioning,
  offers, ideal client, proof points and writing voice so output sounds like QBLab and never
  invents facts. Other QBLab growth skills depend on it.
---

# QBLab context

Load the agency's facts and voice before producing anything that speaks as QBLab. Every
growth skill in this catalog reads these references first; if you are running one of them,
do this once at the start and reuse it for the rest of the session.

## What to read

All paths are relative to this skill's folder.

1. `references/positioning.md` — what QBLab is, the promise, the audience, the mechanism.
2. `references/offers.md` — the two plans, the delivery process, what is and is not included.
3. `references/icp.md` — who is a good fit, who is not, and the questions that decide it.
4. `references/proof.md` — real, checkable numbers, shipped products, and quotes, with their
   honest labels. Also lists what proof does **not** exist yet.
5. `references/voice.md` — how QBLab writes: rules, examples, banned phrases.

Read all five for anything client-facing. For a narrow task (for example rewriting one
sentence) `positioning.md` and `voice.md` are enough.

## Private overlay

The catalog is public, so it holds only what is already on qblab.co. Pricing, capacity,
pipeline notes, NDA clients and the owner's personal details live in a **private overlay**
that is never committed anywhere:

```
~/.qblab/context.local.md
```

If that file exists, read it after the references. It **overrides** anything in the
references on conflict. If it does not exist and the task needs something only it would hold
(a price, a client name under NDA, a personal contact), do not guess: mark the spot as
`INPUT_NEEDED: <what>` in the output and tell the user how to create the overlay from
`references/private-overlay.template.md`.

## Rules that apply to every skill using this context

- **Never invent numbers, quotes, client names, timelines or outcomes.** Only use what
  `proof.md` or the private overlay states. Anything missing becomes `INPUT_NEEDED: <what>`
  rendered visibly in the output, exactly as the qblab.co codebase does.
- **Honest labels.** Collaborator quotes are labelled as collaborators, demos as demos,
  in-progress work as in progress. If a claim cannot be checked, it is not made.
- **The call is the conversion event.** Every piece of client-facing output ends by pointing
  at the free 30-minute call, never at a contact form or an email address.
- **No prices in public copy.** Prices are quoted on the call. Public copy says so plainly.
- **Speed is the promise, review is the guarantee.** AI-assisted development is the reason
  work is fast; senior engineering review is why it is safe. Say both, in that order, and
  never let "AI" carry the sentence on its own.
- Voice rules in `voice.md` are not optional and are not suggestions.
