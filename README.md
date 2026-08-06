# QBLab Skills

Agent skills for planning, reviewing, and stress-testing your work. A skill is a portable set
of instructions that a coding agent loads on demand. These work with Claude Code, Codex,
Cursor, OpenCode, and ~70 other agents via the [`skills` CLI](https://github.com/vercel-labs/skills).

The skills are stack-aware: when the target repo is an Nx monorepo (NestJS, code-first
GraphQL/REST, Prisma or Drizzle on PostgreSQL/MongoDB, Next.js + Tailwind + shadcn/ui) or a
React Native Expo app, they load bundled house-stack references — phase-cutting rules,
stack-specific bug classes, and probe questions. On any other repo they fall back to generic
behavior.

## Install

```bash
# Pick from a list
npx skills add qb-lab/skills

# A specific skill, globally, for Claude Code
npx skills add qb-lab/skills --skill <name> -g -a claude-code

# Everything
npx skills add qb-lab/skills --all
```

Project installs go to `./.claude/skills/` (or your agent's equivalent); `-g` installs to your
home directory instead. `npx skills update` pulls the latest versions.

## Skills

| Skill | Category | What it does | Invoke |
| ----- | -------- | ------------ | ------ |
| [roast-my-plan](./skills/productivity/roast-my-plan/SKILL.md) | Productivity | Writes phased implementation plans sized to one AI coding-agent session per phase; roasts existing plans into that shape. | Claude Code/Cursor: `/roast-my-plan`; Codex: `$roast-my-plan` |
| [who-broke-this](./skills/engineering/who-broke-this/SKILL.md) | Engineering | Bounded Codex review loop over staged changes, with focused verification of the unstaged fixes. | Claude Code/Cursor: `/who-broke-this`; Codex: `$who-broke-this` |
| [hurt-my-feelings](./skills/productivity/hurt-my-feelings/SKILL.md) | Productivity | Breaks complex context into small parts and aligns on each through one-at-a-time questioning. | Claude Code/Cursor: `/hurt-my-feelings`; Codex: `$hurt-my-feelings` |

All three are manual-only: they run when you invoke them, never implicitly.

### roast-my-plan

Hand it a rough idea or an existing plan (existing plans get an honest roast first). You get
back a phased plan written for a fresh AI coding-agent session per phase — progress tracker,
the decisions and context a fresh session can't recover from the repo, concrete phases with
mechanical exit criteria — saved to the repo's plan location, ending with a copy-paste kickoff
prompt for phase 1. If the `codex` CLI is installed, it can run the finished plan past a second
model before delivering.

### who-broke-this

With changes staged in git, it runs a bounded review loop: Codex (pinned model, read-only)
reviews the staged diff into structured findings, a subagent triages and fixes in the working
tree (never touching the index — a hash guard enforces it), and the dispositions go back to
Codex for focused fix-verification rather than another full review. Runs up to 3 rounds
automatically; more require your explicit approval. Stops early on clean, taste-only findings,
stalemate, or thrash, and ends with a full disposition table.

Requires the [Codex CLI](https://github.com/openai/codex): `npm install -g @openai/codex`
(without it, it offers a single degraded self-review round).

### hurt-my-feelings

Bring something big or fuzzy — a plan, a feature, a pile of context. It breaks it into small
parts, then works through them one at a time with sharp, single questions — what is this part
really, and how should it be built — each with pickable suggested answers (recommendation
marked, your own answer always an option), digging into every vague
answer until you both confirm the same understanding. Questions it can answer from the codebase
it answers itself. Once a part is aligned it may offer one concrete improvement idea. Ends with
an alignment summary concrete enough to hand to a fresh agent session.

## Repo structure

```
skills/
├── engineering/
│   └── who-broke-this/
│       ├── SKILL.md
│       ├── agents/openai.yaml    # Codex host metadata (manual-only policy)
│       ├── references/           # review prompt, findings schema, stack bug classes
│       └── scripts/round-budget.sh
└── productivity/
    ├── roast-my-plan/
    │   ├── SKILL.md
    │   ├── agents/openai.yaml
    │   └── references/           # stack playbook, second-opinion profile
    └── hurt-my-feelings/
        ├── SKILL.md
        ├── agents/openai.yaml
        └── references/           # stack probes, second-reviewer profile
```

## Contributing

Skills live at `skills/<category>/<skill-name>/SKILL.md`. Scaffold one with
`npx skills init <name>`, write the instructions, and open a PR. See [AGENTS.md](./AGENTS.md)
for the category definitions, layout, and authoring conventions.

Test locally before opening a PR:

```bash
npx skills add /path/to/this/repo --skill <name>
```

## License

MIT
