---
name: who-broke-this
description: Reviews staged changes with Codex, then verifies the unstaged fixes. Use when the user has staged work in git and wants an independent second-model review before committing.
allowed-tools: Bash(git diff *), Bash(git status *), Bash(git log *), Bash(codex *), Read, Grep, Glob
---

# Who Broke This

Run an independent review of the **staged** changes using the Codex CLI, then check whether the **unstaged** changes actually fix what the review found.

## Preconditions

1. Confirm this is a git repo and there are staged changes: `git status --short`.
   - No staged changes → tell the user and stop.
2. Confirm the `codex` CLI is available: `command -v codex`.
   - Not installed → tell the user how to install it (`npm install -g @openai/codex`) and offer to run the review yourself as a fallback instead.

## Step 1 — Review staged changes with Codex

Capture the staged diff and hand it to Codex for a non-interactive review:

```bash
git diff --staged > /tmp/staged.diff
codex exec "Review this diff for bugs, regressions, and broken behavior. Be specific: file, line, what breaks, and under what input. Ignore style. Diff follows:

$(cat /tmp/staged.diff)"
```

If the diff is large, review it in chunks per file rather than truncating silently.

## Step 2 — Triage the findings

For each Codex finding, verify it yourself against the actual code (Read the files — don't trust the diff context alone). Classify:
- **Confirmed** — real issue, reproduce the failure scenario in one sentence
- **Rejected** — false positive, say why in one sentence

## Step 3 — Verify the unstaged fixes

Look at what's unstaged: `git diff`.

For each **confirmed** finding, determine:
- **Fixed** — an unstaged change addresses it (name the file/lines)
- **Partially fixed** — unstaged change touches it but doesn't fully resolve it
- **Unfixed** — nothing unstaged addresses it

Also flag unstaged changes that address *nothing* from the review — the user should know what that code is for before it gets staged.

## Output

```markdown
## Review of staged changes
| # | File | Finding | Verdict |
|---|------|---------|---------|

## Unstaged fix verification
| # | Finding | Status | Fixed by |
|---|---------|--------|----------|

## Recommendation
<stage the fixes and commit / fix N remaining issues first — be explicit>
```

Explain each confirmed finding and its fix status in prose after the tables. Never stage, commit, or modify files yourself — this skill only reviews and reports.
