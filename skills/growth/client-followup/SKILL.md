---
name: client-followup
description: >
  Draft a post-launch check-in to a QBLab client that asks for a testimonial and a referral,
  with a specific observation about their live product and a three-question prompt that
  makes the testimonial easy to write. Use when the user says "follow up with <client>",
  "ask <client> for a testimonial", "who is due a check-in", or after a launch is 30 days
  old.
disable-model-invocation: true
argument-hint: <client name, or "due">
---

# Client follow-up

QBLab's site has collaborator quotes, not client quotes, and referrals close better than
anything else. Both come from the same message: a short check-in sent about a month after
launch, then every quarter for subscription clients. Draft only; the owner sends.

## 1. Load QBLab context

Find the installed `qblab-context` skill (a directory named `qblab-context` containing
`SKILL.md`, wherever the host installs skills) and follow it. The overlay's client list and
NDA list decide who may be asked for a public quote.

## 2. Find the client

Clients live in `~/.qblab/clients.md`, one table row each: name, contact, product, live
URL, plan, launch date, last follow-up date, testimonial status. If the file is missing,
create it from `references/clients-template.md` (relative to this skill's folder), fill what
the overlay and the leads directory already know, and ask the user to complete it before
continuing.

- **A name was given:** use that row.
- **`due`:** list clients whose launch is 30 or more days ago with no follow-up logged, and
  subscription clients with no follow-up in the last 90 days. Draft for all of them, most
  overdue first.

## 3. Look at their product first

Visit the live URL if the host can. Find one specific, positive, true observation: a new
feature, a review, traffic or store ranking if public, a press mention, or simply that it is
fast and up. The message must prove QBLab still looks at the thing it built. Without
browsing, ask the user for one observation.

## 4. Write three drafts

From `references/templates.md`:

1. **The check-in**: the observation, one question about how it is going, then the
   testimonial ask with the three questions that make writing one easy, and the referral
   ask as one specific sentence ("one founder who needs a product live this quarter").
   Under 150 words. Signed by the owner.
2. **The thank-you reply** for when they answer: turns their three answers into a
   two-sentence quote in their words, asks permission to publish it with name, role and
   company, and offers to change anything.
3. **The referral introduction** they can forward: three lines a client can send to a friend
   without editing.

Subscription clients get the check-in without the testimonial ask if one is already on
file; the ask becomes "anyone you would introduce us to".

## 5. Save and log

Save `~/.qblab/followups/YYYY-MM-DD-<client-slug>.md` with all three drafts. Create the
message as an email **draft** if the host has an email tool; never send. Update the
client's row in `clients.md`: last follow-up date stays unchanged until the owner marks it
sent, so add the date under a `drafted` note instead.

End with one line per client drafted: name, the observation used, and what is being asked
for.
