# MCP Setup Guide

This guide documents how to configure the MCPs (Model Context Protocol servers) that the agent harness uses to reach outside the editor.

**Note:** MCPs can't be auto-installed — each needs authentication tokens or configuration. Follow the steps below for each MCP you want to use.

---

## Figma MCP

**Purpose:** Design ↔ code bridge. Read designs directly, push designs back, Code Connect maps design-system components to codebase components.

**Install:**

1. Open Cursor Settings (Cmd+,)
2. Navigate to MCP servers
3. Add a new server:
   - Name: `Figma`
   - URL: `https://mcp.figma.com/mcp`
   - Headers: Add your Figma access token as `Authorization: Bearer <your-token>`

**Get token:** Go to [Figma Settings → Access tokens](https://www.figma.com/settings) and create a personal access token.

**Docs:** https://www.figma.com/developers/api

---

## Vercel MCP

**Purpose:** Deployments, observability, project config.

**Install:**

1. Open Cursor Settings (Cmd+,)
2. Navigate to MCP servers
3. Add a new server:
   - Name: `vercel`
   - URL: `https://mcp.vercel.com`

**Auth:** Uses your Vercel login session automatically.

**Docs:** https://vercel.com/docs/mcp

---

## GitLab MCP (Plugin)

**Purpose:** Issues, MRs, CI via Duo Agent Platform.

**Install:**

The GitLab MCP is installed as a Cursor plugin.

1. Open Cursor Settings (Cmd+,)
2. Navigate to MCP servers
3. Find `plugin-gitlab-GitLab` and enable it

**Auth:** Configure your GitLab token in Cursor settings or use the GitLab plugin's built-in auth flow.

**Docs:** https://docs.gitlab.com/ee/user/project/ai_features/

---

## Browser Layer

**Purpose:** In-IDE browser tab + raw CDP for testing & profiling.

### Option 1: cursor-ide-browser (built-in)

Already available in Cursor. No setup required.

### Option 2: AgentDesk browser-tools-mcp

**Install:**

```bash
npx -y @agentdeskai/browser-tools-mcp@latest
```

Add to `~/.cursor/mcp.json`:

```json
{
  "mcpServers": {
    "browser-tools": {
      "command": "npx",
      "args": ["-y", "@agentdeskai/browser-tools-mcp@latest"]
    }
  }
}
```

**Docs:** https://github.com/AgentDeskAI/browser-tools-mcp

---

## Example mcp.json

Copy this to `~/.cursor/mcp.json` as a starting point:

```json
{
  "mcpServers": {
    "Figma": {
      "url": "https://mcp.figma.com/mcp",
      "headers": {
        "Authorization": "Bearer YOUR_FIGMA_TOKEN"
      }
    },
    "vercel": {
      "url": "https://mcp.vercel.com"
    },
    "browser-tools": {
      "command": "npx",
      "args": ["-y", "@agentdeskai/browser-tools-mcp@latest"]
    }
  }
}
```

**Note:** GitLab is configured via Cursor plugin UI, not mcp.json.

---

## Troubleshooting

### MCP not showing up in Cursor

1. Restart Cursor after editing `mcp.json`
2. Check Cursor Settings → MCP servers to see if it's listed
3. Verify JSON syntax in `mcp.json`

### Authentication errors

- Figma: Regenerate token, ensure it has `file_read` and `file_write` scopes
- Vercel: Log in to Vercel in your browser first
- GitLab: Use the plugin's auth flow or set `GITLAB_TOKEN` env var

### MCP commands failing

- Check Node.js version (`node --version`) — should be >= 18
- Try running the command manually in terminal to see full error output

---

## Related

- Medium article: `work/Content/medium-agent-harness-stack.md`
- Repo README: `README.md`
- Main harness docs: `docs/DESIGN.md`
