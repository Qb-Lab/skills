---
name: outreach
description: >
  Research a target list of companies in a niche and draft a personalised first message plus
  two follow-ups for each, in QBLab's voice, tracked in a local pipeline file. Use when the
  user says "find me leads in <niche>", "write outreach to these companies", "cold email
  these founders", or pastes a list of companies or URLs to contact.
disable-model-invocation: true
argument-hint: <niche, or a list of companies / URLs>
---

# Outreach

Outbound is the fastest lever for a small agency, and it only works when every message
opens with something true about the reader. This skill researches each target, writes a
three-message sequence per target, and tracks it. Drafts only: nothing is ever sent, and
nothing is ever posted or submitted on a third-party site.

## 1. Load QBLab context

Find the installed `qblab-context` skill (a directory named `qblab-context` containing
`SKILL.md`, wherever the host installs skills) and follow it. `icp.md` decides who to
target and which signals matter; `voice.md` governs every line; the overlay's pipeline
notes name the niches to pursue and avoid and any warm contacts.

## 2. Build the target list

- **A list was given** (names, domains, LinkedIn URLs): use it as is.
- **A niche was given** (or none, in which case take the first "niches you want more of"
  from the overlay): if the host has web search, find ten to twenty companies matching the
  positive signals in `icp.md` (live product or waitlist, recent launch or funding, hiring
  engineers, a product visibly outgrowing a no-code tool), prioritising the UAE and the Gulf
  first, then worldwide. Without web search, ask the user for a list and stop.

Remove anyone in the overlay's avoid list, any company already in
`~/.qblab/outreach/pipeline.csv`, and anyone with a brief or proposal in the leads
directory in the last 90 days. Say how many were removed and why.

## 3. Research each target, three minutes each

Per company, find: what the product is and its state, one **specific observation** that
proves you looked (a feature, a gap, a recent change, a job post, a review complaint), the
likely decision maker and their public profile, and the best channel (email if a work
address is public or guessable from a published pattern, LinkedIn otherwise). Public pages
only; never log in, sign up, or fill a form. If no observation can be found, drop the
target and say so; a generic message is worse than none.

## 4. Write the sequence

Follow `references/sequence.md` (relative to this skill's folder): a first message, a
follow-up on day 4, and a last one on day 10. Rules that override everything else:

- The first sentence is about them, never about QBLab.
- One ask per message: a 30-minute call, with the booking link from the overlay.
- Subject line under six words. Body under 120 words. Signed by a person, with the title
  from the overlay.
- Proof is one line from `proof.md`, chosen for relevance to their sector, and honestly
  labelled.
- No prices, no attachments, no "I hope this finds you well", nothing on the banned list.

## 5. Save, draft, track

- Save `~/.qblab/outreach/YYYY-MM-DD-<niche-slug>.md` with every target's research notes
  and sequence.
- If the host has an email tool and the channel is email, create the **first message** as a
  draft only. LinkedIn messages stay in the file for the user to paste.
- Append one row per target to `~/.qblab/outreach/pipeline.csv` with the columns in
  `references/pipeline-columns.md`; create the file with a header if missing. Status is
  `drafted`; the owner moves rows to `sent`, `replied`, `booked`, `no`.

End with a table of targets: company, decision maker, channel, the observation in ten
words, and the sequence's first subject line. Then the one target to send first and why.
