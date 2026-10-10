#!/bin/bash
# Regenerate AVP/patches from local commits made on top of the pinned upstream revisions.
# usage: AVP/script/export-patches.sh [TOP_DIR]
set -euo pipefail
AVP_DIR="$(cd "$(dirname "$0")/.." && pwd)"
TOP="${1:-$(dirname "$AVP_DIR")}"
declare -A DIRS=( [aos-Video]=Video [aos-MediaLib]=MediaLib [aos-FileCoreLibrary]=FileCoreLibrary )
for project in "${!DIRS[@]}"; do
  base=$(python3 - "$AVP_DIR/default.xml" "${DIRS[$project]}" <<'PY'
import sys, xml.etree.ElementTree as ET
for p in ET.parse(sys.argv[1]).getroot().findall("project"):
    if p.get("path") == sys.argv[2]: print(p.get("revision"))
PY
)
  rm -rf "$AVP_DIR/patches/$project"
  git -C "$TOP/${DIRS[$project]}" format-patch -q --no-signature --zero-commit -N \
      -o "$AVP_DIR/patches/$project" "$base..HEAD"
  echo "== $project: $(ls "$AVP_DIR/patches/$project" | wc -l) patches since $base"
done
