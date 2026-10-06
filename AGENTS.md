# QBLab Skills — repo guide for agents

Public catalog of agent skills maintained by QBLab, installable with
`npx skills add qb-lab/skills`. Skills are portable instruction sets that any coding agent
(Claude Code, Codex, Cursor, OpenCode, and ~70 others) can install with the `skills` CLI.

This repo is **content, not code**. There is no build step, no dependencies, and nothing to
compile. A skill is a directory containing a `SKILL.md`.

Everything here is public. Never commit client names, credentials, internal URLs, or anything
under NDA — assume every file is read by strangers.

## Layout

Catalog layout — the CLI walks two levels deep under `skills/`:

```
skills/
└── <category>/
    └── <skill-name>/
        ├── SKILL.md          # required — the skill itself
        ├── agents/           # optional — host-specific metadata (e.g. openai.yaml for Codex)
        ├── references/       # optional — docs and profiles the skill tells the agent to read
        └── scripts/          # optional — executable helpers
```

`agents/openai.yaml` is Codex **host metadata** (interface strings, invocation policy) — the
Codex host reads it, not the skill. Config the skill itself consumes (reviewer profiles, prompts,
schemas) lives in `references/`.

## Categories

Use these broad capability categories:

- `engineering` — frontend, backend, mobile, infrastructure, testing, and architecture
- `design` — UI/UX, design systems, accessibility, and design-tool workflows
- `productivity` — research, writing, planning, communication, and general agent workflows
- `growth` — running the agency: positioning, sales, marketing, content, and client-facing
  workflows (briefs, proposals, outreach, posts, SEO); and the Growth OS, which markets any
  project (strategy, research, content, creative, experiments, analytics)

Create a category directory when its first skill lands; don't add empty directories. Avoid
narrower stack-based categories such as `frontend` or `backend`.

## House-stack awareness

QBLab skills are stack-aware: when the target repo is an Nx monorepo (NestJS, code-first
GraphQL/REST, Prisma or Drizzle on PostgreSQL/MongoDB, Next.js + Tailwind + shadcn/ui) or a
React Native Expo app, they load bundled house-stack references — phase-cutting rules,
stack-specific bug classes, and probe questions. On any other repo they fall back to generic
behavior. Detection is by marker files (`nx.json` + `prisma/` or `prisma.config.ts`;
`app.config.ts` + `expo` in package.json), never by assumption. New skills that could benefit
from stack context should follow the same pattern: generic by default, house-stack reference
loaded only when the markers match.

## Growth skills and the private overlay

Growth skills speak as QBLab, so they all start by loading the `qblab-context` skill, which
holds only what is already public on qblab.co. Anything private — pricing, capacity, NDA
clients, the owner's contact details, pipeline notes — lives in a **private overlay** at
`~/.qblab/context.local.md` on the owner's machine (template in
`skills/growth/qblab-context/references/private-overlay.template.md`). Skills read the
overlay when it exists and mark the gap as `INPUT_NEEDED: <what>` when it does not; they
never guess a price or a client name. Lead briefs and proposals are saved under `~/.qblab/`
as well, never in a repository.

New QBLab growth skills follow the same shape: load `qblab-context`, read the overlay,
produce a draft or a report, never send, post, or contact anyone.

## The Growth OS (growth skills for any project)

The second family of growth skills markets **any** product, not QBLab: `growth-os`
orchestrates, and focused skills own strategy, audience, market radar, community, content
ideas, calendar, copy, creative, video, launches, experiments, analytics and reviews. They
must never assume QBLab's facts, market, time zone or call to action.

- Every Growth OS skill starts by loading `project-growth-context`, the generic counterpart
  of `qblab-context`. It builds a context file from repository evidence, resolves the
  project's state directory, and holds the references more than one skill needs (state
  layout, project types, platform playbook, quality bar, hooks, languages, capabilities).
  Shared guidance goes there once; do not copy it into individual skills.
- State is private and per project: `~/.qblab/growth/<project-id>/` by default, or
  `<repo>/.growth/` when the owner created that directory. File names and schemas are fixed
  in `skills/growth/project-growth-context/references/state.md`; a skill that adds a state
  file adds it to that table. This repository holds templates and schemas only, never a
  project's marketing data.
- `<state>/learnings.md` is the learning loop: experiment, analyst and review skills write
  it, every planning skill reads it before proposing anything.
- `growth-os` coordinates and must stay thin. A new capability is a focused skill (or a
  reference in an existing one) that `growth-os` routes to, not a new section in `growth-os`.
- Capabilities are detected, never assumed: web research, image or video generation,
  analytics, scheduling and second models (`codex` included) are used when the host exposes
  them and replaced by a handoff when it does not. No skill names a provider or model.
- When a project's context says `Extends: qblab-context`, the Growth OS defers to the QBLab
  skills for the jobs they already own (`linkedin-post`, `blog-post`, `outreach`,
  `seo-audit`, `growth-brief`). Keep both families working when changing either.

## Authoring a skill

Scaffold with `npx skills init <name>`, then move it under the right category.

`SKILL.md` frontmatter:

```yaml
---
name: my-skill              # required — lowercase, hyphens, matches the directory name
description: >              # required — what it does AND when to use it
  Use when ...
---
```

For implicitly invocable skills, the `description` is the primary information an agent sees
before deciding whether to load the skill. Write it as a trigger, not a summary: lead with
"Use when ..." and name the concrete signals (file types, library names, error messages,
phrases the user would say). A description that just restates the title gets the skill ignored.

### Manual-only skills

Use manual-only invocation when a workflow should run only after the user explicitly selects
it. Support Claude Code and Codex as a pair:

1. Add `disable-model-invocation: true` to `SKILL.md` frontmatter. Claude Code and Cursor then
   expose the skill as `/<skill-name>` without loading it automatically.
2. Add `agents/openai.yaml` with:

   ```yaml
   policy:
     allow_implicit_invocation: false
   ```

   Codex then exposes the skill through `$<skill-name>` and `/skills` without invoking it
   implicitly.

Keep the base `name` and `description` valid for the Agent Skills specification so other agents
can still install the skill. Host-specific invocation controls may be ignored by other agents.
Don't set `user-invocable: false`; that hides the skill from user-facing invocation instead.

### Body conventions

- Write instructions to the agent in the imperative. No marketing, no "this skill will".
- Be prescriptive. A skill exists to encode a decision already made — state the decision and
  the reason, don't survey the options.
- Keep the body short enough to stay useful in context. Push long reference material into
  `references/` and tell the agent when to read it.
- Paths inside a SKILL.md are relative to the skill's own folder. Hosts install skills in
  different locations, so never hard-code `.claude/skills`, `.agents/skills`, or a user-level
  skill directory — resolve the directory containing the loaded `SKILL.md` at runtime when a
  script or reference must be executed by path.
- Skills that shell out to external CLIs (`codex`, etc.) must check availability first and
  degrade gracefully with a fallback.
- Skills review and report; they don't stage, commit, or push unless that is their explicit
  purpose.
- Scripts must be POSIX-ish bash, `set -euo pipefail`, executable bit set. Scripts that keep
  state must scope it to a per-run directory, never a shared global path.
- Prefer one skill that does one thing well over a kitchen-sink skill.

## Working on this repo

- Test a skill before committing: `npx skills add . --skill <name>` from a scratch project,
  then drive the agent through the workflow the skill claims to handle.
- Renaming a skill directory breaks everyone's install. Treat names as an API.
- Keep the skill table in `README.md` in sync when adding or removing a skill.
