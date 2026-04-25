# call-claude

An agent skill that delegates a prompt to **Claude** via `claude -p`. Works with Claude Code, Codex, Cursor, and every other agent supported by [skills.sh](https://skills.sh).

## Install

```bash
npx skills add stablyai/call-claude
```

That's it. The [skills CLI](https://github.com/vercel-labs/skills) handles picking an agent (Claude Code, Codex, Cursor, etc.) and dropping the skill into the right place.

### Target a specific agent

```bash
npx skills add stablyai/call-claude -a claude-code
npx skills add stablyai/call-claude -a codex
npx skills add stablyai/call-claude -a cursor
```

### Install globally (available across all projects)

```bash
npx skills add stablyai/call-claude -g
```

## Use

Once installed, invoke the skill from inside your agent (e.g. in Claude Code):

```
/call-claude explain what this repo does
```

With flags:

```
/call-claude --model sonnet summarize the README
/call-claude --model opus --effort high design a caching layer
```

## Flags

| Flag | Values | Default |
|------|--------|---------|
| `--model` | `opus`, `sonnet`, `haiku`, or a full model ID | `opus` |
| `--effort` | `low`, `medium`, `high`, `xhigh`, `max` | _(omitted)_ |

## Prerequisite

[Claude Code](https://claude.com/claude-code) must be installed — verify with `claude --version`.

## Repo layout

```
skills/
  call-claude/
    SKILL.md         # tells the agent how/when to invoke this skill
    call-claude.sh   # the wrapper the skill calls out to
```
