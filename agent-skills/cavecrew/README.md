# cavecrew

Decision guide. When to delegate to subagents with compressed output.

## What it does

Tells the main thread when to delegate to a subagent versus doing work inline. The win: subagent tool-results inject back into main context verbatim, and compressed output is roughly 1/3 the size of vanilla prose. Across 20 delegations in one session, that is the difference between context exhaustion and finishing the task.

Tool-agnostic. Works with any subagent system (VS Code Explore, Claude Code, Cursor, etc.). Instruct the subagent to follow the output contract for its role.

Three roles (not named subagents — any subagent can play any role):

| Role | Job | Use when |
|------|-----|----------|
| **investigator** | Locate code (read-only) | "Where is X defined / what calls Y / list uses of Z" |
| **builder** | Surgical edit, 1-2 files | Scope is obvious, ≤2 files. Returns `too-big.` for 3+ file scope. |
| **reviewer** | Diff/file review | One-line findings with severity emoji |

Use vanilla `Explore` when you want prose, architecture commentary, or rationale. Use main thread directly for one-line answers and 3+ file refactors.

This skill is a decision guide, not a slash command. It activates when the conversation mentions delegation.

## How to invoke

Triggers on phrases like "delegate to subagent", "use cavecrew", "spawn investigator", "save context", "compressed agent output".

## Example chaining

Locate → fix → verify (most common):

1. **investigator** returns site list (`path:line — symbol — note`)
2. Main thread picks 1-2 sites, hands paths to **builder**
3. **reviewer** audits the resulting diff

Parallel scout: spawn 2-3 **investigator** calls in one message with different angles (defs, callers, tests). Aggregate in main.

## See also

- [`SKILL.md`](./SKILL.md) — full decision matrix and output contracts
