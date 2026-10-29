# Data contracts

The engine validates every record. Write files in exactly these shapes; `validate` reports
any deviation with its path.

## Candidate (input to `import`)

```json
{
  "name": "Example Homes",
  "website": "https://example-homes.example",
  "industry": "Real estate brokerage",
  "country": "United Arab Emirates",
  "city": "Dubai",
  "employee_range": { "value": "11-50", "source_url": "https://..." },
  "source": { "type": "apollo", "url": "https://..." },
  "contacts": [
    { "name": "Jane Example", "title": "Managing Director", "email": "jane@example-homes.example",
      "email_verified": true, "linkedin": null, "source_url": "https://..." }
  ]
}
```

Omit a field rather than guessing it. `email_verified` is true only when the source says so.
CSV import takes one contact per row with columns `name, website, industry, country, city,
employee_range, employee_range_source, source_type, source_url, contact_name,
contact_title, contact_email, email_verified, contact_linkedin, contact_source_url`.

## Research

```json
{
  "company_id": "co_example-homes.example",
  "campaign_id": "real-estate-uae",
  "researched_on": "2026-10-29",
  "business_model": "One sentence on how they make money.",
  "evidence": [
    { "id": "ev_<short>", "url": "https://...", "observed_on": "2026-10-29",
      "summary": "What the page shows, paraphrased, under 400 characters.", "source_type": "web" }
  ],
  "facts": [ { "claim": "Hiring a CRM administrator", "evidence_ids": ["ev_<short>"] } ],
  "hypotheses": [ { "claim": "Leads are assigned by hand", "basis_evidence_ids": ["ev_<short>"], "confidence": "medium" } ],
  "unknowns": [ "Which CRM they use" ],
  "signals": {
    "<signal id from config/scoring.json>": { "value": true, "evidence_ids": ["ev_<short>"], "note": "optional" }
  },
  "pilot": { "title": "...", "scope": "...", "why": "...", "based_on": "fact | hypothesis" }
}
```

Every signal id in `config/scoring.json` should appear. `value` is `true` (with evidence),
`false` (evidence or a clear absence), or `null` (unknown). `true` without evidence is
rejected.

## Draft input (to `draft build`)

```json
{
  "company_id": "co_example-homes.example",
  "contact_id": "ct_<from the lead record>",
  "campaign_id": "real-estate-uae",
  "kind": "cold_email | linkedin_connect | linkedin_followup | followup_1 | followup_final",
  "channel": "email | linkedin",
  "recipient": "address, or the linkedin.com/in/ URL",
  "subject": "Under seven words, or null",
  "body": "Full text including the opt-out line and signature from config/outreach.json",
  "variant": "angle-or-template-id",
  "claims": [ { "text": "the observation as written", "evidence_ids": ["ev_<short>"] } ]
}
```

## Outreach state (input to `followups`)

One per contact, built from CRM properties:

```json
{
  "company_id": "co_...", "contact_id": "ct_...", "campaign_id": "...",
  "initial_sent_on": "2026-10-26", "followup_1_sent_on": null, "followup_final_sent_on": null,
  "replied_on": null, "reply_sentiment": null, "opted_out": false, "bounced": false,
  "meeting_booked_on": null, "pending_draft_kinds": []
}
```

## Snapshot (input to `report`)

```json
{
  "generated_at": "2026-10-30T17:00:00+04:00",
  "companies": [ { "key": "domain", "name": "", "campaign": "", "status": "", "score": 0,
                   "score_class": "", "discovered_on": "", "scored_on": "" } ],
  "messages": [ { "draft_id": "", "company_key": "", "campaign": "", "kind": "", "variant": "",
                  "created_on": "", "sent_on": null, "replied_on": null,
                  "reply_sentiment": null, "objection": null } ],
  "meetings": [ { "company_key": "", "booked_on": "" } ],
  "deals": [ { "name": "", "company_key": "", "campaign": null, "stage": "", "amount_aed": null,
               "created_on": "", "closed_on": null, "outcome": null } ],
  "followups_due": [ { "company_key": "", "contact": "", "kind": "", "due_on": "" } ]
}
```

Dates are `YYYY-MM-DD` in the workspace time zone. Unknown values are `null`, never zero.
