---
name: model-router
description: >
  Decides which Cursor model to use per task. Routes to glm-5.2 (heavy, primary), opus (heavy, alt for deep reasoning), qwen3.5-397b-a17b (medium), or qwen3.6-35b-a3b (small) based on task complexity. Preserve high-intelligence models for planning, architecture, and deep reasoning. Trigger: any task start, "which model", "use cheap model", "save tokens".
---

# Model Router

Three tiers. Pick before spawning subagent or starting work.

## Decision table

| Tier | Model | Use for | Avoid for |
|---|---|---|---|
| Heavy | glm-5.2 (primary), opus (alt: deep reasoning) | Planning, architecture, multi-file refactor, DB schema, security review, new feature design, threat modeling | Trivial ops, renames, image analysis, single-file edits |
| Medium | qwen3.5-397b-a17b | Single-feature work, scoped bug fix, 1-2 file edit with logic, doc writing, vision-worker delegation | Architecture, trivial ops |
| Small | qwen3.6-35b-a3b | Grep, glob, delete file, move file, git add/commit/push, rename, format, lint fix, read-and-summarize | Multi-file, reasoning, design, image analysis |

## Trigger examples

### Small tier (qwen3.6-35b-a3b)
- "grep across repo for usages"
- "glob for file locations"
- "delete these 3 files"
- "move foo.ts to bar/foo.ts"
- "commit and push"
- "rename this variable"
- "format this file"
- "read one file and summarize"

### Medium tier (qwen3.5-397b-a17b)
- "fix the login bug in auth.ts"
- "add validation to the form component"
- "write a README for this module"
- "refactor this function to use hooks"
- "analyze this screenshot" (delegated to `vision-worker` subagent)

### Heavy tier (glm-5.2)
- "plan a multi-step feature"
- "architect a new system"
- "threat-model an integration"
- "redesign the auth flow"
- "refactor the data layer across 5 files"
- "review this PR for security"
- "design the API schema for the new feature"
- "debug this race condition"

## Subagent routing

When spawning `Task` subagents:
- `shell` subagent → qwen3.6-35b-a3b (terminal ops, git, file moves)
- `explore` subagent → qwen3.5-397b-a17b (codebase search, pattern finding)
- `generalPurpose` subagent → qwen3.5-397b-a17b or glm-5.2 (depends on scope)
- `bugbot` / `security-review` → glm-5.2 (primary) or opus (alt for deep reasoning)
- `vision-worker` → qwen3.5-397b-a17b (image analysis — glm-5.2 cannot read images; see `vision-delegation` rule)

## Vision delegation rule

**glm-5.2 has no image capability.** Any task involving images (screenshots, mockups, wireframes, renders, diagrams) must delegate the image-analysis step to `vision-worker` subagent (qwen3.5-397b-a17b). Triggered by:
- Image file attached (png/jpg/jpeg/webp/gif/bmp/svg)
- User references image, screenshot, mockup, wireframe, render, diagram
- User says "look at this", "describe this", "implement this design", "fix this UI"
- Image path appears in conversation

See `vision-delegation.mdc` rule for full delegation protocol. Do NOT route image tasks to glm-5.2 directly.

## Escalation rules

1. Start at tier matching task's apparent complexity
2. If model fails twice or returns "I can't" → escalate one tier
3. Never de-escalate mid-task (context loss > savings)
4. After heavy task done → return to medium/small default
5. Image tasks: always medium tier via `vision-worker`, never escalate to glm-5.2
6. Preserve high-intelligence models: never route planning/architecture/security to medium or small — these are always heavy tier even if the prompt looks short

## Budget override

At 75% monthly budget → force small tier for everything except security/destructive ops
At 90% → small tier only, no exceptions except user explicit
At 100% → stop, switch to Auto/Composer pool (see user-rules-combined.md)

## Legacy fallback

If your LLM router doesn't expose qwen3.5-397b-a17b / qwen3.6-35b-a3b:
- Small → GLM 5.1
- Medium → Auto
- Heavy → Claude Sonnet, Composer 1.5, or Opus
- Vision → any vision-capable model if qwen3.5-397b-a17b unavailable
