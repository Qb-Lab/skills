---
name: pre-call-brief
description: >
  Prepare a one-page brief before a QBLab discovery call: who the lead is, what they are
  likely building, fit against QBLab's ideal client, a scope and plan hypothesis, a quote
  range from private pricing, and the questions that change the estimate. Use when the user
  has a Cal.com booking, an inbound enquiry, or a name and company and says "prep me for
  this call", "who is this lead", or "brief me on <name>".
disable-model-invocation: true
argument-hint: <"next" | pasted booking or enquiry | name and company>
---

# Pre-call brief

Turn a booking or enquiry into a brief the owner can read in two minutes before a 30-minute
discovery call. The brief exists so the call is spent on the questions that change the
estimate, not on things research could have answered. Research and report only: never
contact the lead, never send anything, never sign up for their product.

## 1. Load QBLab context

Find the installed `qblab-context` skill (a directory named `qblab-context` containing
`SKILL.md`, wherever the host installs skills) and follow it: read its five references and
the private overlay at `~/.qblab/context.local.md` if it exists. If the skill is not
installed, tell the user to run `npx skills add qb-lab/skills --skill qblab-context` and
continue with what you can, marking every fact you would have taken from it as
`INPUT_NEEDED`.

Without the private overlay there is no pricing. The brief then says
`INPUT_NEEDED: pricing (create ~/.qblab/context.local.md)` in the quote line. Do not estimate
a price from general knowledge.

## 2. Get the lead

Resolve the argument in this order:

- **Pasted text** (a booking confirmation, an email, a LinkedIn message): use it as is.
- **A name, a company, or a URL**: use it as the starting point for research.
- **`next`, or no argument**: if the host has an email tool, search the inbox for Cal.com
  booking notifications from the last 14 days (sender domain `cal.com` or `cal.eu`, subjects
  like "New event", "Confirmed", or containing "30min"), pick the soonest upcoming booking,
  and confirm the choice with the user in one line before continuing. Cal's booking form
  captures name, email, notes, and QBLab's custom questions (project type, budget); pull all
  of them into the brief verbatim. If there is no email tool, ask the user to paste the
  booking confirmation and stop until they do.

Record the **source** (Cal.com booking, referral, LinkedIn, inbound email, other) and the
**call time** if known.

## 3. Research, time-boxed

Follow `references/research-checklist.md` (relative to this skill's folder). Budget the
equivalent of ten minutes: the checklist is ordered by value, so stop when the budget is
spent and list what was skipped. Use the host's web fetch or browser tools where available;
without them, work from the pasted text only and say so.

Rules:

- Read public pages only. Do not log in, create accounts, submit forms, or download
  anything.
- Note every claim's source (URL or "booking form"). Unverified claims are labelled
  "unverified".
- If the person and the company cannot be found, say so in one line and move on. A thin
  brief is better than a fabricated one.

## 4. Assess

Using `icp.md` from the context pack:

- **Fit:** list which good-fit signals are present, which not-a-fit flags are present, then
  one verdict: `strong`, `likely`, `unclear`, or `decline`, with a one-sentence reason.
- **Scope hypothesis:** which of QBLab's services are involved (web, mobile, backend, AI
  features, dashboard, integrations), what exists today, and a size call of S, M, or L with
  a one-line justification. Say what you are guessing.
- **Plan to lead with:** subscription by default; project when they clearly want one
  delivery first. Give the reason.
- **Quote range:** from the private overlay's pricing for that size, or `INPUT_NEEDED`.
- **Risks and unknowns:** the three things most likely to change the estimate or sink the
  deal.

## 5. Write the brief

Fill `references/brief-template.md` exactly. Keep the whole thing under one screen: short
bullets, no paragraphs. Questions are the ones research could not answer, ordered by how
much the answer moves the estimate, five to eight of them. The suggested opening line is one
sentence in QBLab's voice that shows you did the homework.

Save it to the leads directory from the private overlay (default `~/.qblab/leads/`) as
`YYYY-MM-DD-<company-or-name-slug>.md`, creating the directory if needed, then print the
full brief in the reply. If the file already exists, append a dated "Update" section instead
of overwriting.

## 6. Hand off

End with three lines: the verdict, the plan and quote range you would open with, and the
single question to ask first. Nothing else. Do not offer to email the lead.
