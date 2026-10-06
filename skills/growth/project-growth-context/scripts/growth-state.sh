#!/usr/bin/env bash
set -euo pipefail

# Resolve a stable project id and the directory holding that project's growth state.
# Prints key=value lines and creates nothing.
#
#   growth-state.sh              project = the repository (or directory) you are in
#   growth-state.sh "<name>"     project named by the owner (another product, a monorepo app)
#
# State lives in <repo>/.growth when the owner created that directory on purpose,
# otherwise in $GROWTH_OS_HOME/<project-id> (default: ~/.qblab/growth/<project-id>).

usage() {
  echo "usage: growth-state.sh [PROJECT_NAME]" >&2
}

fail() {
  echo "growth-state: $*" >&2
  exit 1
}

slugify() {
  printf '%s' "$1" | tr '[:upper:]' '[:lower:]' | sed -E 's/[^a-z0-9]+/-/g; s/^-+//; s/-+$//'
}

[[ $# -le 1 ]] || { usage; exit 2; }
case "${1:-}" in
  -h|--help) usage; exit 0 ;;
esac

base="${GROWTH_OS_HOME:-$HOME/.qblab/growth}"
root="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"

# Id of the project in the current directory: owner-repo from the origin remote
# (https://host/owner/repo.git or git@host:owner/repo.git), else the directory name.
remote="$(git -C "$root" remote get-url origin 2>/dev/null || true)"
if [[ -n "$remote" ]]; then
  here_raw="$(printf '%s' "$remote" | sed -E 's#/+$##; s#\.git$##; s#^.*[:/]([^/:]+/[^/]+)$#\1#')"
  here_source="git remote"
else
  here_raw="$(basename "$root")"
  here_source="directory name"
fi
here_id="$(slugify "$here_raw")"

if [[ $# -eq 1 && -n "$1" ]]; then
  project_id="$(slugify "$1")"
  id_source="argument"
else
  project_id="$here_id"
  id_source="$here_source"
fi
[[ -n "$project_id" ]] || fail "could not derive a project id; pass a name"

# A .growth directory in the repository is an explicit opt-in to project-local state.
# It only applies to the project that repository is.
if [[ -d "$root/.growth" && "$project_id" == "$here_id" ]]; then
  state_dir="$root/.growth"
  scope="project"
else
  state_dir="$base/$project_id"
  scope="user"
fi

context="missing"
[[ -f "$state_dir/context.md" ]] && context="present"

overlay="$base/$project_id/context.local.md"
overlay_state="missing"
[[ -f "$overlay" ]] && overlay_state="present"

known=""
if [[ -d "$base" ]]; then
  for dir in "$base"/*/; do
    [[ -d "$dir" ]] || continue
    known="${known:+$known,}$(basename "$dir")"
  done
fi

printf 'project_id=%s\n' "$project_id"
printf 'id_source=%s\n' "$id_source"
printf 'state_dir=%s\n' "$state_dir"
printf 'scope=%s\n' "$scope"
printf 'context=%s\n' "$context"
printf 'private_overlay=%s\n' "$overlay"
printf 'private_overlay_state=%s\n' "$overlay_state"
printf 'known_projects=%s\n' "$known"
