---
name: call-claude
description: Delegate a prompt to Claude via `claude -p`. Use when the user wants to offload a task to Claude from another agent (Codex, Cursor, another Claude session), get a second opinion, or run a parallel implementation. Default model is opus.
license: MIT
metadata:
  author: stablyai
  version: "0.1.0"
---

# call-claude

Delegate an arbitrary prompt to **Claude** and return the output.

## Arguments

**Required**: a prompt.

**Optional flags** (parsed from the user's message):

| Flag | Values | Default |
|------|--------|---------|
| `--model` | `opus`, `sonnet`, `haiku`, or a full model ID | `opus` |
| `--effort` | `low`, `medium`, `high`, `xhigh`, `max` | _(omitted)_ |

## Process

1. **Parse** the user's message — extract the prompt and any `--model` / `--effort` overrides.
2. **Invoke** the wrapper script that ships alongside this SKILL.md:
   ```bash
   "$(dirname "$0")/call-claude.sh" [--model <alias>] [--effort <level>] "<prompt>"
   ```
   For multi-line prompts, pipe via stdin:
   ```bash
   echo "<prompt>" | "$(dirname "$0")/call-claude.sh" --model opus
   ```
3. **Return** Claude's full output to the user. Don't summarize unless asked.

`claude -p` is non-interactive and prints the final answer to stdout, so the wrapper output can be captured directly.

## Prerequisite

[Claude Code](https://claude.com/claude-code) must be installed — verify with `claude --version`.

## Examples

```bash
# Default (opus)
./call-claude.sh "explain what this repo does"

# Override model
./call-claude.sh --model sonnet "summarize the README"

# Override model + effort
./call-claude.sh --model opus --effort high "design a caching layer"
```
