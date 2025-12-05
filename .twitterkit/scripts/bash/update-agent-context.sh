#!/usr/bin/env bash

set -e

# Script: update-agent-context.sh
# Purpose: Update AI agent context with Twitter-kit information
# Adapted from spec-kit's update-agent-context.sh for Twitter marketing domain

# Parse command line arguments
JSON_MODE=false
AGENT_TYPE="claude"

for arg in "$@"; do
    case "$arg" in
        --json)
            JSON_MODE=true
            ;;
        --agent)
            shift
            AGENT_TYPE="$1"
            shift
            ;;
        --help|-h)
            echo "Usage: $0 [--json] [--agent <type>]"
            echo "  --json         Output results in JSON format"
            echo "  --agent <type> Agent type: claude, cursor, windsurf (default: claude)"
            echo "  --help         Show this help message"
            exit 0
            ;;
    esac
done

# Find repository root
find_repo_root() {
    local dir="$PWD"
    while [ "$dir" != "/" ]; do
        if [ -d "$dir/.git" ] || [ -d "$dir/.twitterkit" ] || [ -d "$dir/.specify" ]; then
            echo "$dir"
            return 0
        fi
        dir="$(dirname "$dir")"
    done
    return 1
}

REPO_ROOT=$(find_repo_root)
if [ -z "$REPO_ROOT" ]; then
    echo "Error: Could not find repository root" >&2
    exit 1
fi

# Check if .twitterkit exists
if [ ! -d "$REPO_ROOT/.twitterkit" ]; then
    echo "Error: .twitterkit directory not found. Run 'twitterify init' first." >&2
    exit 1
fi

# Agent-specific context paths
case "$AGENT_TYPE" in
    claude|claude-code)
        CONTEXT_DIR="$REPO_ROOT/.claude"
        MEMORY_FILE="$CONTEXT_DIR/memory.md"
        ;;
    cursor)
        CONTEXT_DIR="$REPO_ROOT/.cursor"
        MEMORY_FILE="$CONTEXT_DIR/context.md"
        ;;
    windsurf)
        CONTEXT_DIR="$REPO_ROOT/.windsurf"
        MEMORY_FILE="$CONTEXT_DIR/context.md"
        ;;
    *)
        echo "Warning: Unknown agent type '$AGENT_TYPE', using default" >&2
        CONTEXT_DIR="$REPO_ROOT/.claude"
        MEMORY_FILE="$CONTEXT_DIR/memory.md"
        ;;
esac

# Create context directory if it doesn't exist
mkdir -p "$CONTEXT_DIR"

# Read constitution if it exists
CONSTITUTION=""
CONSTITUTION_FILE="$REPO_ROOT/.twitterkit/memory/constitution.md"
if [ -f "$CONSTITUTION_FILE" ]; then
    CONSTITUTION=$(cat "$CONSTITUTION_FILE")
fi

# Create/update memory file with Twitter-kit context
cat > "$MEMORY_FILE" <<EOF
# Twitter-Kit Context

## Project Information

This project uses **twitter-init-kit** for Twitter marketing and growth planning.

## Available Commands

- \`/twitterkit.constitution\` - Create/update project Twitter marketing principles
- \`/twitterkit.specify\` - Create Twitter campaign specification
- \`/twitterkit.plan\` - Generate Twitter growth plan
- \`/twitterkit.tasks\` - Break down into executable tasks
- \`/twitterkit.implement\` - Execute tasks systematically
- \`/twitterkit.clarify\` - Clarify ambiguous requirements

## Workflow

1. **Constitution**: Define Twitter marketing principles and guardrails
2. **Specify**: Create campaign spec (personas, objectives, growth loops, metrics)
3. **Plan**: Generate growth plan (phases, sprint cycles, experiments)
4. **Tasks**: Break down into executable tasks with ownership
5. **Implement**: Execute systematically with PDCA tracking

## Project Structure

- \`.twitterkit/\` - Twitter-kit package (templates, commands, scripts)
  - \`memory/constitution.md\` - Project principles
  - \`templates/\` - Campaign templates (spec, plan, tasks)
  - \`templates/commands/\` - Slash command definitions
  - \`scripts/bash/\` - Workflow automation scripts
- \`specs/\` - Campaign specifications
- \`refs/\` - Reference materials and research

## Key Principles

$CONSTITUTION

---
Last updated: $(date)
EOF

if [ "$JSON_MODE" = "true" ]; then
    printf '{"context_file":"%s","agent_type":"%s","status":"updated"}\n' "$MEMORY_FILE" "$AGENT_TYPE"
else
    echo "✓ Updated agent context at: $MEMORY_FILE"
    echo "Agent type: $AGENT_TYPE"
    echo ""
    echo "Your AI agent now has access to Twitter-kit commands and context."
fi
