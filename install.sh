#!/usr/bin/env bash
set -e

# Agent Harness Installer
# Symlinks curated rules and skills into ~/.cursor/
# Usage: ./install.sh [--no-symlink]

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CURSOR_DIR="$HOME/.cursor"
RULES_DIR="$CURSOR_DIR/rules"
SKILLS_DIR="$CURSOR_DIR/skills"

NO_SYMLINK=false

# Parse arguments
while [[ $# -gt 0 ]]; do
  case $1 in
    --no-symlink)
      NO_SYMLINK=true
      shift
      ;;
    *)
      echo "Unknown option: $1"
      echo "Usage: ./install.sh [--no-symlink]"
      exit 1
      ;;
  esac
done

# Create directories if missing
mkdir -p "$RULES_DIR" "$SKILLS_DIR"

echo "🔧 Installing Agent Harness..."
echo ""

# Install rules
echo "Installing rules..."
for rule_file in "$REPO_ROOT/rules/"*.mdc; do
  if [ -f "$rule_file" ]; then
    filename=$(basename "$rule_file")
    target="$RULES_DIR/$filename"
    
    if [ "$NO_SYMLINK" = true ]; then
      cp "$rule_file" "$target"
      echo "  ✓ Copied: $filename"
    else
      if [ -e "$target" ]; then
        echo "  ⚠ Skipping $filename (already exists)"
      else
        ln -s "$rule_file" "$target"
        echo "  ✓ Symlinked: $filename"
      fi
    fi
  fi
done

echo ""

# Install skills
echo "Installing skills..."
for skill_dir in "$REPO_ROOT/skills/"*/; do
  if [ -d "$skill_dir" ]; then
    skill_name=$(basename "$skill_dir")
    target="$SKILLS_DIR/$skill_name"
    
    if [ "$NO_SYMLINK" = true ]; then
      if [ -d "$target" ]; then
        echo "  ⚠ Skipping $skill_name (already exists)"
      else
        cp -r "$skill_dir" "$target"
        echo "  ✓ Copied: $skill_name"
      fi
    else
      if [ -e "$target" ]; then
        echo "  ⚠ Skipping $skill_name (already exists)"
      else
        ln -s "$skill_dir" "$target"
        echo "  ✓ Symlinked: $skill_name"
      fi
    fi
  fi
done

echo ""
echo "✅ Installation complete!"
echo ""
echo "Next steps:"
echo "1. Restart Cursor to load the new rules and skills"
echo "2. Set up MCPs: see mcps/README.md for configuration"
echo "3. Read the Medium article: work/Content/medium-agent-harness-stack.md"
echo ""
echo "To update later: git pull && ./install.sh"
echo ""
