---
name: accesslint
description: >
  Finds and fixes WCAG 2.2 accessibility issues. Audit mode: sweep a codebase or page, produce a prioritized report, no edits. Fix mode: audit, edit, verify loop on a target. Use when auditing, fixing, or verifying accessibility compliance. Trigger: "accessibility audit", "fix a11y", "WCAG check", "accesslint".
---

# Accesslint — Accessibility Audit

Find and fix WCAG 2.2 accessibility issues. Two modes — report (sweep a codebase or page, produce a prioritized written report, no edits) and fix (audit → edit → verify loop on a target).

## When to Use

- Before releasing any user-facing feature
- When user feedback mentions screen reader issues
- After UI component changes
- As part of the Shift-left verification family

## Audit Protocol

1. **Scan** the component tree or page for violations
2. **Prioritize** by impact: A/AA failures first, then AA
3. **Report** with:
   - What's wrong (WCAG criterion)
   - Where it is (file + line)
   - Why it matters (user impact)
   - How to fix it (concrete suggestion)

## Common Violations Checklist

- Missing alt text on images
- Insufficient color contrast (AA: 4.5:1 text, 3:1 large)
- Missing ARIA labels on interactive elements
- Keyboard navigation gaps (focus order, tab trap)
- Form inputs without associated labels
- Missing skip navigation links
- Missing focus indicators
- Color-only state indication

## Fix Loop

1. Audit → find violations
2. Edit → fix each violation
3. Verify → re-audit or test with screen reader

---

*This skill is part of the Shift-left verification family, catching accessibility issues pre-PR.*