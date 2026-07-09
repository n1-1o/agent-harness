# MCP Setup Guide

External deterministic API contracts that let the harness reach outside the editor without copy-paste.

## Setup

Copy your MCP server configurations into Cursor's settings. For each MCP below, add the corresponding configuration.

### Figma

Design ↔ code bridge. Read designs directly, push designs back, Code Connect maps design-system components to codebase components.

```json
{
  "mcpServers": {
    "figma": {
      "command": "npx",
      "args": ["@figma/mcp"],
      "env": {
        "FIGMA_API_KEY": "your-figma-api-key"
      }
    }
  }
}
```

### Vercel

Deployments, observability, project config.

```json
{
  "mcpServers": {
    "vercel": {
      "command": "npx",
      "args": ["@vercel/mcp"],
      "env": {
        "VERCEL_TOKEN": "your-vercel-token"
      }
    }
  }
}
```

### GitLab

Issues, MRs, CI. Spans rule + MCP: the `gitlab-workflow` rule defines conventional commits + `#issue` refs, the MCP executes them.

```json
{
  "mcpServers": {
    "gitlab": {
      "command": "npx",
      "args": ["@gitlab/mcp"],
      "env": {
        "GITLAB_TOKEN": "your-gitlab-token",
        "GITLAB_URL": "https://gitlab.com"
      }
    }
  }
}
```

### Browser Layer

In-IDE browser tab + raw CDP for testing & profiling. `browser-use` subagent as the delegate.

```json
{
  "mcpServers": {
    "browser-tools": {
      "command": "npx",
      "args": ["browser-tools-mcp"]
    }
  }
}
```

## Tool-Agnostic Notes

The MCP setup above uses Cursor-specific config format. For other tools (Claude Code, VS Code extensions, etc.), adapt the MCP configuration to the tool's equivalent integration pattern.

## Defense

These MCPs prevent "agent can't see the real system" escapes. The agent reads Figma directly, inspects CI directly. No transcription loss.

---

*See `../README.md` for the full harness overview.*