#!/bin/bash
# Apply AVP/patches/<project>/*.patch on top of the upstream checkouts.
# usage: AVP/script/apply-patches.sh [TOP_DIR]   (TOP_DIR defaults to the repo top, parent of AVP)
set -euo pipefail
AVP_DIR="$(cd "$(dirname "$0")/.." && pwd)"
TOP="${1:-$(dirname "$AVP_DIR")}"
declare -A DIRS=( [aos-Video]=Video [aos-MediaLib]=MediaLib [aos-FileCoreLibrary]=FileCoreLibrary )
for project in "${!DIRS[@]}"; do
  patches=("$AVP_DIR/patches/$project"/*.patch)
  [ -e "${patches[0]}" ] || continue
  dir="$TOP/${DIRS[$project]}"
  echo "== $project -> $dir (${#patches[@]} patches)"
  git -C "$dir" -c user.name=build -c user.email=build@localhost am -q --3way --keep-cr "${patches[@]}"
done
