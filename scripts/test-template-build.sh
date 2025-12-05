#!/usr/bin/env bash
set -euo pipefail

# test-template-build.sh
# Validates twitter-kit template build against spec-kit reference
# Run this BEFORE committing to ensure the build will succeed

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(dirname "$SCRIPT_DIR")"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

ERRORS=0
WARNINGS=0

log_pass() { echo -e "${GREEN}✓${NC} $1"; }
log_fail() { echo -e "${RED}✗${NC} $1"; ((ERRORS++)); }
log_warn() { echo -e "${YELLOW}⚠${NC} $1"; ((WARNINGS++)); }
log_info() { echo -e "  $1"; }

echo "═══════════════════════════════════════════════════════════"
echo " Twitter-Kit Template Build Tests"
echo "═══════════════════════════════════════════════════════════"
echo ""

# Test 1: Source directory exists
echo "## Test 1: Source Directory Structure"
SOURCE_DIR="$REPO_ROOT/.twitterkit"

if [[ -d "$SOURCE_DIR" ]]; then
  log_pass "Source directory exists: .twitterkit/"
else
  log_fail "Source directory missing: .twitterkit/"
  exit 1
fi

# Test 2: Required subdirectories
for subdir in "memory" "templates" "templates/commands" "scripts/bash" "scripts/powershell"; do
  if [[ -d "$SOURCE_DIR/$subdir" ]]; then
    log_pass "Directory exists: .twitterkit/$subdir/"
  else
    log_fail "Directory missing: .twitterkit/$subdir/"
  fi
done
echo ""

# Test 3: Required command files (9 commands)
echo "## Test 2: Command Template Files"
REQUIRED_COMMANDS=(
  "twitterkit.specify.md"
  "twitterkit.plan.md"
  "twitterkit.tasks.md"
  "twitterkit.implement.md"
  "twitterkit.clarify.md"
  "twitterkit.analyze.md"
  "twitterkit.checklist.md"
  "twitterkit.taskstoissues.md"
  "twitterkit.constitution.md"
)

COMMANDS_DIR="$SOURCE_DIR/templates/commands"
for cmd in "${REQUIRED_COMMANDS[@]}"; do
  if [[ -f "$COMMANDS_DIR/$cmd" ]]; then
    log_pass "Command exists: $cmd"
  else
    log_fail "Command missing: $cmd"
  fi
done
echo ""

# Test 4: Required template files
echo "## Test 3: Template Files"
REQUIRED_TEMPLATES=(
  "spec-template.md"
  "plan-template.md"
  "tasks-template.md"
  "checklist-template.md"
  "agent-file-template.md"
)

TEMPLATES_DIR="$SOURCE_DIR/templates"
for tpl in "${REQUIRED_TEMPLATES[@]}"; do
  if [[ -f "$TEMPLATES_DIR/$tpl" ]]; then
    log_pass "Template exists: $tpl"
  else
    log_fail "Template missing: $tpl"
  fi
done
echo ""

# Test 5: Required bash scripts
echo "## Test 4: Bash Scripts"
REQUIRED_BASH_SCRIPTS=(
  "common.sh"
  "update-agent-context.sh"
  "create-new-campaign.sh"
  "setup-plan.sh"
  "check-prerequisites.sh"
)

BASH_DIR="$SOURCE_DIR/scripts/bash"
for script in "${REQUIRED_BASH_SCRIPTS[@]}"; do
  if [[ -f "$BASH_DIR/$script" ]]; then
    log_pass "Bash script exists: $script"
  else
    log_fail "Bash script missing: $script"
  fi
done
echo ""

# Test 6: Required PowerShell scripts
echo "## Test 5: PowerShell Scripts"
REQUIRED_PS_SCRIPTS=(
  "common.ps1"
  "update-agent-context.ps1"
  "create-new-campaign.ps1"
  "setup-plan.ps1"
  "check-prerequisites.ps1"
)

PS_DIR="$SOURCE_DIR/scripts/powershell"
for script in "${REQUIRED_PS_SCRIPTS[@]}"; do
  if [[ -f "$PS_DIR/$script" ]]; then
    log_pass "PowerShell script exists: $script"
  else
    log_fail "PowerShell script missing: $script"
  fi
done
echo ""

# Test 7: Constitution file
echo "## Test 6: Constitution File"
CONSTITUTION="$SOURCE_DIR/memory/constitution.md"
if [[ -f "$CONSTITUTION" ]]; then
  log_pass "Constitution exists: memory/constitution.md"
  
  # Check for twitter-kit branding
  if grep -q "twitter" "$CONSTITUTION" 2>/dev/null; then
    log_pass "Constitution references twitter"
  else
    log_warn "Constitution may not have twitter branding"
  fi
else
  log_fail "Constitution missing: memory/constitution.md"
fi
echo ""

# Test 8: Command files reference correct paths
echo "## Test 7: Command File Path References"
for cmd_file in "$COMMANDS_DIR"/*.md; do
  [[ -f "$cmd_file" ]] || continue
  filename=$(basename "$cmd_file")
  
  # Check for .specify/ references (should be .twitterkit/)
  if grep -q "\.specify/" "$cmd_file" 2>/dev/null; then
    log_fail "$filename contains .specify/ reference (should be .twitterkit/)"
  fi
  
  # Check for speckit. references (should be twitterkit.)
  if grep -q "speckit\." "$cmd_file" 2>/dev/null; then
    log_fail "$filename contains speckit. reference (should be twitterkit.)"
  fi
done
log_pass "No .specify/ or speckit. references found in commands"
echo ""

# Test 9: Try a test build
echo "## Test 8: Test Build (single variant)"
TEST_VERSION="v0.0.0-test"
export AGENTS="claude"
export SCRIPTS="sh"

BUILD_OUTPUT=$(cd "$REPO_ROOT" && bash .github/workflows/scripts/create-release-packages.sh "$TEST_VERSION" 2>&1) || {
  log_fail "Build failed"
  echo "$BUILD_OUTPUT"
  echo ""
  echo "═══════════════════════════════════════════════════════════"
  echo " Build Output (for debugging)"
  echo "═══════════════════════════════════════════════════════════"
  echo "$BUILD_OUTPUT"
  exit 1
}

ZIP_FILE="$REPO_ROOT/.genreleases/twitter-kit-template-claude-sh-${TEST_VERSION}.zip"
if [[ -f "$ZIP_FILE" ]]; then
  log_pass "Test ZIP created: $(basename "$ZIP_FILE")"
else
  log_fail "Test ZIP not created"
fi
echo ""

# Test 10: Verify ZIP contents
echo "## Test 9: ZIP Contents Validation"
if [[ -f "$ZIP_FILE" ]]; then
  TEMP_DIR=$(mktemp -d)
  trap "rm -rf $TEMP_DIR" EXIT
  
  unzip -q "$ZIP_FILE" -d "$TEMP_DIR"
  
  # Check .twitterkit/ structure
  if [[ -d "$TEMP_DIR/.twitterkit" ]]; then
    log_pass "ZIP contains .twitterkit/"
  else
    log_fail "ZIP missing .twitterkit/"
  fi
  
  # Check .claude/commands/
  if [[ -d "$TEMP_DIR/.claude/commands" ]]; then
    CMD_COUNT=$(ls -1 "$TEMP_DIR/.claude/commands"/*.md 2>/dev/null | wc -l | tr -d ' ')
    if [[ "$CMD_COUNT" -eq 9 ]]; then
      log_pass "ZIP contains 9 command files"
    else
      log_fail "ZIP contains $CMD_COUNT commands (expected 9)"
    fi
  else
    log_fail "ZIP missing .claude/commands/"
  fi
  
  # Check constitution
  if [[ -f "$TEMP_DIR/.twitterkit/memory/constitution.md" ]]; then
    log_pass "ZIP contains constitution"
  else
    log_fail "ZIP missing constitution"
  fi
  
  # Check bash scripts (sh variant)
  if [[ -d "$TEMP_DIR/.twitterkit/scripts/bash" ]]; then
    SCRIPT_COUNT=$(ls -1 "$TEMP_DIR/.twitterkit/scripts/bash"/*.sh 2>/dev/null | wc -l | tr -d ' ')
    if [[ "$SCRIPT_COUNT" -ge 3 ]]; then
      log_pass "ZIP contains $SCRIPT_COUNT bash scripts"
    else
      log_fail "ZIP contains only $SCRIPT_COUNT bash scripts (expected 5)"
    fi
  else
    log_fail "ZIP missing .twitterkit/scripts/bash/"
  fi
  
  # Check NO powershell in sh variant
  if [[ -d "$TEMP_DIR/.twitterkit/scripts/powershell" ]]; then
    log_fail "sh variant should NOT contain powershell scripts"
  else
    log_pass "sh variant correctly excludes powershell scripts"
  fi
fi
echo ""

# Cleanup test artifacts
rm -rf "$REPO_ROOT/.genreleases" 2>/dev/null || true

# Summary
echo "═══════════════════════════════════════════════════════════"
echo " Test Summary"
echo "═══════════════════════════════════════════════════════════"
if [[ $ERRORS -eq 0 ]]; then
  echo -e "${GREEN}ALL TESTS PASSED${NC} ($WARNINGS warnings)"
  exit 0
else
  echo -e "${RED}$ERRORS TESTS FAILED${NC} ($WARNINGS warnings)"
  echo ""
  echo "Fix the above errors before committing."
  exit 1
fi
