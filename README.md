# call-claude

Tiny wrapper that lets any agent (Codex, Cursor, another Claude session) delegate a prompt to **Claude** via `claude -p`. Default model: `opus`.

## Install & use in one command

```bash
npx github:stablyai/call-claude "explain what this repo does"
```

That's it. No clone, no PATH, no chmod.

### With flags

```bash
npx github:stablyai/call-claude --model sonnet "summarize the README"
npx github:stablyai/call-claude --model opus --effort high "design a caching layer"
```

### Multi-line prompt via stdin

```bash
cat prompt.md | npx github:stablyai/call-claude
```

## Flags

| Flag | Values | Default |
|------|--------|---------|
| `--model` | `opus`, `sonnet`, `haiku`, or a full model ID | `opus` |
| `--effort` | `low`, `medium`, `high`, `xhigh`, `max` | _(omitted)_ |

## Prerequisite

[Claude Code](https://claude.com/claude-code) must be installed — verify with `claude --version`.

## Using from an agent

Point the agent at [`SKILL.md`](./SKILL.md) and it'll know how to call `npx github:stablyai/call-claude ...`.

---

## Prefer a local alias?

If you're going to use it a lot, skip `npx` and just:

```bash
npm i -g github:stablyai/call-claude
call-claude "your prompt"
```
