#!/usr/bin/env bash
# Extrai o bundle textual `compass_artifact*.md` em árvore de arquivos.
# Uso: scripts/unpack.sh <bundle.md>
set -euo pipefail
BUNDLE="${1:-compass_artifact_wf-41e76427-41a5-4694-bc50-06d6da772fd8_text_markdown.md}"
[ -f "$BUNDLE" ] || { echo "bundle não encontrado: $BUNDLE" >&2; exit 1; }

awk '
/^===== FILE: / {
  in_file = 1
  path = $0
  sub(/^===== FILE: /, "", path)
  sub(/ =====$/, "", path)
  gsub(/^[ \t]+|[ \t]+$/, "", path)
  dir = path
  if (sub(/\/[^/]*$/, "", dir) && dir != path) system("mkdir -p \"" dir "\"")
  printf "" > path
  next
}
/^===== END FILE =====/ { in_file = 0; close(path); next }
in_file { print >> path }
' "$BUNDLE"

echo "extração concluída."
