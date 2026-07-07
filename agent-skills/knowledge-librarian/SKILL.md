---
name: knowledge-librarian
description: Converts chats, transcript mining, product research, and build work into reusable notes in Knowledge/. Use when synthesizing sources, extracting patterns, maintaining a knowledge base, or turning repeated insights into reusable skills.
---

# Knowledge Librarian

Use this skill to keep the repository smart over time.

The default job is to turn raw material into reusable notes with clear structure, traceable sources, and obvious next use.

## Use This Skill When

- A conversation produced useful insight that should not stay trapped in chat history
- Transcript mining created repeated patterns
- Research needs to be turned into stable notes
- A new idea might be worth promoting into a skill
- The `Knowledge/` library needs cleanup, structure, or synthesis

## Source-First Rule

Read these first:

- `Knowledge/README.md`
- `Knowledge/Sources/lenny-transcript-mining-map.md`
- `Knowledge/Templates/episode-note-template.md`
- `Knowledge/Templates/pattern-note-template.md`
- `Knowledge/Templates/concept-note-template.md`

Use the [Lenny transcript archive](https://github.com/ChatPRD/lennys-podcast-transcripts) as the default outside source for product and career pattern mining.

## Workflow

1. Identify the note type
- Episode or source note
- Pattern note
- Concept note
- Skill candidate

2. Extract only what matters
- Facts
- Repeated behaviors
- Artifacts
- Questions
- Decision rules
- Failure modes

3. Write for reuse
- Clear title
- Short summary
- Why it matters
- Links to related notes or skills

4. Promote carefully
- Move to `Patterns/` when at least 3 strong sources repeat the idea
- Move to a skill only when the pattern has a clear trigger and repeatable output

5. Leave a next step
- What should be created, updated, tested, or discussed next?

## Capture Rules

- Separate facts from interpretation.
- Do not dump long raw transcripts into notes.
- Prefer paraphrase plus source link over long quotation.
- Keep notes small enough to scan quickly.
- Every note should answer "why should future me care?"

## Default Questions

- Is this a fact, a pattern, or just a nice quote?
- Does this idea repeat across multiple operators?
- What behavior or artifact is worth copying?
- Which goal in `GOALS.md` does this help?
- Should this become a note, a task, or a skill?

## Output

Use this structure by default:

```markdown
# [Note Title]

## Summary
- Short explanation

## Evidence
- Sources used

## Pattern or concept
- What repeats or what the idea means

## Why it matters here
- Relevance to this repository

## Next use
- Skill candidate, task, or follow-up note
```

## Guardrails

- Do not create notes with no future use.
- Do not promote one person's opinion into a repository rule too early.
- Do not create overlapping notes that say the same thing.
- Prefer one strong note over five thin notes.

## Core Principles

- Clear writing compounds.
- Good systems add scaffolding to messy work.
- Notes should reduce future thinking, not create more clutter.
