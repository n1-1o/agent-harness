---
description: "Orchestrating AI agents strategically across complex, multi-step work. Use when planning complex work, debugging stubborn issues, or coordinating multiple AI agents."
---

# AI Orchestration Skill

Personal skill for orchestrating AI agents strategically across complex, multi-step work.

## When to Use

**Triggers:**
- Complex, multi-step work requiring coordination
- Debugging sessions that have run >3 iterations without progress
- Work requiring multiple AI agents with specialized tasks
- Quality-critical deliverables

**Do NOT use for:**
- Simple, single-file edits
- Quick refactors with clear scope
- Routine maintenance tasks

## Core Principles

### 1. Evidence Over Assumption
Upload visual evidence early (screenshots, logs), tag files with @ mentions, provide source documents as ground truth.

### 2. Constraints Over Freedom
Set "Do NOT" boundaries as explicitly as "Do" instructions. Define file/folder boundaries before work starts.

### 3. Systems Over Solutions
Ask for architecture diagrams before implementation. Connect frontend ↔ backend ↔ infra impact.

### 4. Checkpoints Over Leaps
Provide runtime evidence at each iteration. Tight loops: Error → Evidence → Fix → Verify → Repeat.

### 5. Craft Over Speed
Reject one-off fixes; demand systematic approaches. Create enforcement mechanisms.

### 6. Meta-Analysis Over Routine
Create skill documents from successful patterns. Build reusable templates and checklists.

## Techniques

### Multi-Agent Parallelization
When work has 5+ distinct components:
1. Break into independent components
2. Deploy parallel agents with specialized tasks (Research, Implementation, Verification)
3. Synthesize outputs into cohesive whole
**Impact:** 4x speedup, better quality through specialization

## Pre-Flight Checklist
- [ ] Evidence collected: screenshots, logs, source documents ready
- [ ] Constraints defined: "Do NOT" boundaries explicit
- [ ] Files tagged: relevant files identified with @ mentions
- [ ] Success criteria clear: validation tests defined
- [ ] Multi-agent needed?: if 5+ components, deploy parallel agents

---

*This skill institutionalizes patterns from analysis of 382 agent transcripts and 106+ examples of strategic AI behavior management.*