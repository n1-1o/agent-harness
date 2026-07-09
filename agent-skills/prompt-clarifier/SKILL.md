---
name: prompt-clarifier
description: >
  Before executing, the agent clarifies the user's intent by asking targeted questions, surfacing assumptions, and proposing interpretations. Uncovers opportunities the user hadn't considered. Each clarification loop makes the prompt richer, more nuanced, and more actionable. Trigger: any non-trivial request, ambiguous intent, or when the user asks for a second opinion on a prompt.
---

# Prompt Clarifier

Before executing, clarify the user's intent. Don't assume — ask. Each clarification loop makes the work 3× better.

## Why

The best prompts aren't the ones you write — they're the ones you discover through conversation. When an agent clarifies your intent, it:
- Surfaces unseen opportunities you hadn't considered
- Sharpens your intention — you realize what you actually want
- Prevents wasted iterations on the wrong interpretation
- Makes your own thinking clearer before the agent starts

## How

When given a non-trivial request, run this protocol before any execution:

### 1. State your interpretation

"What I think you're asking is... Did I get that right?"

### 2. Surface your assumptions

"Here's what I'm assuming: [list]. Are any of these wrong?"

### 3. Ask targeted questions

Not generic questions. Ones that reveal the shape of the problem:
- "What's the success metric here? How would we know if this worked?"
- "Who is this for? What context should I have?"
- "Are there constraints I should know about?"
- "What have you tried before? What went wrong?"
- "What would you do differently if you had more time?"

### 4. Propose opportunities

"Don't just answer the question — look for the question underneath it. Propose 1-2 alternatives or improvements you think would be better."

### 5. Refine the prompt together

The clarified prompt is richer, more nuanced, and more actionable than the original. This loop alone improves prompt + work quality by at least 3×.

## When to Clarify

| Request type | Action |
|---|---|
| Vague or ambiguous | Clarify before executing |
| Single-file edit | May skip (but ask if context is unclear) |
| Architecture/feature/analysis | Always clarify |
| User says "just do it" | Skip, but flag assumptions |

## Output Format

```markdown
**Clarified intent:** [what you understand the goal to be]

**Assumptions:** [list]

**Questions:** [1-3 targeted questions]

**Proposed approach:** [your interpretation of how to solve this]

**Alternative I noticed:** [opportunity the user might not have considered]

**Ready to proceed?** (or should I ask more?)
```

## Guardrails

- Ask 1-3 questions, not a 10-question survey
- Don't over-clarify trivial requests
- State your interpretation first — let the user correct it
- Always propose opportunities — don't just confirm, look deeper
- The clarified prompt is better than the original. That's the point.

---

*The one practice I credit the most improvement to. Each prompt gets richer, more nuanced, clearer.*