---
name: caveman-help
description: "Quick-reference for caveman skills and commands."
---

# Caveman Help

Quick reference card. One-shot — do NOT change mode, write flag files, or persist anything.

## Compression Levels

6 levels: lite, full (default), ultra, wenyan-lite, wenyan-full, wenyan-ultra.

Full details in `AGENTS.md` → "Caveman Compression (Default Output Style)".

Activate: say "caveman", "caveman ultra", etc. Deactivate: "stop caveman".

## Skills

| Skill | Trigger | What it does |
|-------|---------|-------------|
| **caveman-commit** | `/caveman-commit` | Terse commit messages. Conventional Commits. ≤50 char subject. |
| **caveman-review** | `/caveman-review` | Code review. One finding per line: `path:line: 🔴 severity: problem. fix.` |
| **caveman-stats** | `/caveman-stats` | Token usage estimate + context budget recommendation. |
| **cavecrew** | `/cavecrew` | Subagent delegation guide with compressed output contracts. |
| **caveman-help** | `/caveman-help` | This card. |

## Rules (in AGENTS.md)

- Language preservation: keep user's language. Compress style, not language.
- Auto-clarity: drop caveman for security warnings + irreversible actions.
- Default mode: full.

See `AGENTS.md` → "Caveman Compression (Default Output Style)" for full rules.
