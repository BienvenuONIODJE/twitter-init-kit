# Implementation Plan: Twitter-Init-Kit Foundation

**Branch**: `main` (meta-toolkit development) | **Date**: 2025-12-04 | **Spec**: [spec.md](./spec.md)
**Input**: Feature specification from `/specs/000-twitter-init-kit-foundation/spec.md`
**Constitution**: `.specify/memory/constitution.md` v1.0.0

---

## Summary

twitter-init-kit is a domain-specific variant of spec-kit that adapts the spec-driven development methodology for Twitter marketing and growth operations for AI/LLM SaaS products. This implementation plan outlines how to build the toolkit infrastructure (CLI, templates, scripts, agent integrations) while ensuring multi-kit coexistence with spec-kit, pm-kit, pd-kit, and future variants.

**Primary Deliverables:**
1. **CLI Tool** (`twitterify` command) for project initialization and management
2. **Template System** (`.twitterkit/` package with spec/plan/tasks templates adapted for Twitter marketing)
3. **Agent Integration** (slash commands `/twitterkit.*` for Claude Code, Cursor, etc.)
4. **Reference Documentation** (refs/ showing adaptation process for future kit creators)
5. **Multi-Kit Architecture** (namespace strategy enabling coexistence)

**Technical Approach:**
- **Fork & Adapt**: Fork spec-kit, selectively merge infrastructure, adapt domain layer
- **Package Isolation**: Use `.twitterkit/` folder, `twitterify` CLI, `/twitterkit.*` commands
- **Template Transformation**: Convert engineering templates (code, tests, features) → marketing templates (campaigns, content, growth loops)
- **Evidence-Based Content**: Ground all templates in 2023–2025 AI SaaS case studies (Cursor, Runway, HeyGen, Harvey, etc.)

---

## Technical Context

### Kit Infrastructure (Meta-Level)

**Project Type**: Meta-Toolkit (builds toolkits for others to use)
**Base Framework**: Forked from [spec-kit](https://github.com/github/spec-kit) infrastructure
**Language/Version**: Python 3.11+ (for CLI), Bash (for scripts), Markdown (for templates)
**Primary Dependencies**:
- `typer` (CLI framework)
- `rich` (terminal UI)
- `httpx` (HTTP client for GitHub API)
- `platformdirs` (cross-platform paths)
- `readchar` (interactive prompts)
- `truststore` (SSL/TLS)

**Package Structure**:
```
twitter-init-kit/
├── src/twitterify_cli/        # CLI implementation (Python)
├── .specify/                   # Spec-kit working copy (DO NOT MODIFY)
│   ├── memory/constitution.md  # Current constitution
│   ├── scripts/                # Spec-kit scripts
│   └── templates/              # Spec-kit templates
├── .twitterkit/                # twitter-init-kit package (TO BE CREATED)
│   ├── memory/                 # Twitter-kit constitution & memory
│   ├── scripts/                # Twitter-kit scripts (adapted from spec-kit)
│   └── templates/              # Twitter-kit templates (domain-adapted)
├── .claude/commands/           # Agent commands (twitterkit.* namespaced)
├── refs/                       # Reference docs & research
└── specs/                      # Feature specs (including this one)
```

**Testing**: Integration testing via real project initialization, template generation, agent command execution
**Target Platform**: Cross-platform (macOS, Linux, Windows via WSL)
**Distribution**: PyPI-installable via `uv tool install twitterify-cli`

### Domain Requirements (Twitter Marketing)

**Domain**: Twitter Marketing & Growth Operations for AI/LLM SaaS
**Target Users**: Technical founders, growth leads at AI SaaS companies, spec-kit community
**Core Workflows**:
1. **Constitution** → Define project-specific Twitter marketing principles
2. **Specify** → Create Twitter-focused specs (personas, campaigns, content strategy)
3. **Plan** → Generate Twitter launch/growth plans (channels, loops, metrics)
4. **Tasks** → Break down into executable tasks (content creation, engagement, community)
5. **Implement** → Execute campaigns with PDCA cycles

**Performance Goals**:
- Time-to-first-wow: <15 minutes from install to generated spec
- Full workflow: <4 hours from constitution to executable tasks
- Template quality: 80% AI-generated content usable without modification

**Constraints**:
- Must not break spec-kit functionality (coexistence)
- Must support multiple AI agents (Claude Code, Cursor, Windsurf, Gemini CLI, etc.)
- Must be self-documenting (other kit creators can follow this pattern)

**Scale/Scope**:
- Initial target: 100 engaged users (AI SaaS founders)
- Template library: 3 core templates (spec, plan, tasks) + optional templates (constitution, checklist, analyze)
- Slash commands: 6 core commands (/twitterkit.constitution, .specify, .plan, .tasks, .implement, .clarify)

---

## Constitution Check

*GATE: Must pass before Phase 0 research. Re-check after Phase 1 design.*

### From Twitter-Init-Kit Constitution v1.0.0

#### ✅ PASS: Foundation Principles (Section I)

- **Spec-Driven Methodology Inheritance**: ✅ Plan reuses spec → plan → tasks → implement workflow
- **Twitter Marketing Domain Principles**: ✅ Templates will encode founder-led, demo-driven, PLG principles
- **Evidence-Based Templates**: ✅ All content grounded in refs/ research (2023–2025 case studies)

#### ✅ PASS: Multi-Kit Architecture (Section II)

- **Package-Level Isolation**: ✅ `.twitterkit/` folder distinct from `.specify/`
- **CLI Command Naming**: ✅ `twitterify` command (not `specify` or `twitter`)
- **Slash Command Namespacing**: ✅ `/twitterkit.*` commands (not `/speckit.*` or generic `/plan`)
- **Agent Integration Consistency**: ✅ Reuses `.claude/commands/` pattern with namespace

**Verification**:
```bash
# Package isolation
ls -d .specify/ .twitterkit/  # Both should exist without conflict

# CLI naming
twitterify init test-project  # Should work
specify init test-project     # Should also work (spec-kit)

# Slash command namespacing
/twitterkit.plan              # Triggers twitter-kit workflow
/speckit.plan                 # Triggers spec-kit workflow
```

#### ✅ PASS: Template Adaptation (Section III)

- **Domain-Specific Templates**: ✅ Plan includes template transformation from code → marketing
- **Reference Material Structure**: ✅ refs/ documents show adaptation process for future kit creators

#### ✅ PASS: Quality Standards (Section VI)

- **Evidence-Based**: ✅ Templates reference refs/0_overview.md, refs/1_principles_for_constitution.md
- **Actionable Over Theoretical**: ✅ Plan includes concrete file paths, task breakdowns, execution steps
- **Constitution-Driven**: ✅ This plan explicitly checks compliance with constitution

#### ⚠️ NEEDS ATTENTION: Scope Discipline (Section V.1)

**In-Scope**:
- Twitter/X marketing strategy and operations ✅
- Content planning, creation, scheduling ✅
- Community building and engagement ✅
- Growth loops and viral mechanics ✅
- Metrics and analytics for activation/retention/growth ✅

**Out-of-Scope** (must NOT implement in this plan):
- Code implementation for Twitter products ❌ (use spec-kit)
- UI/UX design for Twitter products ❌ (use pd-kit)
- General product management ❌ (use pm-kit)
- Non-Twitter marketing channels ❌ (create dedicated kits)

**Gate Decision**: ✅ **PASS** - This plan focuses purely on toolkit infrastructure and Twitter marketing templates, no product implementation

---

## Project Structure

### Documentation (This Feature)

```text
specs/000-twitter-init-kit-foundation/
├── spec.md               # Feature specification (COMPLETE)
├── plan.md               # This file (IN PROGRESS)
├── research.md           # Phase 0 output (TO BE CREATED)
├── data-model.md         # Phase 1 output - Package/template structure (TO BE CREATED)
├── quickstart.md         # Phase 1 output - Getting started guide (TO BE CREATED)
└── contracts/            # Phase 1 output - CLI API contracts (TO BE CREATED)
    ├── cli-api.md        # CLI command interface
    ├── template-api.md   # Template variable interface
    └── agent-api.md      # Slash command interface
```

### Source Code (Repository Root)

```text
twitter-init-kit/
├── pyproject.toml                    # Package metadata (UPDATED)
├── src/twitterify_cli/               # CLI implementation
│   ├── __init__.py                   # Main entry point
│   ├── commands/                     # CLI commands
│   │   ├── init.py                   # twitterify init
│   │   └── check.py                  # twitterify check
│   ├── template_engine.py            # Template rendering
│   └── git_utils.py                  # Git operations
│
├── .twitterkit/                      # twitter-init-kit package (TO BE CREATED)
│   ├── memory/
│   │   └── constitution.md           # Default constitution template
│   ├── scripts/
│   │   └── bash/
│   │       ├── create-new-feature.sh # Adapted for campaigns
│   │       ├── setup-plan.sh         # Adapted for growth plans
│   │       └── update-agent-context.sh  # Adapted for Twitter context
│   └── templates/
│       ├── spec-template.md          # Twitter-focused spec (personas, campaigns)
│       ├── plan-template.md          # Twitter growth plan
│       ├── tasks-template.md         # Twitter execution tasks
│       └── commands/                 # Slash command definitions
│           ├── twitterkit.constitution.md
│           ├── twitterkit.specify.md
│           ├── twitterkit.plan.md
│           ├── twitterkit.tasks.md
│           ├── twitterkit.implement.md
│           └── twitterkit.clarify.md
│
├── .claude/commands/                 # Agent integration (SHARED)
│   ├── speckit.*.md                  # Spec-kit commands (existing)
│   └── twitterkit.*.md               # twitter-kit commands (TO BE CREATED)
│
├── refs/                             # Reference documentation (EXISTING)
│   ├── 0_overview.md                 # Twitter marketing background
│   ├── 1_principles_for_constitution.md  # Distilled principles
│   ├── 2_define_for_specify.md       # Spec template adaptation
│   ├── 3_project_mangement_for_plan.md   # Plan template adaptation
│   ├── 4_pm_tasking_for_tasks.md     # Tasks template adaptation
│   └── 5_more/                       # Tactical references
│
└── tests/                            # Integration tests (TO BE CREATED)
    ├── test_init.py                  # Test project initialization
    ├── test_templates.py             # Test template rendering
    ├── test_agent_commands.py        # Test slash commands
    └── fixtures/                     # Test fixtures
```

**Structure Decision**:
- **Single-project** structure (no backend/frontend split—this is a toolkit, not a web app)
- **Python package** at `src/twitterify_cli/` for CLI implementation
- **Template package** at `.twitterkit/` mirroring `.specify/` structure
- **Shared agent integration** at `.claude/commands/` enabling multi-kit workflows

---

## Complexity Tracking

> **Fill ONLY if Constitution Check has violations that must be justified**

**No complexity violations detected.** All constitution gates pass. This is a straightforward fork-and-adapt project with clear boundaries:
- Inherit spec-kit infrastructure ✅
- Adapt templates to Twitter marketing domain ✅
- Maintain multi-kit coexistence via namespacing ✅

---

## Phase 0: Research & Decision Making

### 0.1 Architecture Research

**Research Question 1: Multi-Kit Coexistence Strategy**
- **What we need to know**: How to enable multiple `*-kit` variants to coexist on same machine/project without conflicts
- **Research approach**:
  - Analyze spec-kit's current architecture (package structure, CLI commands, agent integration)
  - Document collision points (folder names, CLI commands, slash commands, Python package names)
  - Design namespace strategy for package folders, CLI names, slash commands
- **Deliverable**: Architecture decision document in `research.md`
- **Decision criteria**:
  - Users can install `specify`, `twitterify`, `pmify`, `pdify` simultaneously ✅
  - `.specify/`, `.twitterkit/`, `.pmkit/`, `.pdkit/` folders coexist in same project ✅
  - `/speckit.*` and `/twitterkit.*` commands work without ambiguity ✅

**Research Question 2: Template Transformation Methodology**
- **What we need to know**: Systematic process for adapting spec-kit templates (engineering domain) to twitter-kit templates (marketing domain)
- **Research approach**:
  - Map spec-kit template sections → twitter-kit equivalents
    - "User stories" → "Campaign objectives"
    - "Technical requirements" → "Channel strategies"
    - "Code implementation" → "Content creation"
    - "Test criteria" → "Success metrics"
  - Document transformation rules in refs/ for future kit creators
- **Deliverable**: Template transformation guide in `research.md`
- **Decision criteria**:
  - Every spec-kit section has a clear twitter-kit analog
  - Transformation is systematic (not ad-hoc)
  - Other kit creators can follow same pattern for their domains

**Research Question 3: Evidence Base for Twitter Templates**
- **What we need to know**: Which 2023–2025 AI SaaS Twitter case studies to reference in templates
- **Research approach**:
  - Review refs/0_overview.md, refs/1_principles_for_constitution.md
  - Identify patterns from Cursor, Runway, Pika, HeyGen, Harvey, Writer.ai case studies
  - Extract reusable tactics (founder-led, demo-driven, PLG loops, activation metrics)
- **Deliverable**: Evidence-based content guide in `research.md`
- **Decision criteria**:
  - Templates reference specific case studies (not generic advice)
  - Tactics are grounded in observable successes (not speculation)
  - Suitable for AI/LLM SaaS domain (not general social media)

### 0.2 CLI Implementation Research

**Research Question 4: CLI Framework & User Experience**
- **What we need to know**: Best practices for `twitterify` CLI design
- **Research approach**:
  - Review spec-kit's `specify` CLI implementation
  - Analyze user flows: `twitterify init`, `twitterify check`
  - Determine installation method: `uv tool install` vs. `pip install` vs. `pipx`
- **Deliverable**: CLI design doc in `research.md`
- **Decision criteria**:
  - Installation is one command (`uv tool install twitterify-cli --from git+...`)
  - UX matches spec-kit (familiar to existing users)
  - Supports multiple AI agents (Claude, Cursor, Windsurf, Gemini, etc.)

**Research Question 5: Agent Integration Patterns**
- **What we need to know**: How to support Claude Code, Cursor, Windsurf, Gemini CLI, etc.
- **Research approach**:
  - Review spec-kit's agent integration files (.claude/, .cursor/, etc.)
  - Document slash command definition format
  - Determine how agents discover and execute `/twitterkit.*` commands
- **Deliverable**: Agent integration guide in `research.md`
- **Decision criteria**:
  - Same agent integration pattern as spec-kit (consistency)
  - All major agents supported (Claude, Cursor, Windsurf, Gemini)
  - Commands are self-documenting (help text, argument descriptions)

### 0.3 Fork Maintenance Research

**Research Question 6: Upstream Sync Strategy**
- **What we need to know**: How to selectively merge spec-kit improvements without breaking twitter-kit domain layer
- **Research approach**:
  - Identify "infrastructure" vs. "domain" layers in spec-kit
  - Define merge strategy: adopt infrastructure, reject domain changes
  - Document process for future kit creators
- **Deliverable**: Fork maintenance guide in `research.md`
- **Decision criteria**:
  - Clear separation between portable infrastructure and domain-specific content
  - Documented process for reviewing/merging spec-kit updates
  - Low maintenance burden (merge infrastructure improvements, ignore domain changes)

---

## Phase 1: Design & Implementation Planning

### 1.1 Package Structure Design (`data-model.md`)

**Entity 1: Kit Package Structure**
- **Name**: TwitterKitPackage
- **Location**: `.twitterkit/`
- **Components**:
  - `memory/constitution.md` (default Twitter marketing constitution)
  - `scripts/bash/` (adapted from spec-kit scripts)
  - `templates/` (domain-adapted templates)
  - `templates/commands/` (slash command definitions)
- **Validation Rules**:
  - Must mirror `.specify/` structure for consistency
  - Must use distinct namespace (`twitterkit` not `specify`)
  - Must be self-contained (no hard dependencies on `.specify/`)

**Entity 2: CLI Commands**
- **Name**: TwitterifyCLI
- **Commands**:
  - `twitterify init <project>` → Initialize project with .twitterkit/ package
  - `twitterify init . --force` → Initialize in current directory
  - `twitterify check` → Verify required tools (git, claude, cursor, etc.)
  - `twitterify --help` → Show help
  - `twitterify --version` → Show version
- **Validation Rules**:
  - Must not conflict with `specify` CLI
  - Must support same flags as `specify` (`--ai`, `--script`, `--no-git`, `--here`, `--force`, etc.)
  - Must update pyproject.toml entry point: `twitterify = "twitterify_cli:main"`

**Entity 3: Template Variables**
- **Name**: TemplateContext
- **Variables** (used in templates):
  - `$PROJECT_NAME` → Project name (e.g., "cursor-twitter-launch")
  - `$FEATURE_NAME` → Feature/campaign name (e.g., "001-alpha-launch")
  - `$PERSONA_PRIMARY` → Primary target persona
  - `$HERO_WORKFLOW` → Hero workflow description
  - `$SUCCESS_METRICS` → Success metrics list
  - `$CHANNELS` → Distribution channels (Twitter, Reddit, PH, etc.)
  - `$CONSTITUTION_PRINCIPLES` → Project-specific principles
- **Validation Rules**:
  - Variables must be clearly delimited (e.g., `${VAR}` or `$VAR`)
  - Template engine must validate all variables are provided
  - Missing variables must error (no silent failures)

**Entity 4: Slash Commands**
- **Name**: AgentCommand
- **Commands**:
  - `/twitterkit.constitution` → Generate/update constitution
  - `/twitterkit.specify` → Generate Twitter-focused spec.md
  - `/twitterkit.plan` → Generate Twitter growth plan.md
  - `/twitterkit.tasks` → Generate executable tasks.md
  - `/twitterkit.implement` → Execute tasks systematically
  - `/twitterkit.clarify` → Clarify underspecified areas (optional)
- **Implementation**: Each command is a markdown file in `.claude/commands/` with:
  - Description (what the command does)
  - Prompt template (instructions for AI agent)
  - Expected outputs (files to be created/updated)
- **Validation Rules**:
  - Command names must use `twitterkit` namespace (not `speckit` or generic)
  - Commands must reference correct package folder (`.twitterkit/` not `.specify/`)
  - Commands must be self-contained (all necessary context in command file)

### 1.2 API Contracts (`contracts/`)

**Contract 1: CLI API** (`cli-api.md`)

```bash
# twitterify init
Usage: twitterify init [PROJECT_NAME] [OPTIONS]

Initialize a new twitter-init-kit project.

Arguments:
  PROJECT_NAME  Name of project directory to create (or '.' for current dir)

Options:
  --ai TEXT          AI assistant: claude, gemini, cursor-agent, windsurf, etc.
  --script TEXT      Script variant: sh (bash/zsh) or ps (PowerShell)
  --ignore-agent-tools  Skip AI agent tool checks
  --no-git           Skip git repository initialization
  --here             Initialize in current directory (same as PROJECT_NAME='.')
  --force            Force initialization in non-empty directory
  --skip-tls         Skip SSL/TLS verification (not recommended)
  --debug            Enable debug output
  --github-token TEXT  GitHub token for API requests

Examples:
  twitterify init my-campaign
  twitterify init . --ai claude
  twitterify init --here --force --ai cursor-agent
```

**Contract 2: Template API** (`template-api.md`)

```markdown
# Template Variable Interface

All twitter-init-kit templates support these variables:

## Project Context
- $PROJECT_NAME: Project directory name
- $FEATURE_NAME: Feature/campaign identifier (e.g., "001-alpha-launch")
- $FEATURE_BRANCH: Git branch name (e.g., "001-alpha-launch")

## Domain Context (Twitter Marketing)
- $PERSONA_PRIMARY: Primary target persona (role, context, Twitter behavior)
- $PERSONA_SECONDARY: Secondary persona (optional)
- $HERO_WORKFLOW: Main product workflow to showcase
- $IRREFUTABLE_DEMO: Key demo clip or artifact
- $VALUE_PROP: One-line value proposition for Twitter bio/pinned tweet

## Strategy Context
- $CHANNELS: Distribution channels (Twitter, Reddit, Product Hunt, etc.)
- $CONTENT_PILLARS: Content themes/pillars (e.g., "thought leadership, demos, community")
- $GROWTH_LOOPS: Primary growth loops (e.g., "demo-to-inbound, artifact loop")
- $SUCCESS_METRICS: KPIs and success criteria

## Constitution Context
- $CONSTITUTION_PRINCIPLES: Project-specific marketing principles
- $CONSTRAINTS: Known constraints and risks
- $OUT_OF_SCOPE: Explicitly out-of-scope items

## Usage Example:
In spec-template.md:
```
# Feature Specification: $FEATURE_NAME

## Target Personas

### Primary Persona: $PERSONA_PRIMARY

### Hero Workflow: $HERO_WORKFLOW

## Success Metrics
$SUCCESS_METRICS
```
```

**Contract 3: Agent API** (`agent-api.md`)

```markdown
# Slash Command Interface

All `/twitterkit.*` commands follow this pattern:

## Command Definition Format

File: `.claude/commands/twitterkit.[command].md`

```markdown
# Command Description (one line, action verb)

[Detailed explanation of what this command does]

## Prerequisites
- Required files (e.g., constitution.md, spec.md)
- Required context (e.g., project must be initialized)

## Execution Steps
1. Step-by-step instructions for AI agent
2. Including which files to read
3. Which templates to use
4. Which outputs to generate

## Expected Outputs
- File path: description
- File path: description

## Validation
- How to verify command succeeded
- What errors might occur
```

## Available Commands

| Command | Prerequisites | Outputs | Description |
|---------|--------------|---------|-------------|
| `/twitterkit.constitution` | Project initialized | `.specify/memory/constitution.md` | Generate project Twitter marketing principles |
| `/twitterkit.specify` | Constitution | `specs/[feature]/spec.md` | Generate Twitter-focused specification |
| `/twitterkit.plan` | Spec | `specs/[feature]/plan.md`, `research.md` | Generate Twitter growth plan |
| `/twitterkit.tasks` | Plan | `specs/[feature]/tasks.md` | Generate executable task breakdown |
| `/twitterkit.implement` | Tasks | Executed tasks, metrics | Execute campaign systematically |
| `/twitterkit.clarify` | Spec | Updated spec with clarifications | Clarify underspecified areas |

## Multi-Kit Coexistence

Commands are namespaced to avoid conflicts:
- `/speckit.*` → Triggers spec-kit workflows (engineering)
- `/twitterkit.*` → Triggers twitter-kit workflows (marketing)
- `/pmkit.*` → Triggers pm-kit workflows (product management) - future
- `/pdkit.*` → Triggers pd-kit workflows (product design) - future

Agents determine which workflow to trigger based on command prefix.
```

### 1.3 Quickstart Guide (`quickstart.md`)

See separate document generated in Phase 1.

### 1.4 Agent Context Update

**Script**: `.specify/scripts/bash/update-agent-context.sh claude`

**Purpose**: Add twitter-init-kit context to agent memory files (e.g., `.claude/CLAUDE.md`)

**What to add**:
- twitter-init-kit is now installed (`.twitterkit/` package)
- Available `/twitterkit.*` commands and their purposes
- When to use twitter-kit vs. spec-kit (marketing vs. engineering)

**Format**:
```markdown
<!-- twitter-init-kit context - DO NOT MODIFY THIS SECTION -->
## twitter-init-kit (Twitter Marketing & Growth)

twitter-init-kit is a domain-specific variant of spec-kit for systematic Twitter marketing.

### Available Commands
- `/twitterkit.constitution` → Define Twitter marketing principles
- `/twitterkit.specify` → Create Twitter-focused spec (personas, campaigns)
- `/twitterkit.plan` → Generate Twitter growth plan
- `/twitterkit.tasks` → Break down into executable tasks
- `/twitterkit.implement` → Execute campaign systematically

### When to Use
- Use `/twitterkit.*` for Twitter marketing strategy, content planning, community growth
- Use `/speckit.*` for software engineering, code implementation, technical design
- Both kits can coexist in same project (e.g., use spec-kit for product, twitter-kit for launch)

### Package Location
- Templates: `.twitterkit/templates/`
- Scripts: `.twitterkit/scripts/`
- Constitution: `.specify/memory/constitution.md` (shared with spec-kit)
<!-- END twitter-init-kit context -->
```

---

## Phase 2: Implementation Workflow (Executed via `/speckit.tasks`)

**Note**: This plan document defines what to build, not how to build it task-by-task. The `/speckit.tasks` command will generate a detailed `tasks.md` with dependency-ordered tasks.

### High-Level Implementation Phases

**Phase 2.1: CLI Foundation**
- Update `pyproject.toml` with `twitterify` entry point ✅ (COMPLETE)
- Implement `twitterify init` command (fork from `specify init`)
- Implement `twitterify check` command (fork from `specify check`)
- Add unit tests for CLI commands

**Phase 2.2: Package Structure**
- Create `.twitterkit/` directory structure
- Copy and adapt `.specify/scripts/` → `.twitterkit/scripts/`
- Copy and adapt `.specify/templates/` → `.twitterkit/templates/`
- Replace all `specify` → `twitterkit` namespace references

**Phase 2.3: Template Transformation**
- Adapt `spec-template.md` for Twitter marketing domain (follow refs/2_define_for_specify.md)
- Adapt `plan-template.md` for Twitter growth plans (follow refs/3_project_mangement_for_plan.md)
- Adapt `tasks-template.md` for Twitter execution tasks (follow refs/4_pm_tasking_for_tasks.md)
- Create `constitution-template.md` with Twitter marketing principles

**Phase 2.4: Agent Integration**
- Create `.claude/commands/twitterkit.constitution.md`
- Create `.claude/commands/twitterkit.specify.md`
- Create `.claude/commands/twitterkit.plan.md`
- Create `.claude/commands/twitterkit.tasks.md`
- Create `.claude/commands/twitterkit.implement.md`
- Test all commands with Claude Code

**Phase 2.5: Documentation & Testing**
- Write quickstart.md (getting started guide)
- Write research.md (architecture decisions from Phase 0)
- Write data-model.md (package structure from Phase 1)
- Create integration tests (test full workflow from init → implement)
- Update README.md with twitter-init-kit usage

**Phase 2.6: Validation & Polish**
- Test multi-kit coexistence (install both `specify` and `twitterify`)
- Test on all supported agents (Claude Code, Cursor, Windsurf, Gemini CLI)
- Validate against constitution (re-run Constitution Check)
- Get feedback from 5 beta users (AI SaaS founders)

---

## Risks & Mitigation

### Risk 1: Breaking Spec-Kit Compatibility

**Risk**: Changes to shared infrastructure (`.specify/`, `.claude/`) break spec-kit functionality
**Likelihood**: Medium
**Impact**: High (breaks existing users)
**Mitigation**:
- **DO NOT modify** `.specify/` folder—it's a working copy
- **DO NOT modify** existing `.claude/commands/speckit.*` files
- **ONLY ADD** new `.claude/commands/twitterkit.*` files
- **Test coexistence**: Always test that `specify` CLI still works after `twitterify` installation

### Risk 2: Template Transformation Quality

**Risk**: Adapted templates are too generic (not Twitter-specific) or too prescriptive (not flexible)
**Likelihood**: Medium
**Impact**: Medium (users don't find value)
**Mitigation**:
- Ground all templates in refs/ research (Cursor, Runway, HeyGen case studies)
- Include placeholder text that guides users toward specificity
- Provide examples inline ("Example: Cursor's founder-led Twitter strategy...")
- Get feedback from 5 beta users before release

### Risk 3: Multi-Kit Namespace Collisions

**Risk**: Despite namespacing, conflicts occur (file paths, CLI commands, agent commands)
**Likelihood**: Low
**Impact**: High (breaks multi-kit coexistence)
**Mitigation**:
- Comprehensive integration testing with both kits installed
- Clear documentation of namespace strategy in README
- Automated tests that verify:
  - `specify` and `twitterify` CLIs work independently
  - `.specify/` and `.twitterkit/` folders coexist
  - `/speckit.*` and `/twitterkit.*` commands don't interfere

### Risk 4: Agent Support Fragmentation

**Risk**: Different agents have different slash command formats, breaking portability
**Likelihood**: Medium
**Impact**: Medium (limits adoption)
**Mitigation**:
- Follow spec-kit's agent integration patterns (consistency)
- Test on all major agents (Claude Code, Cursor, Windsurf, Gemini)
- Document agent-specific quirks in quickstart.md
- Provide fallback: templates work as standalone markdown even without agents

### Risk 5: Fork Maintenance Burden

**Risk**: Keeping twitter-init-kit in sync with spec-kit improvements becomes unsustainable
**Likelihood**: Medium
**Impact**: Medium (technical debt accumulates)
**Mitigation**:
- Document fork maintenance strategy in research.md
- Separate infrastructure (portable) from domain (Twitter-specific)
- Use selective merging: adopt infrastructure, reject domain changes
- Review spec-kit releases monthly, merge quarterly

---

## Success Criteria

### Technical Success

1. **Multi-Kit Coexistence**: ✅ Users can install and use both `specify` and `twitterify` without conflicts
2. **Template Quality**: ✅ 80%+ of AI-generated template content is usable without modification
3. **Agent Support**: ✅ All `/twitterkit.*` commands work on Claude Code, Cursor, and Windsurf
4. **Performance**: ✅ Time-to-first-wow <15 minutes, full workflow <4 hours
5. **Test Coverage**: ✅ Integration tests cover all critical paths (init → specify → plan → tasks)

### User Success

1. **Adoption**: ✅ 20+ beta users complete at least one full workflow (constitution → implement)
2. **Feedback**: ✅ 70%+ of beta users say they'd be "very disappointed" if twitter-init-kit went away (Sean Ellis test)
3. **Advocacy**: ✅ 5+ users publicly share their twitter-init-kit experience (tweets, blog posts)
4. **Extension**: ✅ 1+ community member forks twitter-init-kit to create pm-kit, pd-kit, or marketing-kit (validates meta-framework)

### Meta-Framework Success

1. **Documentation**: ✅ refs/ docs are clear enough that future kit creators can follow the pattern
2. **Reusability**: ✅ Constitution clearly defines how to create new *-kit variants
3. **Architecture**: ✅ Multi-kit coexistence strategy is validated and documented

---

## Next Steps

### Immediate (This Command)

1. ✅ **COMPLETE**: Generate this plan.md
2. **NEXT**: Generate research.md (Phase 0) with architecture decisions
3. **NEXT**: Generate data-model.md (Phase 1) with package structure
4. **NEXT**: Generate contracts/ (Phase 1) with API specifications
5. **NEXT**: Generate quickstart.md (Phase 1) with getting started guide
6. **STOP**: Return control to user (this command does NOT create tasks.md)

### Follow-Up (Manual)

7. **User Review**: Review generated plan, research, data-model, contracts, quickstart
8. **User Approval**: Confirm plan is correct, request changes if needed
9. **Run `/speckit.tasks`**: Generate executable tasks.md from this plan
10. **Run `/speckit.implement`**: Execute tasks systematically

---

## Appendix: Template Transformation Guide

### How to Adapt Spec-Kit Templates for Your Domain

This section documents the systematic process for transforming spec-kit templates (engineering domain) to twitter-kit templates (marketing domain). Future kit creators (pm-kit, pd-kit, etc.) can follow this same pattern.

#### Step 1: Identify Domain Mappings

| Spec-Kit Concept | twitter-Kit Mapping | Generalization for Other Kits |
|------------------|---------------------|-------------------------------|
| **User stories** | Campaign objectives | **Outcomes**: What you're trying to achieve |
| **Technical requirements** | Channel strategies | **Methods**: How you'll achieve outcomes |
| **Implementation details** | Content creation | **Execution**: Concrete actions to take |
| **Code files** | Social media posts | **Artifacts**: What you produce |
| **Tests** | Success metrics | **Validation**: How you know it worked |
| **Feature branch** | Campaign branch | **Scope**: Bounded work unit |

#### Step 2: Replace Section Headers

Example from spec-template.md:

**Spec-Kit** (Engineering):
```markdown
## User Scenarios & Testing *(mandatory)*
### User Story 1 - [Brief Title] (Priority: P1)
**Acceptance Scenarios**:
1. **Given** [initial state], **When** [action], **Then** [expected outcome]
```

**twitter-Kit** (Marketing):
```markdown
## Campaign Objectives & Success Criteria *(mandatory)*
### Campaign Objective 1 - [Brief Title] (Priority: P1)
**Success Scenarios**:
1. **Given** [campaign state], **When** [content posted], **Then** [expected engagement]
```

**Generalized Pattern** (Any Kit):
```markdown
## [Domain] Goals & Validation *(mandatory)*
### Goal 1 - [Brief Title] (Priority: P1)
**Validation Scenarios**:
1. **Given** [context], **When** [action], **Then** [outcome]
```

#### Step 3: Update Variable Names

| Spec-Kit Variable | twitter-Kit Variable | Purpose |
|-------------------|----------------------|---------|
| `$USER_PERSONA` | `$TWITTER_PERSONA` | Target audience |
| `$FEATURE_NAME` | `$CAMPAIGN_NAME` | Scope identifier |
| `$TECH_STACK` | `$CHANNELS` | Methods/tools |
| `$ACCEPTANCE_CRITERIA` | `$SUCCESS_METRICS` | Validation |

#### Step 4: Rewrite Example Content

**Spec-Kit Example**:
> "User Story 1: As a developer, I want to authenticate via OAuth so I can access protected resources."

**twitter-Kit Example**:
> "Campaign Objective 1: As a founder, I want to run a 4-week Twitter launch sprint so I can activate 100 target users."

**Pattern**:
> "[Domain] Goal 1: As a [role], I want to [action] so I can [outcome]."

#### Step 5: Ground in Domain Evidence

**Spec-Kit**:
> "Use TDD: Write tests first, then implement."

**twitter-Kit**:
> "Use demo-driven content: Record demos first, then write threads explaining them. (Evidence: Cursor grew to 1M+ users with founder-led demo threads.)"

**Pattern**:
> "Use [domain best practice]: [concrete action]. (Evidence: [case study])"

#### Step 6: Validate Adaptation

Checklist for validating your adapted templates:

- [ ] Every spec-kit section has a clear domain analog (no orphaned sections)
- [ ] Variable names reflect domain language (not generic terms)
- [ ] Examples are domain-specific (not copy-pasted from spec-kit)
- [ ] Evidence cited is domain-relevant (not software engineering case studies)
- [ ] Templates are actionable (users know what to fill in)
- [ ] Templates are self-documenting (inline help text and examples)

---

**Plan Status**: Ready for Phase 0 (Research) execution
**Next Command**: Generate `research.md` with architecture decisions
**Author**: Frank (frank@agentii.ai) via Claude Code + Spec-Kit
**Date**: 2025-12-04
**Version**: 1.0.0
