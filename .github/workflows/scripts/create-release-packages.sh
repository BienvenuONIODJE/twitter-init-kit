#!/usr/bin/env bash
set -euo pipefail

# Better error reporting
trap 'echo "Error occurred on line $LINENO: $BASH_COMMAND"; exit 1' ERR

# create-release-packages.sh
# Generates Twitter-Kit template variants for all supported AI agents
# Packages contents from .twitterkit/ directory in repository
# Creates ZIPs that extract to .twitterkit/ folder (NOT .specify/)
#
# Usage: create-release-packages.sh <version>
#   version: Semantic version tag (e.g., v0.1.0)
#
# Environment variables:
#   AGENTS: Optional space/comma-separated list of agents (default: all 18)
#   SCRIPTS: Optional space/comma-separated list of script types (default: sh,ps)
#   GENRELEASES_DIR: Output directory (default: .genreleases)
#
# Outputs:
#   36 ZIP files (18 agents × 2 scripts) in $GENRELEASES_DIR/
#   Each ZIP contains .twitterkit/ directory structure

VERSION="${1:-}"
if [[ -z "$VERSION" ]]; then
  echo "Error: Version argument required" >&2
  echo "Usage: $0 <version>" >&2
  exit 1
fi

# Configuration
GENRELEASES_DIR="${GENRELEASES_DIR:-.genreleases}"
SOURCE_DIR=".twitterkit"

# All 18 supported AI agents
ALL_AGENTS=(
  claude
  cursor-agent
  windsurf
  gemini
  copilot
  qoder
  qwen
  opencode
  codex
  kilocode
  auggie
  codebuddy
  amp
  shai
  q
  bob
  roo
)

# Parse AGENTS env var if provided
if [[ -n "${AGENTS:-}" ]]; then
  IFS=', ' read -ra AGENT_ARRAY <<< "$AGENTS"
else
  AGENT_ARRAY=("${ALL_AGENTS[@]}")
fi

# Parse SCRIPTS env var if provided
if [[ -n "${SCRIPTS:-}" ]]; then
  IFS=', ' read -ra SCRIPT_ARRAY <<< "$SCRIPTS"
else
  SCRIPT_ARRAY=(sh ps)
fi

echo "═══════════════════════════════════════════════════════════"
echo " Twitter-Kit Template Package Generator"
echo "═══════════════════════════════════════════════════════════"
echo " Version: $VERSION"
echo " Source:  $SOURCE_DIR/"
echo " Output:  $GENRELEASES_DIR/"
echo " Agents:  ${#AGENT_ARRAY[@]} (${AGENT_ARRAY[*]})"
echo " Scripts: ${SCRIPT_ARRAY[*]}"
echo "═══════════════════════════════════════════════════════════"
echo ""

# Verify source directory exists
if [[ ! -d "$SOURCE_DIR" ]]; then
  echo "❌ Error: Source directory $SOURCE_DIR/ not found" >&2
  exit 1
fi

# Create output directory
mkdir -p "$GENRELEASES_DIR"
rm -rf "$GENRELEASES_DIR"/* || true

# Function to generate command files for an agent
# Transforms command templates to agent-specific format
generate_commands() {
  local agent=$1
  local file_extension=$2
  local args_format=$3
  local output_dir=$4
  local script_type=$5

  # Iterate through all command templates
  for template in "$SOURCE_DIR/templates/commands"/*.md; do
    [[ -f "$template" ]] || continue

    # Extract basename - command files are already named twitterkit.X.md
    local filename=$(basename "$template")
    local command_name="${filename%.md}"  # Remove .md extension

    # If already has twitterkit. prefix, use as-is, else add it
    if [[ "$command_name" == twitterkit.* ]]; then
      local output_file="$output_dir/${command_name}${file_extension}"
    else
      local output_file="$output_dir/twitterkit.${command_name}${file_extension}"
    fi

    # Transform template:
    # 1. Replace __AGENT__ placeholder with twitterkit.command (extract command part)
    # 2. Replace $ARGUMENTS with agent-specific format
    # 3. Update script paths based on script type
    local cmd_only="${command_name#twitterkit.}"  # Remove twitterkit. prefix if present
    sed -e "s/__AGENT__/twitterkit.${cmd_only}/g" \
        -e "s/\$ARGUMENTS/${args_format}/g" \
        -e "s#{SCRIPT}#${script_type}#g" \
        "$template" > "$output_file"
  done
}

# Function to build a single variant
build_variant() {
  local agent=$1
  local script=$2
  local version=$3

  local variant_name="twitter-kit-template-${agent}-${script}-${version}"
  local build_dir="$GENRELEASES_DIR/build-${variant_name}"

  echo "  Building ${agent} (${script})..."

  # Create build directory with .twitterkit/ structure
  mkdir -p "$build_dir/.twitterkit"

  # Copy source content from .twitterkit/ to build .twitterkit/
  # This ensures the ZIP extracts to .twitterkit/ directory
  cp -r "$SOURCE_DIR/memory" "$build_dir/.twitterkit/"
  cp -r "$SOURCE_DIR/templates" "$build_dir/.twitterkit/"

  # Copy script variant (bash or powershell)
  mkdir -p "$build_dir/.twitterkit/scripts"
  if [[ "$script" == "sh" ]]; then
    cp -r "$SOURCE_DIR/scripts/bash" "$build_dir/.twitterkit/scripts/"
  else
    cp -r "$SOURCE_DIR/scripts/powershell" "$build_dir/.twitterkit/scripts/"
  fi

  # Generate agent-specific commands
  # Different agents use different formats
  case "$agent" in
    claude)
      mkdir -p "$build_dir/.claude/commands"
      generate_commands "$agent" ".md" "\$ARGUMENTS" "$build_dir/.claude/commands" "$script"
      ;;

    cursor-agent)
      mkdir -p "$build_dir/.cursor/commands"
      generate_commands "$agent" ".md" "\$ARGUMENTS" "$build_dir/.cursor/commands" "$script"
      ;;

    windsurf)
      mkdir -p "$build_dir/.windsurf/workflows"
      generate_commands "$agent" ".md" "\$ARGUMENTS" "$build_dir/.windsurf/workflows" "$script"
      ;;

    gemini)
      mkdir -p "$build_dir/.gemini/commands"
      generate_commands "$agent" ".toml" "{{args}}" "$build_dir/.gemini/commands" "$script"
      ;;

    copilot)
      mkdir -p "$build_dir/.github/agents"
      mkdir -p "$build_dir/.github/prompts"
      generate_commands "$agent" ".agent.md" "\$ARGUMENTS" "$build_dir/.github/agents" "$script"
      # Also create .vscode/settings.json for Copilot
      mkdir -p "$build_dir/.vscode"
      echo '{"github.copilot.enable": {"*": true}}' > "$build_dir/.vscode/settings.json"
      ;;

    qoder)
      mkdir -p "$build_dir/.qoder/commands"
      generate_commands "$agent" ".md" "\$ARGUMENTS" "$build_dir/.qoder/commands" "$script"
      ;;

    qwen)
      mkdir -p "$build_dir/.qwen/commands"
      generate_commands "$agent" ".toml" "{{args}}" "$build_dir/.qwen/commands" "$script"
      ;;

    opencode)
      mkdir -p "$build_dir/.opencode/command"
      generate_commands "$agent" ".md" "\$ARGUMENTS" "$build_dir/.opencode/command" "$script"
      ;;

    codex)
      mkdir -p "$build_dir/.codex/prompts"
      generate_commands "$agent" ".md" "\$ARGUMENTS" "$build_dir/.codex/prompts" "$script"
      ;;

    kilocode)
      mkdir -p "$build_dir/.kilocode/workflows"
      generate_commands "$agent" ".md" "\$ARGUMENTS" "$build_dir/.kilocode/workflows" "$script"
      ;;

    auggie)
      mkdir -p "$build_dir/.augment/commands"
      generate_commands "$agent" ".md" "\$ARGUMENTS" "$build_dir/.augment/commands" "$script"
      ;;

    codebuddy)
      mkdir -p "$build_dir/.codebuddy/commands"
      generate_commands "$agent" ".md" "\$ARGUMENTS" "$build_dir/.codebuddy/commands" "$script"
      ;;

    amp)
      mkdir -p "$build_dir/.agents/commands"
      generate_commands "$agent" ".md" "\$ARGUMENTS" "$build_dir/.agents/commands" "$script"
      ;;

    shai)
      mkdir -p "$build_dir/.shai/commands"
      generate_commands "$agent" ".md" "\$ARGUMENTS" "$build_dir/.shai/commands" "$script"
      ;;

    q)
      mkdir -p "$build_dir/.amazonq/prompts"
      generate_commands "$agent" ".md" "\$ARGUMENTS" "$build_dir/.amazonq/prompts" "$script"
      ;;

    bob)
      mkdir -p "$build_dir/.bob/commands"
      generate_commands "$agent" ".md" "\$ARGUMENTS" "$build_dir/.bob/commands" "$script"
      ;;

    roo)
      mkdir -p "$build_dir/.roo/commands"
      generate_commands "$agent" ".md" "\$ARGUMENTS" "$build_dir/.roo/commands" "$script"
      ;;

    *)
      echo "    ⚠️  Unknown agent: $agent" >&2
      return 1
      ;;
  esac

  # Create ZIP archive
  local zip_file="$GENRELEASES_DIR/${variant_name}.zip"
  (cd "$build_dir" && zip -q -r "../$(basename "$zip_file")" .)

  # Clean up build directory
  rm -rf "$build_dir"

  # Calculate checksum (use sha256sum on Linux, shasum on macOS)
  local checksum
  if command -v sha256sum &>/dev/null; then
    checksum=$(sha256sum "$zip_file" | cut -d' ' -f1)
  else
    checksum=$(shasum -a 256 "$zip_file" | cut -d' ' -f1)
  fi
  local size=$(wc -c < "$zip_file" | tr -d ' ')

  echo "    ✓ ${variant_name}.zip (${size} bytes, sha256:${checksum:0:16}...)"
}

# Build all variants
total_variants=$((${#AGENT_ARRAY[@]} * ${#SCRIPT_ARRAY[@]}))
current=0

echo "Building $total_variants template variants..."
echo ""

for agent in "${AGENT_ARRAY[@]}"; do
  for script in "${SCRIPT_ARRAY[@]}"; do
    ((++current))
    echo "[${current}/${total_variants}]"
    build_variant "$agent" "$script" "$VERSION" || {
      echo "    ❌ Failed to build ${agent}-${script}" >&2
      continue
    }
    echo ""
  done
done

# Summary
echo "═══════════════════════════════════════════════════════════"
echo " Build Complete"
echo "═══════════════════════════════════════════════════════════"
echo " Templates generated: $(ls -1 "$GENRELEASES_DIR"/*.zip 2>/dev/null | wc -l | tr -d ' ')"
echo " Output directory: $GENRELEASES_DIR/"
echo " Total size: $(du -sh "$GENRELEASES_DIR" | cut -f1)"
echo "═══════════════════════════════════════════════════════════"
