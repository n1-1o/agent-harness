---
name: design-system-enforcement
description: >
  Forces the agent to use real design system components — no fake components, no rebuilding from scratch. Built from the "confidently wrong" failure. Use when the agent proposes new components, recreates existing UI, or builds from scratch instead of using the project's design system. Trigger: "build this component", "create UI", "implement this", when the agent proposes new components.
---

# Design System Enforcement

Forces the agent to use real design system components — no fake components, no rebuilding from scratch. Built from the "confidently wrong" failure where the agent invented components instead of using the monorepo's design system.

## The Failure

The agent produced a "working" UI that looked correct but was a hallucinated component — not connected to any real design system, not testable, not maintainable. The design system enforcement skill makes this failure mode structurally impossible.

## Protocol

### Step 1: Search First
Before building any component:
1. Search the codebase for existing design system components
2. Check for matching tokens, styles, or component patterns
3. Reference the design system documentation
4. Use the Figma MCP to verify component specs

### Step 2: Map to Real Components
- Don't invent props — use the design system's prop interface
- Don't invent styles — use design tokens
- Don't invent layout patterns — use the design system's grid/flex system
- Don't invent states — use the design system's documented states

### Step 3: If No Match Exists
1. **Document why** — what gap does this fill?
2. **Propose a design system addition** — not a standalone component
3. **Follow design system conventions** — naming, props, exports
4. **Get design approval** — verify with Figma before implementing

## Anti-Patterns

- ❌ "Let me create a Button component" → ✅ "Use @design-system/button"
- ❌ "I'll add styles for spacing" → ✅ "Use the spacing tokens from @design-tokens"
- ❌ "Let me implement this from scratch" → ✅ "Let me find the matching component in the design system"

## Guardrails

- Never accept a hallucinated component — always trace to a real one
- If the agent says "no existing component matches", challenge it — search again
- When in doubt, ask for a design system inventory check

---

*This skill was built from a real failure: the agent produced a visually correct UI that was structurally impossible because it wasn't connected to the design system.*