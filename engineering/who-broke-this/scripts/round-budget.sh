#!/usr/bin/env bash
# Enforces the review-round budget for one who-broke-this run, so the
# review → fix → re-review loop can't spin forever.
#
# Usage:
#   round-budget.sh start [max]   Reset the counter (default max: 3)
#   round-budget.sh next          Consume a round; exits 1 when budget is spent
#   round-budget.sh status        Print "round N of M"
set -euo pipefail

STATE="${TMPDIR:-/tmp}/who-broke-this-rounds"

case "${1:-}" in
  start)
    max="${2:-3}"
    echo "0 $max" > "$STATE"
    echo "budget set: $max rounds"
    ;;
  next)
    [ -f "$STATE" ] || { echo "no budget started — run: round-budget.sh start" >&2; exit 2; }
    read -r round max < "$STATE"
    round=$((round + 1))
    if [ "$round" -gt "$max" ]; then
      echo "budget exhausted ($max rounds used) — stop looping and report"
      exit 1
    fi
    echo "$round $max" > "$STATE"
    echo "round $round of $max"
    ;;
  status)
    [ -f "$STATE" ] || { echo "no budget started"; exit 2; }
    read -r round max < "$STATE"
    echo "round $round of $max"
    ;;
  *)
    echo "usage: round-budget.sh start [max] | next | status" >&2
    exit 2
    ;;
esac
