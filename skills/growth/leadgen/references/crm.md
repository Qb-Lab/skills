# CRM conventions

The CRM is the source of truth for companies, contacts, statuses, outreach dates and deals.
The workspace keeps evidence, drafts and approvals, keyed by the same ids. Do not keep a
second copy of a status anywhere else.

## Keys

- Company: the normalized domain (`example-homes.example`) in the unique property named by
  `company_key_property` in `config/crm.json`. Also set the CRM's own `domain` field.
- Contact: `email:<address>`, `li:<profile slug>` or `name:<first-last>@<domain>` in the
  unique property named by `contact_key_property`. Also set `email` when known.
- Upsert by those keys. Never create a record without first searching by key; never update
  by display name.

## Statuses (company property `leadgen_status`)

```
new → qualified → ready_for_review → contacted ⇄ follow_up_due → responded → meeting_booked
                       ↘ not_relevant / disqualified          ↘ closed_no_reply
any status → opted_out (terminal)
```

The engine's `crm plan` refuses invalid transitions and keeps the current status instead.
`contacted` is set only after the owner's sent message is seen in the mailbox, never when
a draft is created.

## Contact outreach properties

`leadgen_outreach_status`, `leadgen_initial_sent_on`, `leadgen_followup_1_sent_on`,
`leadgen_followup_final_sent_on`, `leadgen_replied_on`, `leadgen_reply_sentiment`,
`leadgen_next_followup_on`, `leadgen_variant`, `leadgen_objection`. Dates come from the
mailbox (the date of the sent or received message), not from when the run happened.

## Deals

Separate pipeline (label in `config/crm.json`): Discovery, Qualified opportunity,
Proposal, Negotiation, Closed won, Closed lost. A deal is created only when a meeting is
booked or the owner asks. Amounts are entered by the owner; runs never invent one.

## Notes and tasks

- Research goes on the company as one note per scoring run, starting with the dedupe key
  from the plan (`[leadgen:research:<hash>]`). Search for that key before writing; if it
  exists, skip.
- Review and follow-up work becomes a CRM task assigned to the owner, titled
  `Review outreach: <company>` or `Follow-up due: <contact> (<step>)`, due today, with the
  draft link in the body. Search open tasks with the same title first; never duplicate.

## Opt-outs

Set the contact's CRM opt-out or unsubscribe flag where the CRM has one, set
`leadgen_outreach_status` to `opted_out`, set the company to `opted_out` when the whole
company asked, and add the suppression entry in the workspace.

## Retention

Disqualified and not-relevant companies keep only key, name, status and reason after the
number of days in `retention_days.disqualified_evidence`; `retention` lists local run
folders past that window for the owner to delete. Contacts with no reply after
`no_reply_contact` days are listed for the owner to review in the weekly review. Runs
never delete CRM records.
