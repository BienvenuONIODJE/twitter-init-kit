#!/usr/bin/env bash

set -e

# Script: setup-plan.sh
# Purpose: Set up plan.md for a Twitter marketing campaign
# Adapted from spec-kit's setup-plan.sh for Twitter marketing domain

# Parse command line arguments
JSON_MODE=false
ARGS=()

for arg in "$@"; do
    case "$arg" in
        --json)
            JSON_MODE=true
            ;;
        --help|-h)
            echo "Usage: $0 [--json]"
            echo "  --json    Output results in JSON format"
            echo "  --help    Show this help message"
            exit 0
            ;;
        *)
            ARGS+=("$arg")
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

# Check if git repository exists
HAS_GIT="false"
if [ -d "$REPO_ROOT/.git" ]; then
    HAS_GIT="true"
fi

# Get current branch
CURRENT_BRANCH="main"
if [ "$HAS_GIT" = "true" ]; then
    CURRENT_BRANCH=$(git -C "$REPO_ROOT" branch --show-current 2>/dev/null || echo "main")
fi

# Determine feature/campaign directory
# If on a numbered branch (e.g., 001-alpha-launch), use that
# Otherwise use main campaign directory
SPECS_DIR="$REPO_ROOT/specs"

if [[ "$CURRENT_BRANCH" =~ ^[0-9]{3}- ]]; then
    # Extract campaign directory from branch name
    CAMPAIGN_DIR="$SPECS_DIR/$CURRENT_BRANCH"
else
    # Use a default campaign directory
    CAMPAIGN_DIR="$SPECS_DIR/000-twitter-init-kit-foundation"
fi

# Ensure the campaign directory exists
mkdir -p "$CAMPAIGN_DIR"

# Define file paths
CAMPAIGN_SPEC="$CAMPAIGN_DIR/spec.md"
CAMPAIGN_PLAN="$CAMPAIGN_DIR/plan.md"
CAMPAIGN_TASKS="$CAMPAIGN_DIR/tasks.md"

# Copy plan template if it exists
TEMPLATE="$REPO_ROOT/.twitterkit/templates/plan-template.md"
if [[ -f "$TEMPLATE" ]]; then
    if [ ! -f "$CAMPAIGN_PLAN" ]; then
        cp "$TEMPLATE" "$CAMPAIGN_PLAN"
        echo "✓ Copied plan template to $CAMPAIGN_PLAN"
    else
        echo "Plan file already exists at $CAMPAIGN_PLAN"
    fi
else
    echo "Warning: Plan template not found at $TEMPLATE" >&2
    # Create a basic plan file if template doesn't exist
    touch "$CAMPAIGN_PLAN"
fi

# Output results
if $JSON_MODE; then
    printf '{"CAMPAIGN_SPEC":"%s","CAMPAIGN_PLAN":"%s","CAMPAIGN_TASKS":"%s","CAMPAIGN_DIR":"%s","BRANCH":"%s","HAS_GIT":"%s"}\n' \
        "$CAMPAIGN_SPEC" "$CAMPAIGN_PLAN" "$CAMPAIGN_TASKS" "$CAMPAIGN_DIR" "$CURRENT_BRANCH" "$HAS_GIT"
else
    echo "Campaign directory: $CAMPAIGN_DIR"
    echo "Branch: $CURRENT_BRANCH"
    echo "Has Git: $HAS_GIT"
    echo ""
    echo "Next steps:"
    echo "  1. Edit plan.md to define your Twitter growth strategy"
    echo "  2. Run /twitterkit.tasks to generate execution tasks"
    echo "  3. Run /twitterkit.implement to execute systematically"
fi
