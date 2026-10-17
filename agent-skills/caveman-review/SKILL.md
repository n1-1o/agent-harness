---
name: caveman-review
description: "Deprecated. Code review moved to /swe."
version: 2.0.0
---

# Caveman Review — Deprecated

**This skill is deprecated.** The manual in-context code review pass is now `swe`, which does code review first — same severity output (`path:line: 🔴 severity: problem. fix.` + `totals:`), plus a staged cleanup plan.

Use instead:

- **`/swe`** — Code review + cleanup (bug review, dead code, simplification, maintainability).
- **`/review-bugbot`** — Delegated review with the Bugbot subagent (real diff, structured table).
- **`/review-security`** — Security deep-dive with the Security Review subagent.

Keep this file as a routing stub so `/caveman-review` never falls silent. Do not extend it.
