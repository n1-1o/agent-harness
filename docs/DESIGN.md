# The Agent Harness Design

**For product builders and designers who orchestrate AI agents.**

This document explains the four-layer mental model behind the agent harness — not as an abstract framework, but as a living collection accrued from real failures in product design and building.

---

## Core Idea

**Compounding knowledge.** Every failure that escapes once becomes a rule or skill so it can't escape again. The harness is not designed upfront — it's accrued from real failures.

> I didn't design this harness — I accrued it. Every rule is a defect that escaped once and won't escape again.

**This is a living collection.** I audit quarterly: compare, contrast, identify gaps and overlaps, keep only the best and most relevant. New pieces get added; stale ones get deleted. It grows as I grow.

---

## For Product Builders & Designers

This harness is built by a designer who builds. It's tuned for:

- **Design craft**: `impeccable` skill, Figma MCP, visual debugging patterns
- **Product thinking**: `product-experts`, `research-market-competitor`, plan-first framing
- **Orchestration**: `ai-orchestration`, multi-agent coordination, on-the-loop patterns
- **Compound knowledge**: `knowledge-librarian`, execution traces, rubric-based grading

Not tuned for:

- Engineering velocity (code faster, test more, deploy quicker)
- Backend architecture (database design, API patterns, infra)
- DevOps (CI/CD pipelines, monitoring, scaling)

Those matter — but they're not what this collection is for.

---

## Layer 1 — Rules (firmware)

**Purpose:** Always-fire deterministic constraints. Each rule exists to make the agent's design and build output better, not just to constrain behavior.

**Curated to 6 + budget guardrail:**

| Rule | Escape prevented | Origin |
|------|------------------|--------|
| `plan-first-execution` | "Code without design framing" | Subsumes Karpathy's 4 principles |
| `caveman` | Verbose output burns attention | Frugality — maximize ROI per token |
| `vision-delegation` | Model fakes image understanding | GLM-5.2 lacks vision capability; also folds in Evidence-First Debugging |
| `security-standards` | Auth/XSS/secret escapes | Zero-trust; security-specific ARIA only (general a11y moved to front-end-development) |
| `documentation-conciseness` | Doc bloat maintenance cost | Agents write too many long docs |
| `front-end-development` | Reinventing patterns instead of using the stack | React/Next/Zod/Shadcn + general a11y (WCAG AA) |
| Token-budget guardrail | Cost escapes | Pro plan $20 cap |

---

## Layer 2 — Skills (playbooks)

**Purpose:** Loaded on demand. Each skill = compressed lesson from past work.

**Curated to 6 families:**

| Skill | Escape prevented | Origin |
|-------|------------------|--------|
| `ai-orchestration` | Serial execution when parallel works | Systems thinker pattern |
| `knowledge-librarian` | Insight trapped in chat history | Lifelong learning belief |
| `model-router` | Wasting expensive tokens on cheap work; preserves high-intelligence models for hard tasks | Frugality + model preservation (opus added as heavy-alt for deep reasoning) |
| `product-experts` + `research-market-competitor` | Building without product context | Product-thinking triad |
| `impeccable` | Design craft missing | Subsumes emil-design-eng + interface-design; includes Motion Decision Framework from Emil Kowalski |

**Two personal practices:**

1. Agents build internal rubric to grade their own answers; only surface the best.
2. Agents report degree of confidence with citable sources and verbatims.
3. Agents clarify prompts before executing — surfaces unseen opportunities, sharpens intention (3× quality improvement).

---

## Layer 3 — Subagents (delegates)

**Purpose:** Parallel probabilistic workers, scoped by deterministic prompts.

**Specialists:**

| Subagent | Role |
|----------|------|
| `explore` | Read-only codebase discovery |
| `shell` | Terminal operations |
| `browser-use` | Web automation |
| `generalPurpose` | Multi-file implementation |
| `bugbot` | Code review |
| `security-review` | Security audit |
| `vision-worker` | Image analysis |
| `best-of-n-runner` | Parallel attempts |
| `ci-investigator` | CI failure root cause |

**On the loop vs in the loop:**

- **In-the-loop** = review every result (doesn't scale)
- **On-the-loop** = maintain the harness, let it handle volume

**Three harness types:**

| Type | Role | Maps to |
|------|------|---------|
| Guides | Feedforward controls | Rules layer |
| Sensors | Feedback controls | bugbot/security-review/webapp-testing |
| Orchestrator-supervisor | Coordination | Subagent orchestration |

---

## Layer 4 — MCPs (external hooks)

**Purpose:** Deterministic API contracts that let the harness reach outside the editor without copy-paste.

| MCP | Escape prevented |
|-----|------------------|
| Figma | Design ↔ code drift |
| Vercel | Deployment blindness |
| GitLab | CI/CD opacity |
| Browser layer | Can't test in real environment |

**Defense:** Prevents "agent can't see the real system" escapes — no transcription loss.

---

## What This Defends Against

| Layer | Escape prevented | Example |
|-------|------------------|---------|
| Rules | Ambiguity-driven disengagements | Agent starts coding before understanding the design problem |
| Skills | Repeated-lesson escapes | Agent rebuilds component instead of using design system |
| Subagents | Serial-bottleneck attention burn | Waiting for one agent when three could work in parallel |
| MCPs | Transcription-loss escapes | Agent works from stale screenshot instead of live Figma file |

---

## Maintenance: A Living Collection

**The building metaphor:** Value shows in use, not opening day. Processes change, docs go stale, models improve — a constraint that helped yesterday can hold things back tomorrow.

**Quarterly audit:**

1. Delete completed-phase rules
2. Consolidate new skills
3. Update cross-references
4. Compare, contrast, identify gaps and overlaps
5. Keep only the best and most relevant

**Metrics (signals, not scoreboards):**

- Agent disengagements needing intervention
- Rework comments
- Defects caught pre-release vs post-release
- Token spend against budget cap

---

## The Payoff

> "Bet on the structure, rent the parts."

Models, vector stores, gateways all get leapfrogged; the architecture you wrap around them is what lasts. When Claude 5, GPT-6, or whatever lands next ships, the rules, skills, subagents, and MCPs transfer with it.

**The model is the replaceable part; the harness is the asset.**

---

## Related

- Medium article: `work/Content/medium-agent-harness-stack.md`
- LinkedIn teaser: `work/Content/linkedin-agent-harness-teaser.md`
- Pattern note: `Knowledge/Patterns/pattern-agent-harness-4-layer.md`
- Repo README: `README.md`

---

*Last updated: July 2026 · Maintainer: Nguyen Tran Ngo · For product builders & designers*
