---
name: research-market-competitor
description: Conducts market research, competitor analysis, industry scans, benchmarking, and positioning reviews using reliable up-to-date sources. Use when the user asks for market research, competitor research, landscape analysis, feature comparison, pricing comparison, market sizing, or evidence-backed strategic insights.
---

# Research Market Competitor

Use this skill to produce concise, traceable research that is easy to understand and easy to act on.

## Core Rules

- Be concise and use plain English.
- Prioritize reliable, recent, traceable sources.
- Separate facts, inferences, and unknowns.
- Summarize first, then add supporting detail.
- Compare in tables whenever comparison helps.
- Use diagrams only for flows, ecosystems, value chains, or relationships.
- Flag weak evidence, stale sources, and source disagreement clearly.

## Research Modes

Choose the lightest mode that answers the question:

| Mode | Use when | Default output |
| --- | --- | --- |
| `quick-scan` | Fast orientation is enough | Short summary, 1 comparison table, key sources |
| `deep-dive` | The user needs a fuller market picture | Summary, multiple comparison tables, confidence notes, open questions |
| `decision-memo` | The research must support a product or business decision | Research summary, comparison tables, recommendation inputs, product-experts analysis |

If the user does not specify a mode, infer it from the ask.

## Source Standards

Prefer sources in this order:

1. Primary sources: company sites, product docs, pricing pages, SEC filings, earnings reports, investor letters, government or regulator data, first-party research.
2. Trusted secondary sources: Gartner, IDC, Statista, reputable analyst firms, top-tier publications, respected industry reports.
3. Weak signals: blogs, vendor content, affiliate lists, community threads, social posts.

Rules:

- Use at least 2 independent sources before presenting a strong claim.
- Prefer recent sources first, especially for AI, pricing, product launches, and competitive moves.
- If an older source is still used, explain why it remains relevant.
- Do not present vendor claims as facts without corroboration.
- Record what each source supports so claims stay traceable.

For detailed source guidance, read [source-quality-checklist.md](source-quality-checklist.md).

## Workflow

### 1. Define the question

Clarify:

- What decision this research should support
- Which market, segment, geography, or customer type matters
- Which competitors or alternatives matter most
- Whether the user needs current-state facts, trend analysis, or recommendations

### 2. Gather evidence

Collect the smallest useful set of strong sources first.

Focus on:

- Product positioning
- Target customer or ICP
- Pricing and packaging
- Feature set and differentiators
- Distribution channels
- Proof points such as customer stories, market data, usage signals, or financial indicators

### 3. Vet evidence

For each important claim, check:

- Source type
- Publication date
- Possible bias
- Whether another source confirms it
- Whether the claim is still likely true now

### 4. Synthesize

Turn notes into:

- A short executive summary
- A comparison table
- A list of key insights
- A list of unknowns or contradictions

Normalize comparisons so they are apples to apples:

- Same customer segment
- Same geography
- Same product tier where possible
- Same time period where possible

### 5. Analyze with product experts

After the evidence is gathered and summarized, read and apply the product-experts skill at `~/.cursor/skills/product-experts/SKILL.md` (or the equivalent path in your agent harness).

Use it to interpret the research from:

- Designer perspective
- PM perspective
- Engineering perspective

Keep the handoff clean:

- This skill owns evidence gathering, source quality, summaries, and comparisons.
- The product-experts skill owns trade-offs, recommendations, and product interpretation.

## Output Structure

Default to this structure and trim sections that are not needed:

```markdown
# [Research Topic]

## Executive Summary
- [3-5 concise bullets]

## What We Know
- [Verified fact]

## Comparison
| Company | ICP | Core value | Key features | Pricing | Notes |
| --- | --- | --- | --- | --- | --- |

## Key Insights
- [Insight with confidence level]

## Risks And Unknowns
- [Gap, contradiction, or weak signal]

## Product-Experts Interpretation
### Designer View
- [...]
### PM View
- [...]
### Engineering View
- [...]

## Sources
| Source | Type | Date | Supports |
| --- | --- | --- | --- |
```

For more templates, read [output-template.md](output-template.md).
For concise examples, read [examples.md](examples.md).

## Required Output Rules

- Always include `Executive Summary`, `Key Insights`, and `Sources`.
- Always label insights with `high`, `medium`, or `low` confidence when evidence strength differs.
- Always identify whether statements are facts, inferences, or unknowns when the distinction matters.
- Always use a table for competitor or option comparisons.
- Always include traceable sources for non-obvious claims.
- Always call out contradictions instead of smoothing them over.
- Always say what is missing if the evidence is too thin.

## Presentation Rules

- Keep headings short.
- Prefer bullets over long paragraphs.
- Prefer one strong table over many weak ones.
- Avoid jargon unless the user already uses it.
- Make each table scannable and decision-friendly.
- Use mermaid only when it makes structure clearer than prose.

## Head Of Research Guardrails

Use these to make the work stronger:

- Tier evidence by strength.
- Use recency windows that match the market speed.
- Distinguish market facts from strategic advice.
- Note where sources may be biased or incomplete.
- Highlight what would most change the conclusion.
- Show the strongest available comparison, not every possible data point.
