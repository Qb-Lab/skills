# Scheduler handoff

How a routine entry becomes something that actually runs. Work down the options and stop at
the first that fits. Never install, enable or register a schedule without the owner's
explicit yes in this session: a scheduler is a change to their machine or account.

After any option succeeds, update the entry in `<state>/routine.yaml`: `status: scheduled`,
`scheduler: <what runs it and where>`, `configured_on: <date>`. If nothing was configured,
the entry stays `recommended` or becomes `requires-scheduler`, and the final message says
so in those words.

## 1. The host has its own scheduler

If this host exposes a scheduling or automation capability (scheduled tasks, recurring
agents, routines), use it: one scheduled run per entry, with the entry's `prompt`, the
project path and the time zone. Read the result back, confirm the schedule exists, and
record its identifier in `scheduler`.

## 2. cron (or the operating system's task scheduler) plus a non-interactive agent CLI

Works when an agent CLI that can run a prompt without a terminal session is installed on a
machine that is on at the scheduled time.

1. Find the CLI: check which agent command-line tools are installed (`command -v <name>`
   for the ones the owner uses, for example `claude`, `codex`, `cursor-agent`, `opencode`)
   and read its `--help` for the non-interactive form. Do not guess flags. Typical shapes
   are `<cli> -p "<prompt>"` or `<cli> exec "<prompt>"`.
2. Confirm it can load the skills from the project directory (run the entry's prompt once
   by hand, non-interactively, and check a file appears under `<state>`).
3. Offer the crontab lines; add them only on a yes. One line per entry:

   ```
   # growth-os: <project-id> <entry id>
   <cron expr> cd "<project_path>" && <cli non-interactive form> "<prompt>" >> "<state>/routine.log" 2>&1
   ```

4. Verify with `crontab -l` and record `scheduler: cron on <machine name>`.

Things to tell the owner: cron uses the machine's local time; the machine must be awake;
unattended runs have no one to approve tool permissions, so the CLI's permission settings
must already allow the research and file writes the entry needs, and nothing more; runs
cost model usage every time they fire.

"First Monday of the month": standard cron treats a restricted day-of-month and day-of-week
as OR. Use `0 10 * * 1` with a guard at the start of the command
(`[ "$(date +\%d)" -le 7 ] && …`), or the scheduler's own "first Monday" option.

On macOS a `launchd` agent, and on Windows Task Scheduler, do the same job; generate the
equivalent definition only if the owner asks for that scheduler.

## 3. A CI workflow (for example GitHub Actions)

Only when growth state is project-scoped (`.growth/` exists) and the repository is private:
CI has no access to `~/.qblab/`, and anything it writes must be committed or uploaded.

Skeleton, to adapt rather than paste:

```yaml
name: growth-routine
on:
  schedule:
    - cron: "0 5 * * 1"        # CI schedules are in UTC; convert from the routine's time zone
  workflow_dispatch: {}
jobs:
  weekly-plan:
    runs-on: ubuntu-latest
    permissions:
      contents: write
    steps:
      - uses: actions/checkout@v4
      - name: Install skills and the agent CLI
        run: |
          npx skills add qb-lab/skills --all -y
          # install the agent CLI the owner uses
      - name: Run the routine entry
        env:
          AGENT_API_KEY: ${{ secrets.AGENT_API_KEY }}   # the owner's provider key, as a secret
        run: <cli non-interactive form> "Use growth-os weekly"
      - name: Commit the updated growth state
        run: |
          git config user.name "growth-routine"
          git config user.email "growth-routine@users.noreply.github.com"
          git add .growth && git commit -m "growth: weekly plan" || echo "nothing to commit"
          git push
```

Say plainly what this implies: marketing plans live in the repository's history, the API
key is a repository secret, and private facts in the user-level overlay are not available
to CI (those runs will show `INPUT_NEEDED` where the overlay would have answered).

## 4. An external automation tool

Workflow tools and agent platforms that can run a prompt on a timer take the same three
things: the entry's `prompt`, the project (repository URL or path), and the cadence. Give
the owner those per entry, plus where the output should be delivered (a file under
`<state>`, an email to themselves, a message). Status is `requires-scheduler` until they
confirm it is connected.

## 5. No automation: calendar reminders

The honest fallback and often the right one for a solo founder. Offer one recurring
calendar event per entry with the prompt in the description. The owner runs it by hand.
Status stays `recommended`; write `scheduler: owner's calendar reminder` only if they say
they created it.
