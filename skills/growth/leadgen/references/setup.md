# Setup

Run once per workspace, and again whenever an integration changes. Report every row as
`tested`, `not connected`, or `failed: <reason>`. Never write `working` for something that
was not called in this session.

## 1. Engine and configuration

- `node --version` is 22.18 or later.
- `node src/cli.ts config check` passes.
- `npm test` passes (when the workspace ships tests).
- `config/agency.json` has no `INPUT_NEEDED` values. List any that remain; drafts that
  would contain them fail lint until they are filled.

## 2. Integrations

Check the tools this host actually exposes. For each, make one harmless read call:

| Integration | Harmless test | Needed for |
| --- | --- | --- |
| CRM (HubSpot) | read the account or list one company | every command except `discover` |
| Prospecting (Apollo) | an organization search capped at one result | `discover` from Apollo |
| Mail (Gmail) | list drafts or labels | `outreach`, `followups`, reports by email |
| Web search and fetch | search for the agency's own site | `discover` from the web, `research` |
| Scheduler | list scheduled jobs | unattended runs |

Missing integrations get a fallback, not a workaround: CSV import instead of a prospecting
tool, a file report instead of email, the review queue file instead of mail drafts.

## 3. CRM properties and pipeline

Read `crm.md`. List which of the properties in the workspace's CRM definition file
already exist. Show the owner the missing ones and the deal pipeline, and create them only
after a yes in this session. Creating CRM schema is a change to their account.

Then test idempotency on one record the owner names or a clearly labelled test company on
a reserved domain (`example.com`): plan, apply, apply again, and confirm the second apply
changed nothing. Delete nothing; tell the owner the test record exists so they can remove
it.

## 4. Schedules

List the jobs in `config/schedule.json`. Create them with the host's scheduler only after
the owner says yes, one job per entry, with the prompt file's content as the job's prompt
and the configured time zone. Read the schedule back and record its id in the run log. If
the host has no scheduler, say so and leave the jobs as recommended.

## 5. Report

One table: integration, status, what was tested, what is still needed from the owner.
