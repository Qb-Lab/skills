# QBLab Skills

Agent skills for planning, reviewing, and stress-testing your work. Works with Claude Code, Codex, Cursor, and any agent supported by [`npx skills`](https://skills.sh).

The skills are stack-aware: when the target repo is an Nx monorepo (NestJS, code-first GraphQL/REST, Prisma or Drizzle on PostgreSQL/MongoDB, Next.js + Tailwind + shadcn/ui) or a React Native Expo app, they load bundled house-stack references — phase-cutting rules, stack-specific bug classes, and kill-questions. On any other repo they fall back to generic behavior.

## Install

```bash
npx skills add qblab/skills            # pick skills interactively
npx skills add qblab/skills --all      # install all three
npx skills add qblab/skills --skill who-broke-this
```

## Skills

| Skill | Category | What it does |
|-------|----------|--------------|
| `roast-my-plan` | productivity | Writes phased implementation plans sized to one AI coding-agent session per phase |
| `who-broke-this` | engineering | Reviews staged changes with Codex, then verifies the unstaged fixes |
| `hurt-my-feelings` | productivity | Stress-tests a plan or design through relentless, one-at-a-time questioning |

### roast-my-plan

Hand it a rough idea or an existing plan. You get back a phased plan where each phase is independently executable by a fresh agent session — its own context, concrete steps, and a mechanical "done when" — plus an honest roast of the plan's biggest risk. If the `codex` CLI is installed, it can run the finished plan past a second model before delivering.

### who-broke-this

With changes staged in git, it sends the staged diff to Codex for an independent bug hunt (structured findings, no style nitpicks), verifies each finding against the real code, then checks whether your **unstaged** edits actually fix the confirmed issues. Loops review → fix → re-review up to a round budget (default 3), then tells you whether to commit or keep fixing.

Requires the [Codex CLI](https://github.com/openai/codex): `npm install -g @openai/codex`.

### hurt-my-feelings

Bring a plan or design you believe in. It asks one piercing, plan-killing question at a time — no batching, no premature advice — digging into every vague answer until your assumptions are explicit. Ends with a debrief: what survived, what's wounded, what's fatal.

## Repo structure

```
engineering/
└── who-broke-this/
    ├── SKILL.md
    ├── agents/openai.yaml        # Codex reviewer profile
    ├── references/               # review prompt + findings JSON schema
    └── scripts/round-budget.sh   # caps the review loop
productivity/
├── roast-my-plan/
│   ├── SKILL.md
│   └── agents/openai.yaml        # optional second-opinion profile
└── hurt-my-feelings/
    ├── SKILL.md
    └── agents/openai.yaml        # optional second-interrogator profile
```

## License

MIT
