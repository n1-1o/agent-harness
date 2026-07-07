# Agent Harness

**A growing collection of rules, skills, and scaffolding for product builders and designers who orchestrate AI agents.**

Since I started using agentic AI, I kept noticing the same failures come back. An agent rebuilds a component from scratch instead of using the design system. Output that looks finished and is wrong. Confidence that isn't an independent check.

When a failure happens more than once, I turn it into a rule or a skill so the agent can't make it again. Over time, that pile of guardrails became my harness — the scaffolding around the model that keeps making it better.

This repo is a **living, growing collection** of the harness pieces I use daily as a designer and product builder. It's not static — I audit quarterly, add what works, delete what doesn't, and keep only the best and most relevant.

**Not for engineers:** This isn't about writing code faster. It's about designing and building better products with AI as your collaborator. The rules, skills, and patterns here are tuned for product thinking, design craft, and orchestration — not engineering velocity.

**Medium article:** [My Agent Harness: The Scaffolding I Accrued From Failures](../work/Content/medium-agent-harness-stack.md)

---

## The Four-Layer System

| Layer | Purpose | What's included |
|-------|---------|-----------------|
| **Rules (firmware)** | Always-fire deterministic constraints | 5 rules + token-budget guardrail |
| **Skills (playbooks)** | Compressed lessons from past work | 6 skill families |
| **Subagents (delegates)** | Parallel probabilistic workers | explore, shell, browser-use, bugbot, security-review, vision-worker, etc. |
| **MCPs (external hooks)** | API contracts to external systems | Figma, Vercel, GitLab, browser layer |

See `docs/DESIGN.md` for the full mental model.

---

## Install

### One-liner (recommended)

```bash
curl -fsSL https://raw.githubusercontent.com/nguyentran-ngo/agent-harness/main/install.sh | bash
```

### Manual clone

```bash
git clone https://github.com/nguyentran-ngo/agent-harness.git
cd agent-harness
./install.sh
```

### Options

- `--no-symlink`: Copy files instead of symlinking (use if you want to edit locally)

### What it does

- Symlinks rules into `~/.cursor/rules/`
- Symlinks skills into `~/.cursor/skills/`
- Prints next steps for MCP setup

### Next steps

1. **Restart Cursor** to load the new rules and skills
2. **Set up MCPs**: see [`mcps/README.md`](mcps/README.md)
3. **Read the Medium article** for the full story

---

## What's Included

### Rules (6 + budget guardrail)

| Rule | Purpose |
|------|---------|
| `plan-first-execution.mdc` | Never execute complex tasks without an approved plan |
| `caveman.mdc` | Terse output, ~75% fewer tokens |
| `vision-delegation.mdc` | Delegate image requests to vision-capable subagent; includes Evidence-First Debugging |
| `security-standards.mdc` | Zero-trust, Zod validation, threat modeling (security-specific ARIA only) |
| `documentation-conciseness.mdc` | 3-doc max (PRD, DESIGN, README) |
| `front-end-development.mdc` | React/Next/Zod/Shadcn conventions + general a11y (WCAG AA) |
| Token-budget guardrail | $20 Pro cap thresholds |

### Skills (6 active + 3 archived routers)

| Skill | Purpose |
|-------|---------|
| `ai-orchestration` | Multi-agent coordination |
| `knowledge-librarian` | Turn raw material into reusable notes |
| `model-router` | Cost-aware model escalation |
| `product-experts` | Designer/PM/eng lens analysis |
| `research-market-competitor` | Evidence-backed market scans |
| `impeccable` | Design-craft delegate (includes Motion Decision Framework from Emil Kowalski) |
| *`review`* (archived) | Router → review-bugbot + review-security |
| *`emil-design-eng`* (archived) | Pointer → impeccable |
| *`interface-design`* (archived) | Pointer → impeccable |

### MCPs

| MCP | Purpose |
|-----|---------|
| Figma | Design ↔ code bridge |
| Vercel | Deployments, observability |
| GitLab | Issues, MRs, CI |
| Browser layer | In-IDE tab + raw CDP |

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
├── install.sh                # CLI installer
├── rules/                    # Curated .mdc rule files
├── skills/                   # Curated SKILL.md files
├── mcps/
│   ├── README.md             # MCP setup guide
│   └── mcp.json.example      # Copy-paste template
└── docs/
    └── DESIGN.md             # The 4-layer mental model
```

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

- Medium article: `work/Content/medium-agent-harness-stack.md`
- LinkedIn teaser: `work/Content/linkedin-agent-harness-teaser.md`
- Pattern note: `Knowledge/Patterns/pattern-agent-harness-4-layer.md`

---

*Last updated: July 2026 · Maintainer: Nguyen Tran Ngo · For product builders & designers*
