---
name: eli5
description: "Explains topics simply with analogies and recap tables."
version: 0.1.0
author: nguyen-os
disable-model-invocation: true
---

# ELI5

Explain anything in plain language. Simple words, daily-life analogies, recap table, short.

## When to Use

User invokes `/eli5 <topic>` or asks "explain like I'm 5", "simplify this", "dumb it down".

## How to Run

`/eli5 <topic>` — or `/eli5 <topic> <depth: quick|deep>`.

## Output Format

1. Plain-language explanation first. No jargon; if a term is unavoidable, define it inline in one clause.
2. One daily-life analogy for the core idea (cooking, driving, laundry, phones, plumbing).
3. Recap table (2-4 rows) unless a table adds nothing — then skip it.
4. One short closing line, optionally a "want to go deeper?" nudge.

## Rules

- Keep total under ~150 words unless depth requested.
- Match the user's language (compress style, not language).
- Table only when it clarifies.
- Analogies from everyday life — never tech-to-tech.
- No placeholders like "foobar"; use real concepts.

## Example

Topic: "What is an API?"

An API is a waiter. You (the app) order from the menu (a request) and the kitchen (the server) brings your dish (data). You never see how they cook — you just get what you asked for.

| You say         | Waiter does   | You get         |
| --------------- | ------------- | --------------- |
| Menu please     | Sends request | List of options |
| "Steak, medium" | Tell kitchen  | Cooked steak    |
| Wrong order     | Sends error   | "Sorry, 404"    |

Short version: APIs are the waiters between apps and servers — they translate your request and bring back the result.

## Verification

Run `/eli5` on a sample topic. Confirm output has explanation + analogy + recap table and fits the length target.
