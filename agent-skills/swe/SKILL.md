---
name: swe
description: "Reviews code for correctness, structure, and cleanup."
version: 0.3.0
author: Nguyen Tran-Ngo
metadata:
  hermes:
    tags: [Code Review, Maintainability, Dead Code, Refactor, Audit]
---

# Software Engineer Review

Code review first, cleanup second. Performs a senior-SWE review of code changes or the active repo across three lenses: correctness (bugs, readability, duplicate logic), structure (maintainability, abstraction quality, spaghetti growth), and dead/legacy code. Phase 1 is a structured review with severity-tagged findings. Phase 2 is a maintenance pass that recommends cleanup — never destructive, always branch-backed with git as the undo net. Fits both app-code repos and markdown knowledge-base layouts.

Does NOT perform security deep-dives (use `review-security`), does NOT run delegated bugbot review from a CLI hook (use `review-bugbot` for the subagent flow), does not lint style or formatting (use linter). Provides structure findings (concrete, not taste-based); the main thread owns final architecture decisions. Supersedes the manual `caveman-review` pass — same findings, staged severity, plus a cleanup plan.

## When to Use

- "Review this code / diff / changes"
- "Check for bugs or issues in this PR"
- "Is this change making the codebase worse?" / "harsh maintainability review"
- "Find unused code, files, components, routes, or APIs"
- "Clean up duplicate logic or remove technical debt"
- "Simplify or maintain this codebase"

## Prerequisites

- Repo read access; write + `git` only for Phase 2 mutations (on a dedicated branch)
- `gh` for orphan-branch detection vs merged base (optional)
- `burp` / runtime logs for redundant-call checks (optional, app-code only)

## How to Run

**Phase 1 — review, fast static scan**

```
search_files  "TODO|FIXME|HACK|XXX|@ts-ignore|eslint-disable"
search_files  "import .* from|require\(|export (default )?[A-Za-z0-9_]+"
git diff --stat (main) HEAD        # scope: what changed
```

**Phase 2 — maintenance, per-candidate mutation**

```
git checkout -b bystander/cleanup/<candidate-name>
git rm <file>
```

## Quick Reference

| Check | Phase | Lens | Fix path |
|---|---|---|---|
| Correctness / bugs | 1 | correctness | `patch`, verify |
| Duplicate logic | 1 | correctness | Merge into one |
| Readability / cognitive load | 1 | correctness | Simplify, verify |
| Structure / abstraction quality | 1 | structure | Restructure |
| Spaghetti growth / special-case branches | 1 | structure | Push behind abstraction |
| File pushed past 1000 lines | 1 | structure | Decompose first |
| Thin wrappers / identity helpers | 1 | structure | Delete the wrapper |
| Unexplained casts / `any` / `unknown` | 1 | structure | Make the boundary explicit |
| Logic in wrong layer / boundary leak | 1 | structure | Move to canonical owner |
| Dead / orphaned code | 1→2 | cleanup | Phase 2 `git rm` |
| Unused imports / vars | 1→2 | cleanup | `patch` (small) |
| Unused UI components | 1→2 | cleanup | Phase 2 archive |
| Redundant DB / API calls | 1 (opt-in) | cleanup | App-code path |
| Legacy / abandoned sets | 2 | cleanup | `git rm` from archive |

## Procedure

### Phase 1 — Review

1. **Scope.** Determine what is being reviewed: uncommitted changes, a branch diff vs `main`, or the whole repo. For a diff, review only changed lines first, then their touchpoints.
2. **Static scan.** Run the Phase 1 commands to surface markers and import/dead-code signs. Read the changed or candidate files, plus the code the change touches (not just the diff).
3. **Correctness lens.** Bugs, duplicate logic, readability, redundant queries.
4. **Structure lens.** Ask, per meaningful change:
   - Does this improve or worsen the local architecture?
   - Is there a "code judo" move that deletes a whole layer instead of rearranging it?
   - Did it add ad-hoc branches into an already-busy flow?
   - Did it push a file past 1000 lines? If so, decompose first.
   - Is this abstraction earning its keep, or a pass-through wrapper?
   - Does it rely on unexplained casts, optionality, or `any`/`unknown`?
   - Is the logic in the canonical layer, or did it leak across a boundary?
5. **Triage each finding.** For every issue record: severity (🔴 critical / 🟡 warning / 🔵 suggestion / ❓ question), file:line, and the finding in four parts:
   - **what it does** → **what goes wrong** → **how to fix** → **what happens if skipped**
6. **Fix + verify loop (bugs only).** Apply fixes with `patch`. After fixing, re-run the affected code/tests. **Gate: no new issues introduced by the fix.**
7. **Report Phase 1.** Flat list, one finding per line, sorted file → line ascending, severity-tagged, in the four-part format. End with totals: `totals: N🔴 N🟡 N🔵 N❓`.

### Phase 2 — Maintenance / Cleanup (only if asked or obvious)

8. **Inventory.** `git ls-files`, `git branch --no-merged main`, `git log --after=6-months-ago` for recency.
9. **Identify dead / orphaned content.** Build the reference graph — for markdown knowledge repos, match each file's mentions against `references/`, `session-notes.md`, `personal/README.md`, `knowledge/` cross-paths. Zero-reference files = removal candidates.
10. **For each candidate:** why it is unnecessary, estimated impact of removal, deletion risks, and a concrete cleanup plan (`git rm` + archive preferred over hard delete).
11. **Mutate on a branch only.** `git checkout -b bystander/cleanup/<candidate-name>`, then `git rm`. Never force-`rm`; git history is the undo net.
12. **Report Phase 2.** Sorted by removal value; end with totals.

## Pitfalls

- **Structure findings must stay concrete.** "This branch makes the flow harder to reason about; push it behind a policy object" is a finding. "I would have designed this differently" is not. Name the change, not the taste.
- **False positives from the reference graph.** A file cross-linked from a `README` or `session-notes.md` is still referenced. Verify via the graph before flagging.
- **Markdown knowledge repos ≠ app code.** Do not force DRY-worthy abstractions or component trees onto notes. Runtime/API checks degrade silently here — treat as opt-in spot-checks, never a hard gate.
- **The 1000-line rule is a smell, not a veto.** Flag it and ask whether to decompose first; waive it only with a clear structural reason.
- **Irreversible deletion.** Never hard-`rm` or `--force`. Branch + `git rm` mandatory; treat git log as undo.
- **Fix without verification.** A review fix that breaks nearby tests is a regression, not an improvement. Always re-run affected code/tests after patching.
- **`burp` / `gh` availability.** Checks citing them fail silently if absent — fall back to runtime logs or treat branch as orphan conservatively.
- **Don't flood with nits.** If there are structural issues, lead with those. A few high-conviction findings beat a long list of cosmetic notes.

## Verification

- Phase 1 complete when every finding is severity-tagged, stated in the four-part format, and no fix introduced a regression (affected tests pass).
- Phase 2 complete when no orphaned (0-reference) files remain and every deletion is committed on a named branch:

```
git log --oneline -1 --stat
```
