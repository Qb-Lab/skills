# QBLab Skills

Agent skills for planning, reviewing, and stress-testing your work, plus growth skills for
running a software agency. A skill is a portable set
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
| [qblab-context](./skills/growth/qblab-context/SKILL.md) | Growth | QBLab's positioning, offers, ideal client, proof and voice, loaded before any client-facing work. | Loads automatically when the task speaks as QBLab; Codex: `$qblab-context` |
| [pre-call-brief](./skills/growth/pre-call-brief/SKILL.md) | Growth | One-page brief before a discovery call: who the lead is, fit, scope and plan hypothesis, quote range, questions to ask. | Claude Code/Cursor: `/pre-call-brief`; Codex: `$pre-call-brief` |

The engineering and productivity skills are manual-only: they run when you invoke them, never
implicitly. `qblab-context` is the exception — it is a context pack the other growth skills
depend on, so agents may load it on their own.

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

### qblab-context

A context pack, not a workflow. It holds what is already public on qblab.co — positioning,
the two plans, the good-fit / not-a-fit profile, real proof points with their honest labels,
and the writing voice with a banned-phrase list — so anything an agent writes as QBLab sounds
like QBLab and never invents a number. Private facts (pricing, capacity, NDA clients) come from
an overlay at `~/.qblab/context.local.md` that is never committed; copy the bundled template to
create it. Every other growth skill starts by loading this one.

### pre-call-brief

Hand it a Cal.com booking, a pasted enquiry, or a name and company (or say `next` and, if
your agent can read email, it finds the soonest upcoming booking). It does time-boxed public
research on the person, the company and any existing product, scores fit against QBLab's
profile, proposes a scope size and which plan to lead with, pulls a quote range from your
private overlay, and lists the five to eight questions that actually change the estimate.
The brief is saved under `~/.qblab/leads/` and printed. It never contacts the lead.

## Repo structure

```
skills/
├── engineering/
│   └── who-broke-this/
│       ├── SKILL.md
│       ├── agents/openai.yaml    # Codex host metadata (manual-only policy)
│       ├── references/           # review prompt, findings schema, stack bug classes
│       └── scripts/round-budget.sh
├── growth/
│   ├── qblab-context/
│   │   ├── SKILL.md
│   │   ├── agents/openai.yaml
│   │   └── references/           # positioning, offers, icp, proof, voice, overlay template
│   └── pre-call-brief/
│       ├── SKILL.md
│       ├── agents/openai.yaml
│       └── references/           # research checklist, brief template
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
