---
name: claude
description: Run an arbitrary prompt through Claude CLI (`claude -p`) and return the results. Use when the user asks to delegate a task to claude, run something with `claude -p`, or invoke the /claude skill with a prompt.
---

# claude

Run an arbitrary prompt through the **Claude CLI** (`claude -p`) and return the results.

---

## Arguments

**Required**: The user must provide a prompt after `/claude`.

**Optional flags** (parsed from the user's message — NOT passed as CLI flags by the user):
- `--model <alias>` — override model (default: `opus`). Examples: `opus`, `sonnet`, `haiku`, or a full model ID.
- `--effort <level>` — reasoning effort. One of: `low`, `medium`, `high`, `xhigh`, `max`.

If the user does not specify these, use `--model opus` and omit `--effort`.

---

## Process

### 1. Parse the user's message

Extract:
- The prompt (everything that isn't a recognized flag)
- Optional `--model <value>`
- Optional `--effort <value>`

### 2. Run `claude -p`

Execute from the current working directory:

```bash
claude -p --model <MODEL> [--effort <EFFORT>] "<PROMPT>"
```

- Always pass `--model` (default `opus`).
- Only pass `--effort` if the user specified one.
- Quote the prompt properly. For multi-line prompts, pipe via stdin instead:
  ```bash
  echo "<PROMPT>" | claude -p --model <MODEL>
  ```

### 3. Present the results

Show the full output to the user. Do not summarize unless asked.

---

## Examples

### Default (opus, no effort override)
```
/claude explain what this repo does
```
→ `claude -p --model opus "explain what this repo does"`

### Override model
```
/claude --model sonnet summarize the README
```
→ `claude -p --model sonnet "summarize the README"`

### Override model and effort
```
/claude --model opus --effort high design a caching layer for this service
```
→ `claude -p --model opus --effort high "design a caching layer for this service"`
