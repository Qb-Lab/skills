@AGENTS.md

## Claude Code specifics

- Installs land in `.claude/skills/` (project) or `~/.claude/skills/` (global):
  `npx skills add qb-lab/skills -a claude-code`.
- Skills in this repo must not assume Claude Code. They run under Codex, Cursor, and OpenCode
  too — no `.claude/` paths, no Claude-only tool names, no slash commands in the instructions
  unless the skill is explicitly Claude-scoped and says so in its description.
- Frontmatter stays within the cross-agent Agent Skills spec: `name`, `description`, plus the
  invocation fields documented in AGENTS.md (`disable-model-invocation`, `argument-hint`).
  Don't add other host-only fields without discussing it first.
- To test a skill locally without installing: read the SKILL.md and follow it directly in a
  scratch repo.
