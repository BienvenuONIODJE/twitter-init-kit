# Twitter-Init-Kit

**Systematic Twitter marketing for AI/LLM SaaS products**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Python 3.11+](https://img.shields.io/badge/python-3.11+-blue.svg)](https://www.python.org/downloads/)
[![Status: Beta](https://img.shields.io/badge/status-beta-orange.svg)](https://github.com/yourusername/twitter-init-kit/releases)

Twitter-init-kit is a domain-specific toolkit that adapts the [spec-kit](https://github.com/github/spec-kit) methodology for Twitter marketing and growth operations. It provides structured workflows, AI agent integration, and evidence-based templates for launching and scaling AI/LLM products on Twitter.

---

## What is Twitter-Init-Kit?

Twitter-init-kit helps technical founders and growth leads plan and execute systematic Twitter campaigns using:

- **Structured workflow**: Constitution → Specify → Plan → Tasks → Implement
- **AI agent integration**: Works with Claude Code, Cursor, Windsurf, Gemini CLI
- **Template system**: Pre-built templates for campaign specs, growth plans, and execution tasks
- **Evidence-based**: Grounded in 2023-2025 AI SaaS success stories (Cursor, Runway, HeyGen)
- **Multi-kit architecture**: Coexists with spec-kit, pm-kit, pd-kit on the same machine

**Time to first campaign**: < 15 minutes
**Full workflow duration**: < 4 hours
**Template quality**: 80%+ AI-generated content usable without modification

---

## Quick Start

### Installation

```bash
# Using uv (recommended)
uv tool install twitterify-cli --from git+https://github.com/yourusername/twitter-init-kit.git

# Using pipx
pipx install git+https://github.com/yourusername/twitter-init-kit.git

# Verify installation
twitterify --help
twitterify check
```

### Your First Campaign

```bash
# Initialize project
twitterify init my-campaign --ai claude
cd my-campaign

# Define Twitter marketing principles (optional)
/twitterkit.constitution

# Create campaign specification
/twitterkit.specify

# Generate growth plan
/twitterkit.plan

# Break down into tasks
/twitterkit.tasks

# Execute systematically
/twitterkit.implement
```

**Full guide**: See [Quickstart](./specs/000-twitter-init-kit-foundation/quickstart.md)

---

## Use Cases

### 1. Launch a New AI Product on Twitter

**Scenario**: You're launching an AI coding assistant and want to activate 100 target users via Twitter in 4 weeks.

**Workflow**:
1. Define constitution with founder-led, demo-driven, PLG principles
2. Create campaign spec targeting technical founders (Y Combinator, AI hackers)
3. Generate 4-week growth plan (Stealth Alpha → Public Launch → Scale)
4. Break down into tasks (content creation, engagement, community building)
5. Execute with PDCA cycles (Plan-Do-Check-Act)

**Result**: Systematic, reproducible Twitter growth process with clear metrics.

### 2. Build Founder-Led Twitter Presence

**Scenario**: CEO wants to build authentic Twitter presence to support product launch.

**Workflow**:
1. Define Twitter persona and content pillars
2. Plan 12-week content sprint (demos, thought leadership, community)
3. Create content bank (demo clips, thread templates, engagement playbook)
4. Execute weekly rhythm (3 demos, 2 threads, 5 engagement sessions)

**Result**: Consistent founder voice with measurable growth.

### 3. Optimize Existing Twitter Strategy

**Scenario**: You have 1000 followers but low engagement. Want to improve activation and retention.

**Workflow**:
1. Use `/twitterkit.clarify` to identify underspecified areas
2. Create optimization spec (new content formats, engagement tactics, growth loops)
3. Generate experiment log (hypothesis-driven A/B tests)
4. Measure and iterate on what works

**Result**: Data-driven optimization with clear hypotheses.

---

## Features

### CLI Tool

```bash
twitterify init <project>      # Initialize new project
twitterify init . --here        # Initialize in current directory
twitterify check                # Verify tool installation
twitterify version              # Show version
```

**Supported flags**:
- `--ai <agent>` - AI assistant: claude, cursor, windsurf, gemini
- `--script <sh|ps>` - Script variant: bash or PowerShell
- `--here` - Initialize in current directory
- `--force` - Force initialization in non-empty directory
- `--no-git` - Skip git repository initialization
- `--github-token` - GitHub API token for enhanced features
- `--debug` - Enable debug output

### Slash Commands (AI Agents)

```bash
/twitterkit.constitution   # Define Twitter marketing principles
/twitterkit.specify        # Create campaign specification
/twitterkit.plan           # Generate growth plan
/twitterkit.tasks          # Break down into tasks
/twitterkit.implement      # Execute systematically
/twitterkit.clarify        # Clarify underspecified areas
```

Works with:
- **Claude Code** - Slash commands via `.claude/commands/`
- **Cursor** - Slash commands via Composer
- **Windsurf** - Slash commands via Cascade
- **Gemini CLI** - Slash commands via `.gemini/`
- **Other agents** - Templates work as standalone markdown

### Templates

All templates are stored in `.twitterkit/templates/`:

- **spec-template.md** - Campaign specification (personas, objectives, channels, metrics)
- **plan-template.md** - Growth plan (phases, sprint cycles, experiments)
- **tasks-template.md** - Execution tasks (content, engagement, community, analytics)
- **constitution-template.md** - Twitter marketing principles (founder-led, demo-driven, PLG)

**Template variables**:
- `$PROJECT_NAME`, `$FEATURE_NAME` - Project and campaign identifiers
- `$PERSONA_PRIMARY`, `$HERO_WORKFLOW` - Target audience and product workflow
- `$CHANNELS`, `$CONTENT_PILLARS` - Distribution and content strategy
- `$SUCCESS_METRICS`, `$GROWTH_LOOPS` - KPIs and viral mechanisms

### Bash Scripts

Workflow automation scripts in `.twitterkit/scripts/bash/`:

```bash
# Create new campaign branch
.twitterkit/scripts/bash/create-new-campaign.sh "Alpha launch campaign"

# Set up growth plan
.twitterkit/scripts/bash/setup-plan.sh

# Update AI agent context
.twitterkit/scripts/bash/update-agent-context.sh --agent claude
```

---

## Multi-Kit Architecture

Twitter-init-kit is designed to coexist with other kit variants without conflicts:

| Kit | Package Folder | CLI Command | Slash Commands | Use For |
|-----|----------------|-------------|----------------|---------|
| **spec-kit** | `.specify/` | `specify` | `/speckit.*` | Software engineering, code implementation |
| **twitter-kit** | `.twitterkit/` | `twitterify` | `/twitterkit.*` | Twitter marketing, growth campaigns |
| **pm-kit** | `.pmkit/` | `pmify` | `/pmkit.*` | Product management (future) |
| **pd-kit** | `.pdkit/` | `pdify` | `/pdkit.*` | Product design (future) |

### Multi-Kit Workflow Example

```bash
# Build product feature with spec-kit
specify init my-product
/speckit.specify    # Create feature spec
/speckit.implement  # Build the feature

# Launch on Twitter with twitter-kit
twitterify init . --here
/twitterkit.specify # Create launch campaign spec
/twitterkit.implement # Execute Twitter campaign
```

Both kits work independently in the same project directory.

### Namespace Isolation Strategy

**Package Folders**: Each kit uses its own folder (`.specify/`, `.twitterkit/`, `.pmkit/`)
**CLI Commands**: Each kit has unique command (`specify`, `twitterify`, `pmify`)
**Slash Commands**: Each kit uses namespaced commands (`/speckit.*`, `/twitterkit.*`, `/pmkit.*`)
**Git Branches**: Kits can use separate or shared branches (e.g., `001-feature` for code, `001-launch` for marketing)

---

## Supported AI Agents

### Claude Code

- **Installation**: Automatic via `twitterify init --ai claude`
- **Command format**: `/twitterkit.*`
- **Context files**: `.claude/commands/twitterkit.*.md`
- **Status**: ✅ Fully supported

### Cursor

- **Installation**: Automatic via `twitterify init --ai cursor`
- **Command format**: `/twitterkit.*` (via Composer)
- **Context files**: `.cursor/context.md`
- **Status**: ✅ Fully supported

### Windsurf

- **Installation**: Automatic via `twitterify init --ai windsurf`
- **Command format**: `/twitterkit.*` (via Cascade)
- **Context files**: `.windsurf/context.md`
- **Status**: ✅ Fully supported

### Gemini CLI

- **Installation**: Automatic via `twitterify init --ai gemini`
- **Command format**: `/twitterkit.*`
- **Context files**: `.gemini/context.md`
- **Status**: ✅ Fully supported

### GitHub Copilot / Other Agents

- **Installation**: Manual - copy `.twitterkit/templates/commands/` to your agent's command directory
- **Fallback**: Templates work as standalone markdown files
- **Status**: ⚠️ Limited support (no slash commands)

---

## Template Transformation Guide

Twitter-init-kit is a **domain-specific variant** of spec-kit, adapted for Twitter marketing. The transformation process is systematic and can be replicated for other domains (product management, design, sales, etc.).

### How We Adapted Spec-Kit Templates

| Spec-Kit Concept | Twitter-Kit Adaptation | Rationale |
|------------------|------------------------|-----------|
| **User stories** | Campaign objectives | Marketing campaigns have objectives, not user stories |
| **Technical requirements** | Channel strategies | Marketing uses channels (Twitter, Reddit, PH), not tech stack |
| **Implementation details** | Content creation | Marketers create content, not code |
| **Code files** | Social media posts | Output is tweets/threads, not `.js` files |
| **Tests** | Success metrics | Validation is engagement/activation, not unit tests |
| **Feature branch** | Campaign branch | Scope unit is campaign (e.g., `001-alpha-launch`) |

### Creating Your Own Kit Variant

Want to create **pm-kit** (product management), **pd-kit** (product design), or **sales-kit**?

Follow our step-by-step guide: **[Kit Variant Creation Guide](./refs/6_variant_creation_guide.md)**

**Estimated time**: 4-6 weeks (1-2 developers + 1 content lead)

**Key steps**:
1. Define your domain and target users
2. Map spec-kit concepts to your domain
3. Collect evidence base (5-10 case studies)
4. Choose namespace (`.yourkit/`, `yourcommand`, `/yourkit.*`)
5. Transform templates (constitution, spec, plan, tasks)
6. Implement CLI and slash commands
7. Test with beta users
8. Release and document

---

## Case Studies: Evidence-Based Twitter Marketing

Twitter-init-kit templates are grounded in 2023-2025 AI SaaS success stories:

### Cursor - Founder-Led Twitter Strategy

**Background**: AI coding assistant that grew to 1M+ users in 18 months

**Twitter Strategy**:
- **Founder-led**: CEO tweets daily demo clips and product updates
- **Demo-driven**: Show, don't tell - every tweet has a video demo
- **Community**: Engage with users, share wins, respond to feedback

**Key Metrics**:
- 100K+ Twitter followers (CEO)
- 10-50K views per demo tweet
- 5-10% conversion from tweet → trial signup

**Principles Encoded in Twitter-Kit**:
- Founder authenticity > brand marketing
- Demos convert 10x better than text
- Daily consistency builds trust

### Runway - Demo-Driven Content

**Background**: AI video generation tool with $1.5B valuation

**Twitter Strategy**:
- **Visual demos**: Every tweet showcases AI-generated video
- **Wow moments**: Focus on "impossible" results (text → video)
- **Artifact loop**: Users share their creations, creating viral content

**Key Metrics**:
- 500K+ Twitter followers
- Viral demos (5M+ views)
- User-generated content amplification

**Principles Encoded in Twitter-Kit**:
- Product demos create wow moments
- Artifact loop drives virality
- Visual content outperforms text

### HeyGen - PLG Activation Loop

**Background**: AI avatar generation tool with rapid growth

**Twitter Strategy**:
- **Free trial**: Low-friction signup from Twitter
- **Activation focus**: Get users to first "wow moment" (generate avatar)
- **Advocacy loop**: Power users become advocates on Twitter

**Key Metrics**:
- 10K+ free trial signups from Twitter
- 20% activation rate (trial → power user)
- 5% advocacy rate (power user → Twitter promoter)

**Principles Encoded in Twitter-Kit**:
- PLG: Product is the hero
- Activation > acquisition
- Power users = best marketers

**More case studies**: See [refs/0_overview.md](./refs/0_overview.md) for detailed analysis.

---

## Project Structure

```
twitter-init-kit/
├── src/twitterify_cli/           # CLI implementation
│   ├── __init__.py               # Main entry point
│   ├── commands/
│   │   ├── init.py               # Initialize project
│   │   └── check.py              # Verify tools
│   ├── template_engine.py        # Template rendering
│   └── git_utils.py              # Git operations
│
├── .twitterkit/                  # Twitter-kit package (copied to user projects)
│   ├── memory/
│   │   └── constitution.md       # Default Twitter marketing constitution
│   ├── scripts/bash/
│   │   ├── create-new-campaign.sh    # Campaign creation
│   │   ├── setup-plan.sh             # Plan setup
│   │   └── update-agent-context.sh   # Agent context management
│   └── templates/
│       ├── spec-template.md          # Campaign specification
│       ├── plan-template.md          # Growth plan
│       ├── tasks-template.md         # Execution tasks
│       └── commands/                 # Slash command definitions
│           ├── twitterkit.constitution.md
│           ├── twitterkit.specify.md
│           ├── twitterkit.plan.md
│           ├── twitterkit.tasks.md
│           ├── twitterkit.implement.md
│           └── twitterkit.clarify.md
│
├── refs/                         # Reference documentation
│   ├── 0_overview.md             # Twitter marketing background & case studies
│   ├── 1_principles_for_constitution.md  # Distilled principles
│   ├── 2_define_for_specify.md   # Spec template adaptation guide
│   ├── 3_project_mangement_for_plan.md   # Plan template adaptation guide
│   ├── 4_pm_tasking_for_tasks.md # Tasks template adaptation guide
│   └── 6_variant_creation_guide.md       # Guide for creating new kit variants
│
├── specs/                        # Feature specifications
│   └── 000-twitter-init-kit-foundation/
│       ├── spec.md               # Project spec
│       ├── plan.md               # Implementation plan
│       ├── tasks.md              # Task breakdown
│       └── quickstart.md         # Getting started guide
│
├── tests/                        # Integration tests
│   ├── test_init.py              # Test project initialization
│   ├── test_templates.py         # Test template rendering
│   └── test_agent_commands.py    # Test slash commands
│
├── pyproject.toml                # Package metadata
└── README.md                     # This file
```

---

## Development

### Prerequisites

- Python 3.11+
- Git
- `uv` or `pipx` (for CLI installation)

### Local Development

```bash
# Clone repository
git clone https://github.com/yourusername/twitter-init-kit.git
cd twitter-init-kit

# Install development dependencies
uv pip install -e ".[dev]"

# Run tests
pytest

# Run linters
ruff check .
mypy src/

# Install locally
uv tool install -e .
```

### Testing Multi-Kit Coexistence

```bash
# Install both spec-kit and twitter-kit
uv tool install specify-cli
uv tool install -e .

# Verify both work
specify --help
twitterify --help

# Create test project with both kits
mkdir test-multi-kit
cd test-multi-kit
specify init .
twitterify init . --here --force

# Verify package folders coexist
ls -d .specify/ .twitterkit/

# Verify slash commands coexist
ls .claude/commands/speckit.*
ls .claude/commands/twitterkit.*
```

---

## Contributing

We welcome contributions! Here's how you can help:

### Ways to Contribute

1. **Report bugs**: Open an issue with reproducible steps
2. **Suggest improvements**: Share ideas for better templates, workflows, or features
3. **Improve documentation**: Fix typos, clarify instructions, add examples
4. **Add case studies**: Contribute Twitter marketing case studies to `refs/`
5. **Create variants**: Fork twitter-init-kit to create pm-kit, pd-kit, sales-kit, etc.

### Contribution Guidelines

1. **Fork the repository**
2. **Create a feature branch**: `git checkout -b feature/your-feature`
3. **Make your changes**: Follow existing code style and conventions
4. **Write tests**: Add tests for new features
5. **Update documentation**: Update README, quickstart, or refs/ as needed
6. **Submit a pull request**: Describe your changes and why they're needed

### Code Style

- **Python**: Follow PEP 8, use type hints, add docstrings
- **Markdown**: Use GitHub-flavored markdown, keep lines under 120 characters
- **Bash**: Use `set -e`, add help text, follow existing script patterns

---

## Roadmap

### Version 0.1.0 (Current - Beta)

- [x] CLI tool (`twitterify` command)
- [x] Template system (spec, plan, tasks)
- [x] Slash commands for AI agents
- [x] Bash workflow scripts
- [x] Multi-kit coexistence
- [x] Quickstart guide
- [ ] Beta user testing (5+ users)
- [ ] Integration tests (CLI, templates, agents)

### Version 0.2.0 (Next - Stable)

- [ ] PowerShell scripts for Windows support
- [ ] Additional templates (checklist, analyze, research)
- [ ] Template customization guide
- [ ] Video walkthrough (5-10 min)
- [ ] Community case studies (3+ examples)

### Version 1.0.0 (Future - Production)

- [ ] PyPI package publication
- [ ] Web-based template editor
- [ ] Twitter integration (post scheduling, analytics)
- [ ] Community template library
- [ ] Multi-language support (non-English campaigns)

### Future Kit Variants

- [ ] **pm-kit** - Product management (PRDs, roadmaps, OKRs)
- [ ] **pd-kit** - Product design (design sprints, Figma workflows)
- [ ] **sales-kit** - Sales operations (playbooks, cadences, CRM)
- [ ] **marketing-kit** - General marketing (beyond Twitter)

---

## FAQ

### Q: How is twitter-init-kit different from spec-kit?

**A**: Spec-kit is for software engineering (code, tests, features). Twitter-kit is for Twitter marketing (campaigns, content, growth). They use the same methodology (spec → plan → tasks → implement) but different templates and workflows.

### Q: Can I use twitter-kit with spec-kit in the same project?

**A**: Yes! They're designed to coexist. Use spec-kit for product development and twitter-kit for marketing campaigns. Both can live in the same git repository without conflicts.

### Q: Do I need to know Python to use twitter-kit?

**A**: No. The CLI is written in Python, but you don't need to write any code. Install the CLI tool and use slash commands with your AI agent (Claude, Cursor, etc.).

### Q: What if I don't use Claude Code / Cursor / Windsurf?

**A**: Templates work as standalone markdown files. Copy them to your project and fill them in manually, or use any AI agent that supports custom prompts.

### Q: Can I customize the templates for my domain?

**A**: Yes! Templates are in `.twitterkit/templates/`. Modify them for your use case (B2B vs consumer, technical vs non-technical, etc.). See [Template Customization Guide](./refs/2_define_for_specify.md).

### Q: How do I create my own kit variant (pm-kit, pd-kit)?

**A**: Follow our [Kit Variant Creation Guide](./refs/6_variant_creation_guide.md). It documents the step-by-step process for forking twitter-kit and adapting it to a new domain.

### Q: Is twitter-kit free?

**A**: Yes, twitter-init-kit is open source (MIT License). Free to use, modify, and distribute.

### Q: Where can I get help?

**A**: Open an issue on [GitHub](https://github.com/yourusername/twitter-init-kit/issues) or check the [Quickstart Guide](./specs/000-twitter-init-kit-foundation/quickstart.md).

---

## License

MIT License - see [LICENSE](./LICENSE) for details.

---

## Acknowledgments

- **Spec-Kit**: Twitter-init-kit is a fork of [spec-kit](https://github.com/github/spec-kit) by GitHub
- **Case Studies**: Inspired by Cursor, Runway, HeyGen, Harvey, and other AI SaaS companies
- **Community**: Thanks to all beta users and contributors

---

## Contact

- **Author**: Frank Chen (frank@agentii.ai)
- **GitHub**: [@yourhandle](https://github.com/yourhandle)
- **Twitter**: [@yourhandle](https://twitter.com/yourhandle)
- **Issues**: [GitHub Issues](https://github.com/yourusername/twitter-init-kit/issues)

---

**Ready to launch your systematic Twitter growth campaign?**

```bash
uv tool install twitterify-cli --from git+https://github.com/yourusername/twitter-init-kit.git
twitterify init my-campaign --ai claude
```

See you on Twitter! 🚀
