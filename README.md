# stablyai/skills

Shared skills for generic coding agents (Codex, Cursor, another Claude session, etc.).

Each skill is a self-contained directory with a `SKILL.md` that tells the agent how/when to use it, plus any helper scripts.

## Skills

- [`claude`](./claude/SKILL.md) — Delegate a prompt to Claude via `claude -p` (default model: opus).

---

## Install

Clone the repo somewhere stable:

```bash
git clone https://github.com/stablyai/skills.git ~/stablyai-skills
```

Then make each skill's helper scripts executable and on your `PATH`:

```bash
chmod +x ~/stablyai-skills/*/*.sh
# add to ~/.bashrc or ~/.zshrc:
export PATH="$HOME/stablyai-skills/claude:$PATH"
```

Now `claude-skill` resolves from any directory.

### Prerequisites

- The underlying CLI the skill wraps must already be installed. For `claude` that means [Claude Code](https://claude.com/claude-code) — verify with `claude --version`.

---

## Using skills from an agent

### Codex CLI

Point Codex at the skill by referencing `SKILL.md` in your prompt, or add the skill dir to Codex's context. Example:

```bash
codex exec "Read ~/stablyai-skills/claude/SKILL.md and use claude-skill to delegate the following task to Claude: <task>"
```

### Cursor / other agents

Paste the contents of `SKILL.md` into the agent's system prompt or rules file, or reference it by path. The agent then invokes the wrapper script directly.

### Claude Code

If you want to use this as a Claude Code skill too:

```bash
cp -r ~/stablyai-skills/claude ~/.claude/skills/
```

Invoke with `/claude <prompt>`.

---

## Adding a new skill

1. Create a directory: `mkdir my-skill`
2. Add `SKILL.md` with frontmatter:
   ```yaml
   ---
   name: my-skill
   description: <one-line hook — when an agent should use this>
   ---
   ```
3. Document usage and include any helper scripts (keep them executable, POSIX-ish, no hard deps).
4. Link it from this README.
