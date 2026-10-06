---
name: project-growth-context
description: >
  Use when doing marketing, growth, content, launch, audience, competitor or analytics work
  for any product or project: "grow this app", "who is this for", "what should we post",
  "plan the launch", or when another Growth OS skill asks for project context. Builds or
  loads the project's growth context (product, audience, positioning, brand, channels, goals,
  constraints) from repository evidence, resolves where that project's private growth state
  lives, and holds the shared rules and playbooks every Growth OS skill follows. Never
  invents facts; gaps stay INPUT_NEEDED. For work that speaks as QBLab itself it layers on
  top of qblab-context instead of duplicating it.
---

# Project growth context

The foundation of the Growth OS. Every other growth skill for a project starts here: it
answers "which project is this, what is true about it, and where does its growth state
live". Do it once per session and reuse the result.

All paths below are relative to this skill's folder unless they start with `~` or `<state>`.

## 1. Resolve the project and its state directory

Run the resolver from the root of the project being marketed:

```bash
bash "<this skill's folder>/scripts/growth-state.sh"            # project = current repo
bash "<this skill's folder>/scripts/growth-state.sh" "<name>"   # owner named a project
```

It prints `project_id`, `state_dir`, `scope`, whether a context file exists, and the ids of
projects that already have state. It creates nothing. If the owner names a project, match it
against `known_projects` before treating it as new. If bash is unavailable, derive the same
values by hand using the rules in `references/state.md`.

`<state>` below means the resolved `state_dir`. Growth state is private marketing data: it
lives under `~/.qblab/growth/<project-id>/` by default and inside the project only when the
owner has created a `.growth/` directory there on purpose. Never write it anywhere else, and
never into a repository that did not opt in. `references/state.md` defines every file, its
columns, and which skill writes it.

## 2. Load the context, or build it

**`<state>/context.md` exists:** read it, then read `<state>/context.local.md` if present
(private overrides; it wins on conflict). If the `Last verified` date is more than 90 days
old, or the repository has clearly moved on (new platforms, renamed product, a pricing page
that was not there), say so in one line and offer a refresh; do not silently rebuild.

**It does not exist:** build it.

1. Mine the repository and any live URL using `references/discovery.md`. Evidence first:
   everything the code, the site copy, the store metadata and the git history can answer is
   answered from them, with the source noted.
2. Classify the project type and stage with `references/project-types.md`. Type comes from
   markers; stage needs the owner unless the evidence is unambiguous.
3. Ask the owner **one batch** of questions for what cannot be discovered, at most seven,
   from the list at the end of `references/discovery.md`. Use the host's structured question
   prompt if it has one. Skip anything already answered. Unanswered questions are not
   blockers.
4. Fill `references/context-template.md` and save it to `<state>/context.md`. Every line
   carries its source tag. Every material fact still unknown is written as
   `INPUT_NEEDED: <what>` and listed again under "Open inputs".
5. Print a ten-line summary: what the product is, who it appears to be for, type and stage,
   the goal, and the open inputs that most limit the plan.

The context is a working document. Any skill that learns a durable fact (the owner states the
price, research confirms a competitor, analytics reveals the real audience) updates the
relevant line with its source and date instead of keeping the fact to itself.

## 3. QBLab itself

When the thing being marketed is QBLab the agency (the context says
`Extends: qblab-context`, or the repository is the qblab.co site, or the owner says the
output speaks as QBLab), do not restate QBLab's facts in the project context. Find the
installed `qblab-context` skill (a directory named `qblab-context` containing `SKILL.md`,
wherever the host installs skills) and follow it; its references and
`~/.qblab/context.local.md` are the source for positioning, offers, ideal client, proof and
voice, and its rules win on conflict. The project context then holds only what that pack
does not: channels, goals, the growth objective, analytics, constraints. Facts taken from
the pack are tagged `[qblab-context]`. A product QBLab built for a client is **not** QBLab;
it gets its own context.

The QBLab skills keep the jobs they already own, and Growth OS skills hand those jobs over
by finding the installed skill and following it:

| Job | Owner |
| --- | --- |
| LinkedIn posts | `linkedin-post` |
| Site articles | `blog-post` |
| Outbound to prospects | `outreach` |
| Site search and answer-engine readiness | `seo-audit` |
| Weekly site funnel and pipeline (and the site's analytics event dictionary) | `growth-brief` |
| Case studies, client check-ins, call prep, proposals | `case-study`, `client-followup`, `pre-call-brief`, `proposal` |

Those skills keep their own files under `~/.qblab/` (`posts/log.md`, `outreach/`,
`briefs/`), and those files stay the record for their jobs. So the two memories agree:
after handing a content job to one of them, add one row to `<state>/content-log.csv` whose
`source` is the file it wrote; and when checking for repeats or planning content, read
`~/.qblab/posts/log.md` alongside the content log.

## 4. Shared references

Other Growth OS skills point here for anything used by more than one of them. Read only what
the task needs.

| File | Read it when |
| --- | --- |
| `references/state.md` | reading or writing any file under `<state>` |
| `references/project-types.md` | choosing objectives, channels or loops; classifying a project |
| `references/platform-playbook.md` | planning or writing for a specific platform |
| `references/quality-bar.md` | producing anything a person will read or publish; running a critique round |
| `references/hooks.md` | writing a hook, a headline, an opening line or a first frame |
| `references/languages.md` | the context lists a language other than English, or the owner asks for one |
| `references/capabilities.md` | deciding whether to research live, generate media, pull analytics, schedule, or call a second model |

## 5. Rules for every skill using this context

- **Never invent** traction, revenue, customers, conversion rates, testimonials, pricing,
  metrics, competitors, outcomes, press, or user demographics. A fact comes from the
  repository, a fetched page, a file the owner supplied, or the owner's own words. Anything
  else is `INPUT_NEEDED: <what>`, visible in the output, never papered over.
- **Describe only what you have seen.** The contents of an image, a recording, a screen or
  a page come from viewing it, or from the repository or the owner saying what it shows.
  Otherwise write what to capture or check, not what is there.
- **Estimates are labelled as estimates.** Scores, effort guesses, thresholds and default
  milestones (the "first 100 users" kind) are planning judgements: say so where they
  appear, never present one as the owner's target or as a measurement, and keep them out
  of published copy.
- **Label the kind of claim.** `Observed` (you saw it, with a source), `Inferred` (follows
  from observations, say from which), `Hypothesis` (a bet to test). Research and strategy
  output carries these labels; published copy uses only what is observed or owner-supplied.
- **Decision, rationale, action.** Lead with what to do, give the reason in a line or two,
  end with the concrete next step. No marketing theory, no surveys of options.
- **Specific to this project or cut.** If a sentence would be equally true of any product in
  the category, it is filler. Replace it with something only this project could say, or
  delete it.
- **Draft, plan and report only.** Nothing is sent, posted, submitted, scheduled or spent
  without the owner. Statuses that mean "this went out" (`published`, `sent`, `launched`)
  are set only when the owner says so or supplies the live URL.
- **Honest about tools.** Say once in the output whether research was live or from supplied
  material only, and whether a media asset was generated or handed off. Never describe a
  capability the host does not have. See `references/capabilities.md`.
- **Truthful marketing.** No fake reviews, testimonials, customers, press or scarcity; no
  generated person presented as a real customer; no impersonation; no copied competitor or
  creator content; no community spam. `references/quality-bar.md` has the full list.
- **Respect the constraints section.** Claims to avoid, regulated-industry limits, geography
  and languages in the context override any playbook default.
