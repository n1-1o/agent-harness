# Agent Harness

**A growing collection of rules, skills, and scaffolding for product builders and designers who orchestrate AI agents.**

Tool-agnostic — works with **Cursor**, **Claude Code**, and other AI IDEs that support rules/skills.

---

## Install

### One-liner (recommended)

```bash
# For Cursor (default)
curl -fsSL https://raw.githubusercontent.com/n1-1o/agent-harness/main/install.sh | bash

# For Claude Code
curl -fsSL https://raw.githubusercontent.com/n1-1o/agent-harness/main/install.sh | bash -s -- --target claude
```

### Manual clone

```bash
git clone https://github.com/n1-1o/agent-harness.git
cd agent-harness

# For Cursor (default)
./install.sh

# For Claude Code
./install.sh --target claude

# Copy instead of symlink (if you want to edit locally)
./install.sh --no-symlink
```

---

## What's Included

### Rules (7 + budget guardrail)

|| Rule | Purpose |
||------|---------|
|| `plan-first-execution.mdc` | Never execute complex tasks without an approved plan |
|| `caveman.mdc` | Terse output, ~75% fewer tokens |
|| `model-router.mdc` | Cost-aware model routing — preserve high-intelligence models for hard work |
|| `vision-delegation.mdc` | Delegate image requests to vision-capable subagent; includes Evidence-First Debugging |
|| `security-standards.mdc` | Zero-trust, Zod validation, threat modeling |
|| `documentation-conciseness.mdc` | 3-doc max, reference-over-repeat |
|| `front-end-development.mdc` | React/Next/Zod/Shadcn conventions + general a11y (WCAG AA) |
|| Token-budget guardrail | $20 Pro cap thresholds |

### Skills (12 active)

|| Skill | Purpose |
||-------|---------|
|| `ai-orchestration` | Multi-agent coordination; orchestrating the orchestrator |
|| `knowledge-librarian` | Turn raw material into reusable notes; execution traces as improvement data |
|| `product-experts` | Designer/PM/eng lens analysis |
|| `research-market-competitor` | Evidence-backed market scans |
|| `impeccable` | Design-craft delegate (includes Motion Decision Framework from [pbakaus/impeccable](https://github.com/pbakaus/impeccable)) |
|| `internal-rubric` | Grade own answers before presenting; confidence scoring, source verification |
|| `prompt-clarifier` | Clarify intent before executing; surfaces unseen opportunities, 3× quality improvement |
|| `review-bugbot` | Code review: catches bugs, regressions, performance issues |
|| `review-security` | Security review: OWASP Top 10, auth/XSS/SQL injection checks |
|| `webapp-testing` | E2E testing with Playwright; pre-release quality gates |
|| `accesslint` | WCAG 2.2 accessibility audit and fixes |
|| `design-system-enforcement` | Forces real design system components — no fake components, no rebuilding from scratch |

### MCPs

|| MCP | Purpose |
||-----|---------|
|| Figma | Design ↔ code bridge |
|| Vercel | Deployments, observability |
|| GitLab | Issues, MRs, CI |
|| Browser layer | In-IDE tab + raw CDP |

See [`mcps/README.md`](mcps/README.md) for setup.

---

## This Is a Living Collection

**The core idea is compounding knowledge:** every escape becomes a rule, every repeated lesson becomes a skill. But harnesses can bloat. I audit quarterly.

### Quarterly ritual

1. **Compare**: Read each rule and skill. Does it still fire?
2. **Contrast**: Are there overlaps? (e.g., two rules preventing the same escape)
3. **Identify gaps**: What failures slipped through since last audit?
4. **Consolidate**: Merge overlapping rules/skills
5. **Delete**: Remove completed-phase or stale items
6. **Update cross-references**: Ensure links work

### Questions to ask

- Does this rule/skill still prevent a real failure?
- Is this the simplest formulation?
- Does this overlap with another rule/skill?
- What new failure mode have I seen that's not covered?

### Metrics (signals, not scoreboards)

- Agent disengagements needing intervention
- Rework comments
- Defects caught pre-release vs post-release
- Token spend against budget cap

---

## For Product Builders & Designers

This harness is built by a designer who builds. It's tuned for:

- **Design craft**: `impeccable` skill, Figma MCP, visual debugging patterns
- **Product thinking**: `product-experts`, `research-market-competitor`, plan-first framing
- **Orchestration**: `ai-orchestration`, multi-agent coordination, on-the-loop patterns
- **Compound knowledge**: `knowledge-librarian`, execution traces, rubric-based grading
- **Shift-left verification**: `webapp-testing`, `accesslint`, `design-system-enforcement`

Not tuned for:

- Engineering velocity (code faster, test more, deploy quicker)
- Backend architecture (database design, API patterns, infra)
- DevOps (CI/CD pipelines, monitoring, scaling)

Those matter — but they're not what this collection is for.

---

## Structure

```
agent-harness/
├── README.md                 # This file
├── install.sh                # Tool-agnostic installer (Cursor, Claude Code)
├── agent-rules/              # Curated .mdc rule files (tool-agnostic)
├── agent-skills/             # Curated SKILL.md files (tool-agnostic)
├── mcps/
│   ├── README.md             # MCP setup guide (Cursor-specific; adapt for other tools)
│   └── mcp.json.example      # Copy-paste template for Cursor
└── docs/
    └── DESIGN.md             # The 4-layer mental model
```

**Note:** MCPs are Cursor-specific in this repo. For Claude Code or other tools, adapt the MCP setup to the tool's equivalent integration pattern.

---

## Updating

```bash
cd agent-harness
git pull
./install.sh  # Re-link any new files
```

---

## Contributing

This is a personal collection — my scars, my failures, my patterns. But if you're a product builder or designer and you've accrued your own harness pieces, I'd love to see them.

Open an issue or PR if:
- You've built a rule/skill that prevents a failure I haven't seen
- You've found overlap or gap in my collection
- You want to share your own harness patterns

---

## License

MIT — use it, fork it, make it your own.

---

## Related

- Medium article: [Agent Harness for Designers and Builders](../work/Content/medium-agent-harness-stack.md)
- LinkedIn teaser: [My Agent Harness](../work/Content/linkedin-agent-harness-teaser.md)
- Pattern note: [Agent Harness — Four-Layer System](../knowledge/patterns/pattern-agent-harness-4-layer.md)

---

*Last updated: July 2026 · Maintainer: Nguyen Tran Ngo · For product builders & designers*