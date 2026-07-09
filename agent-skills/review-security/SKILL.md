---
name: review-security
description: >
  Runs security-focused code reviews using Security Review subagent. Checks for auth/XSS/SQL injection, secrets management, CORS/CSRF, CSP headers, input validation, and OWASP Top 10 vulnerabilities. Use when reviewing auth flows, payment systems, data handling, or any user-facing code. Trigger: "security review", "review this for security", auth/payment/data changes.
---

# Security Review Skill

Run structured security reviews. Catches auth/XSS/SQL injection, secret leaks, CORS misconfigs, and OWASP Top 10 vulnerabilities.

## When to Use

- Before merging changes to auth flows, payment systems, or data handling
- When user-facing code changes (input, output, API endpoints)
- After infrastructure or dependency updates
- The user says "security review" or "review this for security"

## What to Check

### Critical (P0 — Block Merge)
| Category | Check |
|---|---|
| **Auth** | Are routes protected? Is session management secure (HTTP-only cookies, secure flag)? |
| **Input validation** | Are all user inputs validated server-side with Zod or equivalent? |
| **SQL/NoSQL injection** | Are queries parameterized? Any string concatenation in queries? |
| **XSS** | Any `dangerouslySetInnerHTML` without DOMPurify? User content escaped? |
| **Secrets** | Any hardcoded API keys, passwords, tokens in code? |
| **CSRF** | Are state-changing requests protected with CSRF tokens? |
| **CORS** | Is CORS configured to only allow trusted origins? |

### Important (P1 — Should Fix)
| Category | Check |
|---|---|
| **CSP** | Are Content-Security-Policy headers set? |
| **HSTS** | Is Strict-Transport-Security enabled? |
| **Error handling** | Do errors leak stack traces or sensitive info? |
| **Rate limiting** | Are endpoints rate-limited? |
| **Dependency updates** | Any known vulnerabilities (`npm audit`)? |
| **Password policy** | Minimum length, complexity requirements enforced? |
| **Session management** | Secure cookie attributes, appropriate expiration? |

### Advisory (P2 — Nice to Have)
| Category | Check |
|---|---|
| **Logging** | Are security events logged? |
| **Audit trail** | Can you trace who did what and when? |
| **Input sanitization** | Beyond validation — are outputs sanitized? |
| **File uploads** | Type and size restrictions? |

## How to Run

```
Task({
  subagent_type: "generalPurpose",
  description: "Security review",
  prompt: "Security review of the following changes: [diff or file list]. Check OWASP Top 10: injection, broken auth, XSS, CSRF, insecure deserialization, sensitive data exposure, missing auth, XSS, insecure components, SSRF. Report by severity.",
  run_in_background: true
})
```

## Output Format

```markdown
**Review Summary:** [1-2 sentence overview]

**P0 — Block Merge:**
- [Vulnerability] — [Location] — [Fix suggestion] — [OWASP ref if applicable]

**P1 — Should Fix:**
- [Vulnerability] — [Location] — [Fix suggestion]

**P2 — Nice to Have:**
- [Improvement] — [Location] — [Suggestion]

**Overall:** [approved / needs fixes / needs re-review]
```

## Threat Modeling Tag

Use the `<SECURITY_REVIEW>` tag for documenting security reviews:

```markdown
<SECURITY_REVIEW>
**Threat Model:**
- Attack vector: [description]
- Impact: [what could happen]
- Likelihood: [high/medium/low]

**Mitigation:**
1. [Fix 1]
2. [Fix 2]

**Verification:**
- [x] Tests added
- [x] Manual test passed
</SECURITY_REVIEW>
```

## Guardrails

- P0 issues must be fixed before merge. No exceptions.
- Provide specific fix suggestions — not just "insecure."
- Reference OWASP Top 10 categories when applicable.
- If no issues found, say so explicitly. Don't pad with P2s.
- For auth/payment changes, always run security review even if user didn't ask.

---

*This skill captures the security review methodology. The Security Review subagent is the worker — the skill is the knowledge.*