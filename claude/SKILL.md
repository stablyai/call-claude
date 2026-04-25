---
name: claude
description: Delegate a prompt to Claude via `claude -p`. For use by agents (Codex, Cursor, etc.) that want to hand off a task to Claude and get the result back. Default model is opus.
---

# claude

Delegate an arbitrary prompt to **Claude** via `claude -p` and return the output.

Useful when an agent (Codex, Cursor, another Claude session, etc.) wants a second opinion, a parallel implementation, or to offload a chunk of work to Claude.

---

## Usage

```bash
claude-skill [--model <alias>] [--effort <level>] "<prompt>"
```

Or pipe the prompt via stdin (preferred for multi-line):

```bash
echo "<prompt>" | claude-skill [--model <alias>] [--effort <level>]
```

### Flags

| Flag | Values | Default |
|------|--------|---------|
| `--model` | `opus`, `sonnet`, `haiku`, or a full model ID | `opus` |
| `--effort` | `low`, `medium`, `high`, `xhigh`, `max` | _(omitted)_ |

---

## Process (for the calling agent)

1. **Parse** the user's request — extract the prompt and any `--model` / `--effort` overrides.
2. **Invoke** `claude-skill` with those flags and the prompt.
3. **Return** Claude's full output to the user. Don't summarize unless asked.

`claude -p` is non-interactive and prints the final answer to stdout, so the wrapper output can be captured directly.

---

## Examples

Default (opus):
```bash
claude-skill "explain what this repo does"
```

Override model:
```bash
claude-skill --model sonnet "summarize the README"
```

Override model + effort:
```bash
claude-skill --model opus --effort high "design a caching layer for this service"
```

Multi-line prompt via stdin:
```bash
cat prompt.md | claude-skill --model opus
```
