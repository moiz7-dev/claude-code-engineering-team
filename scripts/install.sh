#!/usr/bin/env bash
# Manual installer for eng-team (skill + agents).
# Usage: scripts/install.sh [--force] [target-dir]
# Default target-dir: ~/.claude
set -euo pipefail

FORCE=0
TARGET=""
for arg in "$@"; do
  case "$arg" in
    --force|-f) FORCE=1 ;;
    -h|--help) echo "Usage: $0 [--force] [target-dir]"; exit 0 ;;
    *) TARGET="$arg" ;;
  esac
done
TARGET="${TARGET:-$HOME/.claude}"
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

SKILL_SRC="$ROOT/skills/eng-team"
SKILL_DST="$TARGET/skills/eng-team"
AGENTS_DST="$TARGET/agents"

[ -d "$SKILL_SRC" ] || { echo "Error: $SKILL_SRC not found" >&2; exit 1; }

# Pre-check: refuse before writing anything.
conflicts=()
[ -e "$SKILL_DST" ] && conflicts+=("$SKILL_DST")
for f in "$ROOT"/agents/*.md; do
  [ -e "$AGENTS_DST/$(basename "$f")" ] && conflicts+=("$AGENTS_DST/$(basename "$f")")
done
if [ "${#conflicts[@]}" -gt 0 ] && [ "$FORCE" -ne 1 ]; then
  echo "Refusing to overwrite existing files (use --force to overwrite):" >&2
  printf '  %s\n' "${conflicts[@]}" >&2
  exit 2
fi

mkdir -p "$SKILL_DST" "$AGENTS_DST"
cp -R "$SKILL_SRC/." "$SKILL_DST/"
echo "Installed skill:  $SKILL_DST"
for f in "$ROOT"/agents/*.md; do
  cp "$f" "$AGENTS_DST/"
  echo "Installed agent:  $AGENTS_DST/$(basename "$f")"
done
echo "Done. Restart Claude Code, then run: /eng-team <task>"
