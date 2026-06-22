#!/usr/bin/env sh
# Repo ichidagi barcha skill'larni ~/.claude/skills/ ga o'rnatadi.
# Har bir skill = SKILL.md fayli bo'lgan papka.
set -eu

SRC_DIR="$(cd "$(dirname "$0")/skills" && pwd)"
DEST_DIR="${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}"

mkdir -p "$DEST_DIR"

count=0
for skill in "$SRC_DIR"/*/; do
  [ -f "${skill}SKILL.md" ] || continue
  name="$(basename "$skill")"
  rm -rf "$DEST_DIR/$name"
  cp -R "$skill" "$DEST_DIR/$name"
  echo "  installed: $name"
  count=$((count + 1))
done

echo "Done. $count skill(s) -> $DEST_DIR"
