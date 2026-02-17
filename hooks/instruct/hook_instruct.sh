#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
INSTR_FILE="${CODEX_HOOK_INSTRUCT_FILE:-$SCRIPT_DIR/hook_instruct.md}"

if [[ ! -f "$INSTR_FILE" ]]; then
  echo "[hook_instruct] instructions file not found: $INSTR_FILE" >&2
  exit 1
fi

if [[ ! -s "$INSTR_FILE" ]]; then
  echo "[hook_instruct] instructions file is empty: $INSTR_FILE" >&2
  exit 1
fi

cat "$INSTR_FILE"
