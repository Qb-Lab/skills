# CLAUDE.md

See [AGENTS.md](AGENTS.md) for the repo layout and skill-authoring conventions — everything there applies to Claude Code too.

Claude-specific notes:

- When editing a SKILL.md, keep the frontmatter to `name` and `description`; this repo targets the cross-agent `npx skills` format, so don't add Claude-plugin-only fields (`context:`, `allowed-tools:`, etc.) without discussing it first.
- To test a skill locally without installing: read the SKILL.md and follow it directly in a scratch repo.
