# QBLab Skills

A Claude Code plugin bundling three skills for planning, reviewing, and stress-testing your work.

## Skills

| Skill | Category | What it does |
|-------|----------|--------------|
| `/qblab:roast-my-plan` | Productivity | Writes phased implementation plans sized to one AI coding-agent session per phase |
| `/qblab:who-broke-this` | Development | Reviews staged changes with Codex, then verifies the unstaged fixes |
| `/qblab:hurt-my-feelings` | Design | Stress-tests a plan or design through relentless, one-at-a-time questioning |

## Installation

In Claude Code:

```
/plugin marketplace add qblab/skills
/plugin install qblab@qblab
```

## Usage

**Roast My Plan** — hand it a rough idea or an existing plan:

```
/qblab:roast-my-plan I want to add offline support to my notes app
```

You get back a phased plan where each phase is independently executable by a fresh agent session, with mechanical "done when" criteria.

**Who Broke This** — with changes staged in git (requires the [Codex CLI](https://github.com/openai/codex)):

```
git add -p        # stage the changes to review
/qblab:who-broke-this
```

Codex reviews the staged diff, Claude verifies each finding, then checks whether your unstaged changes actually fix the confirmed issues.

**Hurt My Feelings** — bring a plan or design you believe in:

```
/qblab:hurt-my-feelings @docs/design.md
```

One piercing question at a time until your assumptions are explicit, then a debrief of what survived, what's wounded, and what's fatal.

## Requirements

- Claude Code
- `who-broke-this` additionally needs `git` and the `codex` CLI (`npm install -g @openai/codex`)

## License

MIT
