#!/usr/bin/env bash
set -e

# Agent Harness Installer
# Tool-agnostic: install into Cursor, Claude Code, or any AI IDE
# Usage: ./install.sh [--target cursor|claude] [--no-symlink]

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET="cursor"
NO_SYMLINK=false
TARGET_DIR=""
RULES_SUBDIR=""
SKILLS_SUBDIR=""

# Parse arguments
while [[ $# -gt 0 ]]; do
  case $1 in
    --target)
      TARGET="$2"
      shift 2
      ;;
    --no-symlink)
      NO_SYMLINK=true
      shift
      ;;
    *)
      echo "Unknown option: $1"
      echo "Usage: ./install.sh [--target cursor|claude] [--no-symlink]"
      exit 1
      ;;
  esac
done

# Set target directories based on tool
case $TARGET in
  cursor)
    TARGET_DIR="$HOME/.cursor"
    RULES_SUBDIR="rules"
    SKILLS_SUBDIR="skills"
    ;;
  claude)
    TARGET_DIR="$HOME/.claude"
    RULES_SUBDIR="rules"
    SKILLS_SUBDIR="skills"
    ;;
  *)
    echo "Unknown target: $TARGET"
    echo "Supported targets: cursor, claude"
    exit 1
    ;;
esac

RULES_DIR="$TARGET_DIR/$RULES_SUBDIR"
SKILLS_DIR="$TARGET_DIR/$SKILLS_SUBDIR"

echo "🔧 Installing Agent Harness for $TARGET..."
echo "Target directory: $TARGET_DIR"
echo ""

# Create directories if missing
mkdir -p "$RULES_DIR" "$SKILLS_DIR"

# Install rules
echo "Installing rules..."
for rule_file in "$REPO_ROOT/agent-rules/"*.mdc; do
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
for skill_dir in "$REPO_ROOT/agent-skills/"*/; do
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
echo "✅ Installation complete for $TARGET!"
echo ""
echo "Next steps:"
echo "1. Restart $TARGET to load the new rules and skills"
echo "2. Set up MCPs: see mcps/README.md for configuration"
echo "3. Read the Medium article: work/Content/medium-agent-harness-stack.md"
echo ""
echo "To update later: git pull && ./install.sh"
echo ""
echo "For other tools:"
echo "  ./install.sh --target claude  # Install for Claude Code"
echo ""
