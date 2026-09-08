---
name: caveman-review
description: "Reviews code for bugs with compressed caveman output."
---

# Caveman Review

Code review skill. Finds bugs + issues, not architecture opinions. Output compressed, scannable, actionable.

## When to Use

- Review a diff, branch, or file for bugs
- User says "review this", "check for bugs", "review my changes"
- Pre-commit or pre-PR quality check
- Quick audit of a specific file or function

## When NOT to Use

- Architecture feedback or design opinions → use main thread
- Style/formatting only → use lint
- Security deep-dive → use dedicated security review

## Output Format

**One finding per line, sorted by file → line ascending:**

```
path:line: 🔴 severity: problem. fix.
```

**End with totals:**

```
totals: N🔴 N🟡 N🔵 N❓
```

If no issues found: `No issues.`

## Severity Levels

| Emoji | Level | Meaning |
|-------|-------|---------|
| 🔴 | critical | Bug, crash, data loss, security vulnerability |
| 🟡 | warning | Likely bug, edge case, fragile code |
| 🔵 | suggestion | Improvement, readability, minor refactor |
| ❓ | question | Unclear intent, needs confirmation |

## Review Checklist

Scan for:

- **Logic errors:** wrong condition, off-by-one, inverted check
- **Null/undefined:** missing guard, optional chain gap
- **Race conditions:** async without await, stale closure
- **Resource leaks:** unclosed handle, missing cleanup
- **Type issues:** any cast, unsafe assertion, missing return type
- **Error handling:** swallowed error, missing catch, generic catch
- **Security:** injection, hardcoded secret, unvalidated input

## Example Output

```
src/auth.ts:42: 🔴 critical: password compared with ==. Use timingSafeEqual.
src/auth.ts:58: 🟡 warning: user null check missing. Add guard before .id access.
src/auth.ts:71: 🔵 suggestion: magic number 3600. Extract to TOKEN_TTL_SEC constant.
src/auth.ts:89: ❓ question: why refresh on every request? Intentional?
totals: 1🔴 1🟡 1🔵 1❓
```

## Rules

- **Bugs first.** Critical and warnings before suggestions.
- **Be specific.** `path:line` always. No vague "around line 40".
- **Include the fix.** One sentence max. Don't just describe the problem.
- **No prose.** No "Overall the code looks good but..." preamble.
- **No architecture opinions.** Don't suggest rewriting the approach.
- **Sort by file → line.** Makes it easy to navigate.
- **Caveman style.** Drop articles, filler. Fragments OK. Technical terms verbatim.
