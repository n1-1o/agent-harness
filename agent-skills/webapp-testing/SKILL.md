---
name: webapp-testing
description: >
  Web application testing with Playwright for comprehensive E2E testing. Use when testing user flows, verifying UI behavior, or running regression tests before release.
---

# Webapp Testing

Comprehensive web application testing using Playwright for end-to-end test automation.

## When to Use This Skill

- Before releasing to verify critical user flows
- After major changes to ensure no regressions
- Testing interactive components (forms, modals, navigation)
- Visual regression testing
- Performance-critical paths

## Test Categories

### Functional Tests
- User registration/login flows
- Core feature workflows
- Error handling and edge cases
- Form validation and submission

### Visual Tests
- Layout consistency across breakpoints
- Component state changes (hover, focus, active, disabled)
- Modal/dialog behavior
- Loading and empty states

### Performance Tests
- Page load time (<2s target)
- Interaction responsiveness (<100ms for UI feedback)
- Memory leaks in long sessions

## Test Structure

```
tests/
├── e2e/                    # End-to-end user flows
│   ├── auth.spec.ts
│   ├── checkout.spec.ts
│   └── dashboard.spec.ts
├── regression/              # Automated regression suite
│   └── critical-path.spec.ts
└── visual/                  # Visual regression tests
    └── components.spec.ts
```

## Key Practices

1. **Test real user journeys**, not just components in isolation
2. **Use test containers** for database and service mocks
3. **Run tests in CI** on every PR
4. **Screenshot on failure** for quick debugging
5. **Test across browsers** (Chrome, Firefox, Safari)

---

*This skill is part of the Shift-left verification family, used for pre-release quality gates.*