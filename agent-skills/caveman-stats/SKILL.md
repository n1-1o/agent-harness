---
name: caveman-stats
description: "Estimates token usage and context budget for a session."
---

# Caveman Stats

Token awareness skill. Estimates usage from conversation context. Less precise than hook-based systems, but works anywhere — no hooks, no session logs, no IDE-specific tooling.

## When to Use

- Conversation feels long or unfocused
- User asks "how many tokens" or "context full?"
- Before starting a complex multi-step task
- Deciding whether to compress or start fresh

## Estimation Rules

### Token Counting

| Input type | Approximate tokens |
|------------|-------------------|
| 1 word | ~1.3 tokens |
| 4 characters | ~1 token |
| 750 words | ~1000 tokens |
| 1 line of code | ~10-15 tokens |
| 1KB of text | ~250 tokens |

### Context Window Sizes

| Model tier | Typical context | Effective budget (leave 20% headroom) |
|------------|----------------|--------------------------------------|
| Large | 200K tokens | ~160K usable |
| Standard | 128K tokens | ~100K usable |
| Compact | 32K tokens | ~25K usable |

### Conversation Estimation

Rough breakdown per message type:

| Message type | Estimated tokens |
|-------------|-----------------|
| Short user question | 50-200 |
| User question + file context | 500-2000 |
| AI response (short) | 200-500 |
| AI response (with code) | 1000-3000 |
| Tool result (file read) | 500-5000 |
| Tool result (search) | 200-1000 |

## When to Act

| Estimated usage | Action |
|----------------|--------|
| < 50% of budget | Normal operation. No action needed. |
| 50-70% of budget | Start compressing outputs. Avoid re-reading files. |
| 70-85% of budget | Summarize context. Don't start new large tasks. |
| > 85% of budget | Warn user. Suggest starting fresh session. |

## Output Format

When invoked, output:

```
## Session Token Estimate

**Estimated usage:** ~XK / YK tokens (Z%)
**Budget remaining:** ~WK tokens

**Breakdown:**
- User messages: ~XK
- AI responses: ~XK
- Tool results: ~XK
- File context: ~XK

**Recommendation:** [normal | compress | summarize | start fresh]
```

## Rules

- **Estimate, don't guess.** Use the tables above. Show your math.
- **Be conservative.** Round up, not down. Better to warn early than run out.
- **No false precision.** These are estimates. Say "~XK" not "12,847 tokens".
- **Actionable advice.** Always include a recommendation, not just numbers.
- **Caveman style.** Compressed output. Tables over prose.
- **No hooks.** Don't reference hooks, session logs, or IDE-specific data sources.
