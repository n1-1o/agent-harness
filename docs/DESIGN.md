# The Agent Harness Design

**For product builders and designers who orchestrate AI agents.**

Four-layer mental model accrued from real failures in product design and building.

---

## Core Idea

**Compounding knowledge.** Every failure that escapes once becomes a rule or skill so it can't escape again. Not designed upfront — accrued from real failures.

> I didn't design this harness — I accrued it. Every rule is a defect that escaped once and won't escape again.

A living collection. Quarterly audit: compare, contrast, identify gaps and overlaps, keep only what works.

---

## What This Defends Against

| Layer | Escape prevented | Example |
|-------|------------------|---------|
| Rules | Ambiguity-driven disengagements | Agent starts coding before understanding the design problem |
| Skills | Repeated-lesson escapes | Agent rebuilds component instead of using design system |
| Subagents | Serial-bottleneck attention burn | Waiting for one agent when three could work in parallel |
| MCPs | Transcription-loss escapes | Agent works from stale screenshot instead of live Figma file |

---

## Layer 1 — Rules (firmware)

Always-fire deterministic constraints. Each rule exists to make the agent's design and build output better, not just to constrain behavior.

| Rule | Escape prevented |
|------|------------------|
| `plan-first-execution` | "Code without design framing" |
| `caveman` | Verbose output burns attention |
| `vision-delegation` | Model fakes image understanding |
| `security-standards` | Auth/XSS/secret escapes |
| `documentation-conciseness` | Doc bloat maintenance cost |
| `front-end-development` | Reinventing patterns instead of using the stack |
| Token-budget guardrail | Cost escapes |

---

## Layer 2 — Skills (playbooks)

Loaded on demand. Each skill = compressed lesson from past work.

| Skill | Escape prevented |
|-------|------------------|
| `ai-orchestration` | Serial execution when parallel works |
| `knowledge-librarian` | Insight trapped in chat history |
| `model-router` | Wasting expensive tokens on cheap work |
| `product-experts` + `research-market-competitor` | Building without product context |
| `impeccable` | Design craft missing |
| `internal-rubric` | Presenting unverified answers; confidence scoring, source verification |
| `prompt-clarifier` | Acting on unclear intent; surfaces unseen opportunities, 3× quality improvement |
| `review-bugbot` | Shipping code without structured review; catches bugs, regressions, performance issues |
| `review-security` | Security gaps in auth, input validation, secrets; OWASP Top 10 checks |

---

## Layer 3 — Subagents (delegates)

Parallel probabilistic workers, scoped by deterministic prompts.

| Subagent | Role | Origin |
|----------|------|--------|
| `bugbot` | Code review | Custom skill: `review-bugbot` |
| `security-review` | Security audit | Custom skill: `review-security` |
| `vision-worker` | Image analysis | Custom rule: `vision-delegation` |

Cursor provides six native workers (`explore`, `shell`, `browser-use`, `generalPurpose`, `best-of-n-runner`, `ci-investigator`) — the harness adds methodology on top of the three custom ones above.

**On the loop vs in the loop:** in-the-loop = review every result (doesn't scale); on-the-loop = maintain the harness, let it handle volume.

---

## Layer 4 — MCPs (external hooks)

Deterministic API contracts that let the harness reach outside the editor without copy-paste.

| MCP | Escape prevented |
|-----|------------------|
| Figma | Design ↔ code drift |
| Vercel | Deployment blindness |
| GitLab | CI/CD opacity |
| Browser layer | Can't test in real environment |

---

## Maintenance

Value shows in use, not opening day. Processes change, docs go stale, models improve — a constraint that helped yesterday can hold things back tomorrow. Treat the harness as living infrastructure, not a one-time setup.

**Quarterly audit:** delete completed-phase rules, consolidate new skills, update cross-references, compare/contrast/identify gaps/overlaps, keep only the best.

**Metrics (signals, not scoreboards):** agent disengagements needing intervention, rework comments, defects caught pre-release vs post-release, token spend against budget cap.

---

## The Payoff

> "Bet on the structure, rent the parts."

Models, vector stores, gateways all get leapfrogged; the architecture you wrap around them is what lasts. The model is the replaceable part; the harness is the asset.

---

## Related

- Repo README: `README.md`
- Pattern note: `Knowledge/Patterns/pattern-agent-harness-4-layer.md`

---

*Last updated: July 2026 · Maintainer: Nguyen Tran Ngo · For product builders & designers*