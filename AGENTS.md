# QBLab Skills — repo guide for agents

This repo is a catalog of agent skills installable with `npx skills add qb-lab/skills`. It contains no application code — every deliverable is a skill folder.

## Layout

```
<category>/<skill-name>/
├── SKILL.md            # required: YAML frontmatter (name, description) + instructions
├── agents/openai.yaml  # optional: profile for delegating part of the skill to Codex
├── references/         # optional: prompts, schemas, docs the skill loads on demand
└── scripts/            # optional: helper scripts the skill runs
```

Current categories: `engineering/`, `productivity/`. The skills CLI discovers `SKILL.md` files up to three levels deep from the repo root, so `<category>/<skill>/SKILL.md` is the canonical depth — don't nest deeper.

## Conventions

- Skill folder names are kebab-case and match the `name:` field in frontmatter.
- `description:` must say both what the skill does and when to use it — installers and agents pick skills by this line alone.
- Paths inside a SKILL.md are relative to the skill's own folder (skills are copied into each agent's install location, so absolute or repo-rooted paths break).
- Skills that shell out to external CLIs (`codex`, etc.) must check availability first and degrade gracefully with a fallback.
- Skills review and report; they don't stage, commit, or push unless that is their explicit purpose.
- Scripts must be POSIX-ish bash, `set -euo pipefail`, executable bit set.

## Adding a skill

1. Create `<category>/<new-skill>/SKILL.md` (pick an existing category unless a new one is clearly needed).
2. Keep SKILL.md lean; push long prompts/schemas into `references/`.
3. Add the skill to the table in `README.md`.
