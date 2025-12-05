#!/usr/bin/env bash

set -e

# Script: create-new-campaign.sh
# Purpose: Create a new Twitter marketing campaign branch and spec structure
# Adapted from spec-kit's create-new-feature.sh for Twitter marketing domain

JSON_MODE=false
SHORT_NAME=""
CAMPAIGN_NUMBER=""
ARGS=()
i=1

while [ $i -le $# ]; do
    arg="${!i}"
    case "$arg" in
        --json)
            JSON_MODE=true
            ;;
        --short-name)
            if [ $((i + 1)) -gt $# ]; then
                echo 'Error: --short-name requires a value' >&2
                exit 1
            fi
            i=$((i + 1))
            next_arg="${!i}"
            if [[ "$next_arg" == --* ]]; then
                echo 'Error: --short-name requires a value' >&2
                exit 1
            fi
            SHORT_NAME="$next_arg"
            ;;
        --number)
            if [ $((i + 1)) -gt $# ]; then
                echo 'Error: --number requires a value' >&2
                exit 1
            fi
            i=$((i + 1))
            next_arg="${!i}"
            if [[ "$next_arg" == --* ]]; then
                echo 'Error: --number requires a value' >&2
                exit 1
            fi
            CAMPAIGN_NUMBER="$next_arg"
            ;;
        --help|-h)
            echo "Usage: $0 [--json] [--short-name <name>] [--number N] <campaign_description>"
            echo ""
            echo "Options:"
            echo "  --json              Output in JSON format"
            echo "  --short-name <name> Provide a custom short name (2-4 words) for the campaign branch"
            echo "  --number N          Specify campaign number manually (overrides auto-detection)"
            echo "  --help, -h          Show this help message"
            echo ""
            echo "Examples:"
            echo "  $0 'Alpha launch Twitter campaign' --short-name 'alpha-launch'"
            echo "  $0 'Product hunt launch week' --number 3"
            exit 0
            ;;
        *)
            ARGS+=("$arg")
            ;;
    esac
    i=$((i + 1))
done

CAMPAIGN_DESCRIPTION="${ARGS[*]}"
if [ -z "$CAMPAIGN_DESCRIPTION" ]; then
    echo "Usage: $0 [--json] [--short-name <name>] [--number N] <campaign_description>" >&2
    exit 1
fi

# Find repository root
find_repo_root() {
    local dir="$1"
    while [ "$dir" != "/" ]; do
        if [ -d "$dir/.git" ] || [ -d "$dir/.twitterkit" ] || [ -d "$dir/.specify" ]; then
            echo "$dir"
            return 0
        fi
        dir="$(dirname "$dir")"
    done
    return 1
}

# Get highest campaign number from specs directory
get_highest_from_specs() {
    local specs_dir="$1"
    local highest=0

    if [ -d "$specs_dir" ]; then
        for dir in "$specs_dir"/*; do
            [ -d "$dir" ] || continue
            dirname=$(basename "$dir")
            number=$(echo "$dirname" | grep -o '^[0-9]\+' || echo "0")
            number=$((10#$number))
            if [ "$number" -gt "$highest" ]; then
                highest=$number
            fi
        done
    fi

    echo "$highest"
}

# Find repo root
REPO_ROOT=$(find_repo_root "$PWD")
if [ -z "$REPO_ROOT" ]; then
    echo "Error: Could not find repository root (no .git, .twitterkit, or .specify directory found)" >&2
    exit 1
fi

cd "$REPO_ROOT"

# Determine campaign number
if [ -n "$CAMPAIGN_NUMBER" ]; then
    NEXT_NUMBER="$CAMPAIGN_NUMBER"
else
    SPECS_DIR="$REPO_ROOT/specs"
    HIGHEST=$(get_highest_from_specs "$SPECS_DIR")
    NEXT_NUMBER=$((HIGHEST + 1))
fi

# Generate short name if not provided
if [ -z "$SHORT_NAME" ]; then
    # Simple slug generation: lowercase, replace spaces with dashes
    SHORT_NAME=$(echo "$CAMPAIGN_DESCRIPTION" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]/-/g' | sed 's/--*/-/g' | sed 's/^-//;s/-$//')
    # Limit to first 4 words
    SHORT_NAME=$(echo "$SHORT_NAME" | cut -d'-' -f1-4)
fi

# Format campaign number with leading zeros (e.g., 001)
FORMATTED_NUMBER=$(printf "%03d" "$NEXT_NUMBER")

# Create campaign directory name
CAMPAIGN_DIR_NAME="${FORMATTED_NUMBER}-${SHORT_NAME}"
CAMPAIGN_DIR="$SPECS_DIR/$CAMPAIGN_DIR_NAME"

# Check if campaign directory already exists
if [ -d "$CAMPAIGN_DIR" ]; then
    echo "Error: Campaign directory already exists: $CAMPAIGN_DIR" >&2
    exit 1
fi

# Create campaign directory structure
mkdir -p "$CAMPAIGN_DIR"

# Create placeholder files
touch "$CAMPAIGN_DIR/spec.md"
touch "$CAMPAIGN_DIR/plan.md"
touch "$CAMPAIGN_DIR/tasks.md"
touch "$CAMPAIGN_DIR/research.md"

# Create refs subdirectory if needed
mkdir -p "$CAMPAIGN_DIR/refs"

# Create git branch
BRANCH_NAME="$CAMPAIGN_DIR_NAME"
if git rev-parse --git-dir > /dev/null 2>&1; then
    if git rev-parse --verify "$BRANCH_NAME" > /dev/null 2>&1; then
        echo "Warning: Git branch '$BRANCH_NAME' already exists, skipping branch creation" >&2
    else
        git checkout -b "$BRANCH_NAME" 2>/dev/null || echo "Warning: Could not create git branch" >&2
    fi
fi

# Output results
if [ "$JSON_MODE" = true ]; then
    cat <<EOF
{
  "campaign_number": $NEXT_NUMBER,
  "campaign_dir": "$CAMPAIGN_DIR",
  "branch_name": "$BRANCH_NAME",
  "short_name": "$SHORT_NAME",
  "description": "$CAMPAIGN_DESCRIPTION"
}
EOF
else
    echo "✓ Created campaign: $CAMPAIGN_DIR_NAME"
    echo ""
    echo "Campaign directory: $CAMPAIGN_DIR"
    echo "Git branch: $BRANCH_NAME"
    echo ""
    echo "Next steps:"
    echo "  1. Run /twitterkit.specify to create your campaign spec"
    echo "  2. Run /twitterkit.plan to generate your growth plan"
    echo "  3. Run /twitterkit.tasks to break down execution"
    echo "  4. Run /twitterkit.implement to execute systematically"
fi
