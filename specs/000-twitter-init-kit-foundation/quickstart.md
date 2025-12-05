# Quickstart Guide: Twitter-Init-Kit

**Get started with systematic Twitter marketing for AI/LLM SaaS products in under 15 minutes**

---

## What is Twitter-Init-Kit?

Twitter-init-kit is a domain-specific toolkit that adapts the spec-driven development methodology for Twitter marketing and growth operations. It provides:

- **Structured workflow**: Constitution → Specify → Plan → Tasks → Implement
- **AI agent integration**: Works with Claude Code, Cursor, Windsurf, and other AI assistants
- **Template system**: Pre-built templates for campaign specs, growth plans, and execution tasks
- **Evidence-based**: Grounded in 2023-2025 AI SaaS success stories (Cursor, Runway, HeyGen)

**Use twitter-init-kit when:**
- Launching a new AI/LLM product on Twitter
- Planning a systematic Twitter growth campaign
- Building founder-led Twitter presence for developer tools
- Running demo-driven, product-led growth (PLG) strategies

**Don't use twitter-init-kit for:**
- Code implementation (use [spec-kit](https://github.com/github/spec-kit) instead)
- Product management (use pm-kit variant)
- UI/UX design (use pd-kit variant)

---

## Installation

### Prerequisites

- **Python 3.11+** - Check with `python --version`
- **Git** - Check with `git --version`
- **AI Agent** (optional but recommended) - Claude Code, Cursor, Windsurf, or Gemini CLI

### Install Twitter-Init-Kit CLI

Using `uv` (recommended):
```bash
uv tool install twitterify-cli --from git+https://github.com/yourusername/twitter-init-kit.git
```

Using `pipx`:
```bash
pipx install git+https://github.com/yourusername/twitter-init-kit.git
```

Using `pip`:
```bash
pip install git+https://github.com/yourusername/twitter-init-kit.git
```

### Verify Installation

```bash
twitterify --help
twitterify version
twitterify check
```

The `check` command will verify that you have all required tools installed and detect your AI agent.

---

## Quick Start: Your First Twitter Campaign

### Step 1: Initialize Project

Create a new project directory or initialize in an existing project:

```bash
# Create new project
twitterify init my-twitter-campaign --ai claude

# Or initialize in current directory
twitterify init . --here --ai cursor
```

**What this does:**
- Creates `.twitterkit/` package folder with templates, scripts, and constitution
- Installs slash commands to `.claude/commands/` (for Claude Code users)
- Creates `specs/` and `refs/` directory structure
- Generates `README.md` with quick start instructions
- Initializes git repository (unless `--no-git` flag used)

### Step 2: Define Your Twitter Marketing Principles (Optional)

If you have project-specific constraints or principles, create a constitution:

```bash
/twitterkit.constitution
```

**Or skip this step** and use the default Twitter marketing constitution provided in `.twitterkit/memory/constitution.md`.

### Step 3: Create Campaign Specification

Generate a Twitter-focused campaign spec:

```bash
/twitterkit.specify
```

**What you'll define:**
- **Target Personas**: Who you're reaching on Twitter (technical founders, growth leads, developers)
- **Campaign Objectives**: What you want to achieve (activation, virality, retention)
- **Hero Workflow**: Your product's "wow moment" to showcase
- **Channel Strategies**: Where you'll distribute content (Twitter, Reddit, Product Hunt)
- **Success Metrics**: How you'll measure success (engagement, signups, activation)

**Example output:** `specs/001-alpha-launch/spec.md`

### Step 4: Generate Growth Plan

Create a phased execution plan with sprint cycles:

```bash
/twitterkit.plan
```

**What you'll get:**
- **Twitter Context**: Current landscape, competitive positioning
- **Phased Launch Plan**: Stealth Alpha → Waitlist Beta → Public Launch
- **Sprint Cycle Structure**: 2-week cadences with objectives
- **Growth Loops**: Demo-to-inbound, artifact loop, template loop
- **Experiment Log**: Hypothesis-driven testing framework

**Example output:** `specs/001-alpha-launch/plan.md`

### Step 5: Break Down into Tasks

Generate executable task breakdown with ownership:

```bash
/twitterkit.tasks
```

**What you'll get:**
- **Phase-based tasks**: Setup → Stealth Alpha → Public Launch → Scale Machine
- **Role assignments**: Founder, Growth Lead, Content Lead, Product Eng
- **Checkpoints**: Exit criteria for each phase
- **Dependency tracking**: Task execution order

**Example output:** `specs/001-alpha-launch/tasks.md`

### Step 6: Execute Systematically

Run the implementation workflow with PDCA tracking:

```bash
/twitterkit.implement
```

**What this does:**
- Executes tasks systematically with Plan-Do-Check-Act cycles
- Tracks progress and metrics
- Generates experiment results
- Updates plans based on learnings

---

## Example Use Case: Launch a 4-Week Twitter Campaign

**Scenario**: You're launching an AI coding assistant and want to activate 100 target users via Twitter.

### Week 0: Setup (Constitution + Specify)

1. Initialize project:
   ```bash
   twitterify init cursor-twitter-launch --ai claude
   cd cursor-twitter-launch
   ```

2. Create constitution (optional):
   ```bash
   /twitterkit.constitution
   ```

   Define your principles:
   - Founder-led: CEO tweets daily
   - Demo-driven: Show, don't tell
   - PLG: Product is the hero, not marketing copy

3. Create campaign spec:
   ```bash
   /twitterkit.specify
   ```

   Define:
   - Primary persona: Technical founders (Y Combinator, AI hackers)
   - Hero workflow: "Code completion that actually works"
   - Success metric: 100 activations in 4 weeks

### Week 1: Planning (Plan + Tasks)

4. Generate growth plan:
   ```bash
   /twitterkit.plan
   ```

   Output: 4-week sprint plan with:
   - Week 1: Stealth alpha (outreach to 20 target founders)
   - Week 2-3: Demo loop (1 demo video/day)
   - Week 4: Public launch (Product Hunt, HN, Twitter threads)

5. Generate task breakdown:
   ```bash
   /twitterkit.tasks
   ```

   Output: 50+ actionable tasks including:
   - Setup Twitter profile and bio
   - Record 10 demo clips
   - Write 4 launch threads
   - Schedule outreach to 20 founders

### Week 2-4: Execution (Implement)

6. Execute systematically:
   ```bash
   /twitterkit.implement
   ```

   PDCA cycle:
   - **Plan**: This week's sprint goal (e.g., "Ship 7 demo tweets")
   - **Do**: Execute tasks (record demos, write threads, engage community)
   - **Check**: Review metrics (impressions, engagement, signups, activations)
   - **Act**: Adjust next sprint based on learnings

**End Result**:
- 100+ activations in 4 weeks
- Systematic, reproducible Twitter growth process
- Documentation for future campaigns

---

## Troubleshooting

### Issue: `twitterify: command not found`

**Cause**: CLI not installed or not in PATH

**Solution**:
```bash
# Verify installation
uv tool list | grep twitterify

# Reinstall if needed
uv tool install twitterify-cli --from git+https://github.com/yourusername/twitter-init-kit.git --force

# Check PATH (for pipx/uv)
echo $PATH | grep -o "[^:]*pipx[^:]*"
echo $PATH | grep -o "[^:]*\.local/bin[^:]*"
```

### Issue: Slash commands not working in Claude Code

**Cause**: Commands not installed in `.claude/commands/` directory

**Solution**:
```bash
# Reinitialize to install commands
twitterify init . --here --force --ai claude

# Verify commands installed
ls -la .claude/commands/twitterkit.*

# Expected output:
# .claude/commands/twitterkit.constitution.md
# .claude/commands/twitterkit.specify.md
# .claude/commands/twitterkit.plan.md
# .claude/commands/twitterkit.tasks.md
# .claude/commands/twitterkit.implement.md
# .claude/commands/twitterkit.clarify.md
```

### Issue: Git initialization fails

**Cause**: Directory already has .git or permission issues

**Solution**:
```bash
# Skip git initialization
twitterify init my-project --no-git

# Or manually initialize after
cd my-project
git init
git add .
git commit -m "Initial commit"
```

### Issue: Template rendering fails with "missing variable" error

**Cause**: Required variables not provided to template engine

**Solution**: Check the template file to see which variables are required. All variables use `$VAR_NAME` or `${VAR_NAME}` format.

Common variables:
- `$PROJECT_NAME` - Project directory name
- `$FEATURE_NAME` - Campaign identifier (e.g., "001-alpha-launch")
- `$PERSONA_PRIMARY` - Target persona
- `$HERO_WORKFLOW` - Main product workflow
- `$SUCCESS_METRICS` - Success criteria

### Issue: Both spec-kit and twitter-kit installed, commands conflict

**Cause**: Namespace collision (should not happen with proper setup)

**Solution**: Verify namespace isolation:
```bash
# Check package folders
ls -d .specify/ .twitterkit/  # Both should exist

# Check CLI commands
specify --help    # Should show spec-kit commands
twitterify --help # Should show twitter-kit commands

# Check slash commands
ls .claude/commands/speckit.*     # Spec-kit commands
ls .claude/commands/twitterkit.*  # Twitter-kit commands

# If conflicts persist, report issue:
# https://github.com/yourusername/twitter-init-kit/issues
```

---

## Multi-Kit Architecture

Twitter-init-kit is designed to coexist with other kit variants:

| Kit | Package Folder | CLI Command | Slash Commands | Use For |
|-----|----------------|-------------|----------------|---------|
| **spec-kit** | `.specify/` | `specify` | `/speckit.*` | Software engineering, code implementation |
| **twitter-kit** | `.twitterkit/` | `twitterify` | `/twitterkit.*` | Twitter marketing, growth campaigns |
| **pm-kit** | `.pmkit/` | `pmify` | `/pmkit.*` | Product management (future) |
| **pd-kit** | `.pdkit/` | `pdify` | `/pdkit.*` | Product design (future) |

**Example multi-kit workflow:**
1. Use `/speckit.specify` to define product feature
2. Use `/speckit.implement` to build the feature
3. Use `/twitterkit.specify` to plan Twitter launch campaign
4. Use `/twitterkit.implement` to execute marketing

All kits can coexist in the same project without conflicts.

---

## Supported AI Agents

Twitter-init-kit works with all major AI coding assistants:

### Claude Code
- **Command format**: `/twitterkit.*`
- **Installation**: Automatic via `twitterify init --ai claude`
- **Context file**: `.claude/commands/twitterkit.*.md`

### Cursor
- **Command format**: `/twitterkit.*` (via Composer)
- **Installation**: Automatic via `twitterify init --ai cursor`
- **Context file**: `.cursor/context.md`

### Windsurf
- **Command format**: `/twitterkit.*` (via Cascade)
- **Installation**: Automatic via `twitterify init --ai windsurf`
- **Context file**: `.windsurf/context.md`

### Gemini CLI
- **Command format**: `/twitterkit.*`
- **Installation**: Automatic via `twitterify init --ai gemini`
- **Context file**: `.gemini/context.md`

### GitHub Copilot / Other Agents
- **Fallback**: Templates work as standalone markdown files
- **Manual setup**: Copy `.twitterkit/templates/commands/` to your agent's command directory

---

## What's Next?

### Explore Advanced Workflows

- **Campaign Optimization**: Use `/twitterkit.clarify` to identify underspecified areas
- **Multi-Campaign Management**: Create multiple campaign branches (e.g., `001-alpha-launch`, `002-product-hunt`)
- **Automation Scripts**: Use `.twitterkit/scripts/bash/` for workflow automation

### Learn Template Customization

- Review `.twitterkit/templates/` to understand template structure
- Customize templates for your domain (e.g., B2B SaaS vs consumer AI)
- See `refs/` directory for evidence-based principles and case studies

### Join the Community

- Share your Twitter-kit campaigns and results
- Contribute template improvements
- Create your own kit variant (pm-kit, pd-kit, marketing-kit)

---

## Resources

- **GitHub Repository**: https://github.com/yourusername/twitter-init-kit
- **Spec-Kit (Parent Project)**: https://github.com/github/spec-kit
- **Reference Docs**: See `refs/` directory in your project
- **Issue Tracker**: Report bugs and request features

---

## Quick Reference

### CLI Commands

```bash
twitterify init <project>           # Initialize new project
twitterify init . --here            # Initialize in current directory
twitterify init --force             # Force init in non-empty directory
twitterify check                    # Verify tool installation
twitterify version                  # Show version
twitterify --help                   # Show help
```

### Slash Commands (AI Agents)

```bash
/twitterkit.constitution   # Define Twitter marketing principles
/twitterkit.specify        # Create campaign specification
/twitterkit.plan           # Generate growth plan
/twitterkit.tasks          # Break down into tasks
/twitterkit.implement      # Execute systematically
/twitterkit.clarify        # Clarify underspecified areas
```

### Bash Scripts

```bash
.twitterkit/scripts/bash/create-new-campaign.sh "Campaign name"
.twitterkit/scripts/bash/setup-plan.sh
.twitterkit/scripts/bash/update-agent-context.sh --agent claude
```

---

**Time to first campaign**: < 15 minutes
**Full workflow duration**: < 4 hours
**Template quality**: 80%+ AI-generated content usable without modification

Ready to launch your systematic Twitter growth campaign? Run `twitterify init my-campaign --ai claude` and get started.
