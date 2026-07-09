---
name: review-bugbot
description: >
  Runs structured code reviews using Bugbot subagent. Catches bugs, regressions, performance issues, and style violations. Use when reviewing PRs, commits, or completed implementations before merging. Trigger: PR review, merge gate, "review this", "code review".
---

# Bugbot — Code Review Skill

Run structured code reviews. Catches bugs, regressions, performance issues, and style violations before they ship.

## When to Use

- Before merging a PR
- After completing a feature or refactor
- When the user says "review this" or "bugbot"
- As a pre-merge gate in CI

## What to Check

| Category | Questions |
|---|---|
| **Correctness** | Does the code actually work? Are there off-by-one errors, null checks, edge cases? |
| **Regressions** | Did this break something that was working? Compare against baseline. |
| **Performance** | Any O(n²) loops, N+1 queries, unnecessary re-renders, memory leaks? |
| **Security** | Input validation? XSS/SQL injection? Hardcoded secrets? |
| **Style** | Consistent naming? Proper types (no `any`)? No semicolons? |
| **Tests** | Are there tests? Do they cover edge cases? |

## How to Run

```
Task({
  subagent_type: "generalPurpose",
  description: "Code review",
  prompt: "Review the following changes: [diff or file list]. Check for: correctness, regressions, performance, security, style. Report issues by severity: P0 (block), P1 (should fix), P2 (nice to have).",
  run_in_background: true
})
```

## Output Format

```markdown
**Review Summary:** [1-2 sentence overview]

**P0 — Block Merge:**
- [Issue] — [Location] — [Fix suggestion]

**P1 — Should Fix:**
- [Issue] — [Location] — [Fix suggestion]

**P2 — Nice to Have:**
- [Issue] — [Location] — [Suggestion]

**Overall:** [approved / needs fixes / needs re-review]
```

## Guardrails

- Report by severity, not alphabetically. P0 issues first.
- Provide specific fix suggestions, not vague complaints.
- If no issues found, say so explicitly. Don't pad with P2s.
- Don't review the same change twice in the same session unless the code has materially changed.

---

*This skill captures the review methodology. The Bugbot subagent is the worker — the skill is the knowledge.*