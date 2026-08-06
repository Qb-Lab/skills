---
name: who-broke-this
description: Reviews staged changes with Codex, then verifies the unstaged fixes. Use when the user has staged work in git and wants an independent second-model review before committing.
---

# Who Broke This

Run an independent review of the **staged** changes using the Codex CLI, then check whether the **unstaged** changes actually fix what the review found. Loop until the review comes back clean or the round budget runs out.

Bundled resources (paths relative to this skill's folder):

- `agents/openai.yaml` — the Codex reviewer profile (model, effort, prompt/schema paths, `max_rounds`)
- `references/review-prompt.md` — the review prompt handed to Codex
- `references/stack-bug-classes.md` — house-stack breakage patterns; append to the prompt when the repo matches
- `references/findings.schema.json` — the JSON shape Codex must return findings in
- `scripts/round-budget.sh` — enforces the review-round budget

## Preconditions

1. Confirm this is a git repo and there are staged changes: `git status --short`.
   - No staged changes → tell the user and stop.
2. Confirm the `codex` CLI is available: `command -v codex`.
   - Not installed → tell the user how to install it (`npm install -g @openai/codex`) and offer to run the review yourself as a fallback instead.

## Step 0 — Start the round budget

Read `max_rounds` from `agents/openai.yaml`, then:

```bash
bash scripts/round-budget.sh start <max_rounds>
```

## Step 1 — Review staged changes with Codex

First check the stack: if the repo is an Nx monorepo with Prisma (`nx.json` + `prisma/` or `prisma.config.ts`) or an Expo app (`app.config.ts` + `expo` dependency), include `references/stack-bug-classes.md` in the prompt; otherwise omit it.

Capture the staged diff and hand it to Codex, using the bundled prompt and schema:

```bash
git diff --staged > "${TMPDIR:-/tmp}/staged.diff"
codex exec "$(cat references/review-prompt.md)

$(cat references/stack-bug-classes.md)   # only when the stack matches

Schema for your JSON output:
$(cat references/findings.schema.json)

$(cat "${TMPDIR:-/tmp}/staged.diff")"
```

Use the model and reasoning effort from `agents/openai.yaml` if the installed `codex` version supports selecting them. If the diff is large, review it in chunks per file rather than truncating silently.

Parse Codex's output as JSON matching `findings.schema.json`. If it isn't valid JSON, extract the findings manually — never drop them.

## Step 2 — Triage the findings

For each Codex finding, verify it yourself against the actual code (Read the files — don't trust the diff context alone). Classify:

- **Confirmed** — real issue; restate the failure scenario in one sentence
- **Rejected** — false positive; say why in one sentence

## Step 3 — Verify the unstaged fixes

Look at what's unstaged: `git diff`.

For each **confirmed** finding, determine:

- **Fixed** — an unstaged change addresses it (name the file/lines)
- **Partially fixed** — unstaged change touches it but doesn't fully resolve it
- **Unfixed** — nothing unstaged addresses it

In an Nx repo, back the verdicts with the mechanical gate: `nx affected -t typecheck build` (the same check CI runs). A "fixed" that doesn't typecheck isn't fixed.

Also flag unstaged changes that address *nothing* from the review — the user should know what that code is for before it gets staged.

## Step 4 — Loop or stop

- No confirmed findings, or everything confirmed is **Fixed** → report and stop.
- Unfixed/partial findings remain and the user wants to fix and re-review → after they update the working tree, run `bash scripts/round-budget.sh next`. If it exits non-zero, the budget is spent: stop looping and report what's still open. Otherwise go back to Step 1.

## Output

```markdown
## Review of staged changes (round N of M)
| # | File | Finding | Severity | Verdict |
|---|------|---------|----------|---------|

## Unstaged fix verification
| # | Finding | Status | Fixed by |
|---|---------|--------|----------|

## Recommendation
<stage the fixes and commit / fix N remaining issues first — be explicit>
```

Explain each confirmed finding and its fix status in prose after the tables. Never stage, commit, or modify files yourself — this skill only reviews and reports.
