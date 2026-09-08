---
name: cavecrew
description: "Guides when to delegate subagents with compressed output."
---

# Cavecrew

Subagent delegation guide with compressed output contracts. Same job as any subagent (investigate, edit, review); difference is the tool-result returns compressed, so main context shrinks per delegation.

Tool-agnostic. Works with any subagent system (VS Code Explore, Claude Code, Cursor, etc.). Instruct the subagent to follow the output contract for its role.

## When to Delegate vs Inline

| Task | Approach |
|---|---|
| "Where is X defined / what calls Y / list uses of Z" | Delegate as **investigator** |
| Surgical edit, ≤2 files, scope obvious | Delegate as **builder** |
| New feature / 3+ files / cross-cutting refactor | Main thread (too big for single delegation) |
| Review diff, branch, or file for bugs | Delegate as **reviewer** |
| One-line answer you already know | Main thread, no subagent |

Rule of thumb: **if you'd want the subagent's output in 1/3 the tokens, delegate with a compressed contract. If you'd want prose, delegate without one.**

## Why This Exists

Subagent tool results get injected into main context verbatim. A verbose investigation that returns 2k tokens of prose costs 2k tokens of main-context budget every time. The same finding in compressed format returns ~700 tokens. Across 20 delegations in one session that's the difference between context exhaustion and finishing the task.

## Output Contracts

What main thread can rely on per role. **Instruct the subagent to follow these formats.**

### Investigator (locate code)

```
<Header>:
- path:line — `symbol` — short note
totals: <counts>.
```

Or `No match.` Always file-path-first, line-number-attached, backticked symbols. Safe to grep with `path:\d+`.

### Builder (surgical edit)

```
<path:line-range> — <change ≤10 words>.
verified: <re-read OK | mismatch @ path:line>.
```

Or one of: `too-big.` / `needs-confirm.` / `ambiguous.` / `regressed.` (terminal first token).

### Reviewer (diff review)

```
path:line: <emoji> <severity>: <problem>. <fix>.
totals: N🔴 N🟡 N🔵 N❓
```

Or `No issues.` Findings sorted file → line ascending.

Severity: 🔴 critical, 🟡 warning, 🔵 suggestion, ❓ question.

## Chaining Patterns

**Locate → fix → verify** (most common):
1. Investigator returns site list.
2. Main thread picks 1-2 sites, hands paths to builder.
3. Reviewer audits the diff.

**Parallel scout** (when investigation is broad):
Spawn 2-3 investigator calls in one message (different angles: defs vs callers vs tests). Aggregate in main thread.

**Single-shot edit** (when site is already known):
Skip investigator. Hand exact path:line to builder directly.

## Adapting to Single-Subagent Systems

Some systems (like VS Code Copilot) only have one subagent type (`Explore`). In that case:
- Use `Explore` for investigator tasks — instruct it to follow the investigator output contract
- Main thread plays builder and reviewer roles directly
- Chaining still works: investigate via subagent → fix inline → review inline

## What NOT to Do

- Don't delegate as builder when you don't already know the file. Investigate first or main thread will eat tokens passing context.
- Don't chain investigator → builder for a 5-file refactor. Builder will return `too-big.` and you'll have wasted a turn.
- Don't ask reviewer for "general feedback" — it returns findings only, no architecture opinions. Use main thread for that.
- Don't expect prose. Cavecrew output is structured, sometimes terse to the point of cryptic. If a human will read it directly, paraphrase.

## Auto-Clarity

Subagents drop caveman → normal English for security warnings, irreversible-action confirmations, and any output where fragment ambiguity could be misread. Resume caveman after.
