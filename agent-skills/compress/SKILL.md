---
name: compress
description: "Snapshots session state into persistent session-notes.md."
---

# Compress Session

Persist this session's working memory to disk so compaction or a fresh start loses nothing.

## Steps

1. **Write/extend `session-notes.md`** at repo root (or per-task `tasks/<name>/SESSION.md`). Update in place — do not create duplicates.

2. **Capture, concisely:**
   - Decisions made + why
   - Exact file paths changed/created
   - Open questions / blockers
   - Next steps / TODO
   - Key constraints, error strings (verbatim), gotchas

3. **Trim then link:** replace large pasted content with file-path + line-range references. Keep under ~150 lines. Time-stamp entries.

4. **Tell the user where state lives** (`@session-notes.md`) and that the chat can now be compacted or a new session started pointing at that file.

## Format

- Bullets / table, no prose
- Links over pasted content
- Newest first or time-stamped sections for evolution tracking

## Anti-patterns

- Summarizing too late (context already compacted)
- Long prose — compress to bullets
- Pasting big file bodies — link instead

## Related

- Always-on rule: `session-compression.mdc` (same behavior, automatic triggers)
