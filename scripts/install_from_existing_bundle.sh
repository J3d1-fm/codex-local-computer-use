#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
target="$repo_root/plugins/computer-use-local-wrapper/Codex Computer Use.app"

sources=(
  "$HOME/.codex/plugins/cache/openai-bundled/computer-use/1.0.758/Codex Computer Use.app"
  "$HOME/.codex/plugins/cache/local-computer-use/computer-use/1.0.758/Codex Computer Use.app"
  "$HOME/.codex/plugins/cache/local/computer-use/1.0.758/Codex Computer Use.app"
  "$HOME/.codex/local-marketplaces/local-computer-use/plugins/computer-use/Codex Computer Use.app"
)

for source in "${sources[@]}"; do
  if [[ -d "$source" ]]; then
    rm -rf "$target"
    mkdir -p "$(dirname "$target")"
    cp -R "$source" "$target"
    printf 'Installed local app bundle at %s\n' "$target"
    printf 'Do not commit this .app directory; it is ignored by git.\n'
    exit 0
  fi
done

printf 'Could not find a local Codex Computer Use.app bundle.\n' >&2
printf 'Install Computer Use in Codex first, then rerun this script.\n' >&2
exit 1
