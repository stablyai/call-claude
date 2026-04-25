#!/usr/bin/env bash
# claude-skill: thin wrapper around `claude -p` for use by agents (Codex, Cursor, etc.)
#
# Usage:
#   claude-skill [--model <alias>] [--effort <level>] "<prompt>"
#   echo "<prompt>" | claude-skill [--model <alias>] [--effort <level>]
#
# Defaults:
#   --model opus
#
# Flags:
#   --model <alias>   opus | sonnet | haiku | <full-model-id>   (default: opus)
#   --effort <level>  low | medium | high | xhigh | max          (omitted by default)

set -euo pipefail

MODEL="opus"
EFFORT=""
PROMPT=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --model)
      MODEL="$2"; shift 2 ;;
    --effort)
      EFFORT="$2"; shift 2 ;;
    --help|-h)
      sed -n '2,14p' "$0" | sed 's/^# \{0,1\}//'; exit 0 ;;
    --)
      shift; PROMPT="$*"; break ;;
    *)
      PROMPT="$*"; break ;;
  esac
done

ARGS=(-p --model "$MODEL")
[[ -n "$EFFORT" ]] && ARGS+=(--effort "$EFFORT")

if [[ -n "$PROMPT" ]]; then
  exec claude "${ARGS[@]}" "$PROMPT"
elif [[ ! -t 0 ]]; then
  # stdin has a prompt piped in
  exec claude "${ARGS[@]}"
else
  echo "error: no prompt provided (pass as argument or via stdin)" >&2
  exit 2
fi
