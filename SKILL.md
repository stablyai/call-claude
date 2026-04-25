---
name: call-claude
description: Delegate a prompt to Claude via `claude -p`. Use when the user wants to offload a task to Claude from another agent (Codex, Cursor, etc.), get a second opinion, or run a parallel implementation. Default model is opus.
---

# call-claude

Delegate an arbitrary prompt to **Claude** and return the output.

## Invocation

No install needed — run directly with npx:

```bash
npx github:stablyai/call-claude [--model <alias>] [--effort <level>] "<prompt>"
```

Or pipe the prompt via stdin (preferred for multi-line):

```bash
echo "<prompt>" | npx github:stablyai/call-claude [--model <alias>] [--effort <level>]
```

## Flags

| Flag | Values | Default |
|------|--------|---------|
| `--model` | `opus`, `sonnet`, `haiku`, or a full model ID | `opus` |
| `--effort` | `low`, `medium`, `high`, `xhigh`, `max` | _(omitted)_ |

## Process (for the calling agent)

1. **Parse** the user's request — extract the prompt and any `--model` / `--effort` overrides.
2. **Invoke** `npx github:stablyai/call-claude` with those flags and the prompt.
3. **Return** Claude's full output to the user. Don't summarize unless asked.

`claude -p` is non-interactive and prints the final answer to stdout, so the wrapper output can be captured directly.

## Examples

```bash
# Default (opus)
npx github:stablyai/call-claude "explain what this repo does"

# Override model
npx github:stablyai/call-claude --model sonnet "summarize the README"

# Override model + effort
npx github:stablyai/call-claude --model opus --effort high "design a caching layer"

# Multi-line via stdin
cat prompt.md | npx github:stablyai/call-claude
```
