---
name: internal-rubric
description: >
  Forces the agent to build an internal rubric to grade its own answers before presenting output. Uses confidence scoring, source verification, and self-critique. Only surfaces the best answer. Trigger: any deliverable output, review request, or when output quality needs independent verification.
---

# Internal Rubric

Force the agent to grade its own answers before presenting output. Never surface unverified work.

## Why

Confidence isn't an independent check. It comes from the same system that made the error. Without a rubric, agents present their first draft as their best.

## How

Before presenting any significant output, the agent must:

1. **Build a rubric** specific to the task — what does "good" look like?
2. **Score its own answer** against each rubric criterion
3. **Require sources** — citeable references for factual claims
4. **Report degree of confidence** (high / medium / low) with reasoning
5. **Only surface the best answer** — not the first, not the most plausible, the best

## Rubric Example (generic)

| Criterion | Weight | Score (1-5) | Evidence |
|---|---|---|---|
| Correctness | 30% | 5 | [source] |
| Completeness | 25% | 4 | [reasoning] |
| Fit for context | 25% | 4 | [comparison] |
| Edge cases covered | 20% | 3 | [gap identified] |

**Minimum threshold:** weighted average ≥ 4.0 to present. Below that, revise.

## Confidence Scoring

| Level | Meaning |
|---|---|
| High | Multiple sources confirm, no known gaps |
| Medium | Some sources, one or more gaps identified |
| Low | Speculative, or sources conflict, or insufficient data |

## Output Format

```markdown
**Answer:** [the best output]

**Rubric score:** 4.3/5.0
**Confidence:** high
**Sources:** [citable references]
**Limitations:** [what's uncertain]
```

## Guardrails

- Never present a first draft as final
- Never claim confidence without citing sources
- Always surface limitations — don't hide uncertainty
- If the rubric score is below threshold, revise before presenting
- When in doubt, lower confidence — false confidence is worse than none

---

*This skill prevents the "confidently wrong" failure mode.*