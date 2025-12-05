# Implementation Tasks: Twitter-Init-Kit Foundation

**Feature**: twitter-init-kit Foundation
**Branch**: `main` (meta-toolkit development)
**Date**: 2025-12-04
**Spec**: [spec.md](./spec.md) | **Plan**: [plan.md](./plan.md)

---

## Task Execution Methodology

This twitter-init-kit project is a **meta-toolkit** - we're building a toolkit for Twitter marketing, not implementing Twitter marketing itself. The tasks follow the spec-kit pattern but focus on toolkit infrastructure (CLI, templates, scripts, agent integration).

**Key Principles**:
1. **Multi-Kit Coexistence**: Ensure `.twitterkit/` package doesn't conflict with `.specify/`, `.pmfkit/`, or other variants
2. **Namespace Isolation**: `twitter_cli` CLI, `/twitterkit.*` commands, distinct from spec-kit
3. **Template Adaptation**: Transform engineering templates → Twitter marketing templates
4. **Evidence-Based**: Ground all templates in refs/ research (Cursor, Runway, HeyGen case studies)

**PDCA Loop** (Plan-Do-Check-Act):
- **Plan**: Design multi-kit architecture and template transformation strategy
- **Do**: Implement CLI, templates, agent integration
- **Check**: Test coexistence with spec-kit, validate template quality
- **Act**: Iterate based on beta user feedback

---

## Phase 1: Setup & Infrastructure (Foundation)

**Objective**: Establish the toolkit project structure and multi-kit architecture

### A. Project Structure Setup (Owner: Lead Dev)

- [x] T001 Verify pyproject.toml has correct `twitterify` entry point and package name `twitterify-cli`
- [x] T002 Create `.twitterkit/` package directory structure mirroring `.specify/`
- [x] T003 Create `.twitterkit/memory/` directory for constitution and memory files
- [x] T004 Create `.twitterkit/scripts/bash/` directory for adapted scripts
- [x] T005 Create `.twitterkit/templates/` directory for domain-adapted templates
- [x] T006 Create `.twitterkit/templates/commands/` directory for slash command definitions
- [x] T007 Create `src/twitterify_cli/` directory structure for CLI implementation

### B. Multi-Kit Architecture Validation (Owner: Lead Dev)

- [x] T008 Document namespace strategy in `specs/000-twitter-init-kit-foundation/research.md`
- [x] T009 Verify `.specify/` and `.twitterkit/` can coexist without conflicts
- [x] T010 Document CLI naming strategy: `specify` vs `twitterify` vs `pmify`
- [x] T011 Document slash command namespacing: `/speckit.*` vs `/twitterkit.*` vs `/pmkit.*`
- [ ] T012 Create architecture diagram showing multi-kit coexistence

### C. Development Tooling (Owner: Lead Dev)

- [x] T013 Set up Python development environment (Python 3.11+)
- [x] T014 Install dependencies: typer, rich, httpx, platformdirs, readchar, truststore
- [x] T015 Create `tests/` directory structure for integration tests
- [x] T016 Create `tests/fixtures/` directory for test data

---

## Phase 2: CLI Implementation (Core Infrastructure)

**Objective**: Build the `twitter_cli` CLI tool that mirrors spec-kit functionality

### A. CLI Core (Owner: Lead Dev)

- [ ] T017 Implement `src/twitter_cli/__init__.py` with main() entry point
- [ ] T018 [P] Implement `src/twitter_cli/commands/init.py` for `twitter_cli init` command
- [ ] T019 [P] Implement `src/twitter_cli/commands/check.py` for `twitter_cli check` command
- [ ] T020 Implement `src/twitter_cli/template_engine.py` for template rendering
- [ ] T021 Implement `src/twitter_cli/git_utils.py` for git operations

### B. CLI Features (Owner: Lead Dev)

- [ ] T022 [P] Implement `--ai` flag support (claude, cursor, windsurf, gemini, etc.)
- [ ] T023 [P] Implement `--script` flag support (sh vs ps)
- [ ] T024 [P] Implement `--here` and `--force` flags for current directory initialization
- [ ] T025 [P] Implement `--no-git` flag to skip git initialization
- [ ] T026 [P] Implement `--debug` flag for verbose output
- [ ] T027 [P] Implement `--github-token` flag for API authentication

### C. Template Engine (Owner: Lead Dev)

- [ ] T028 Implement variable substitution ($PROJECT_NAME, $FEATURE_NAME, etc.)
- [ ] T029 Implement template validation (ensure all variables provided)
- [ ] T030 Implement error handling for missing variables
- [ ] T031 Implement template caching for performance

---

## Phase 3: Template Adaptation (Twitter Marketing Domain)

**Objective**: Transform spec-kit engineering templates into Twitter marketing templates

### A. Constitution Template (Owner: Content Lead)

- [x] T032 Copy `.specify/memory/constitution.md` to `.twitterkit/memory/constitution.md` as base
- [x] T033 Adapt constitution for Twitter marketing domain (founder-led, demo-driven, PLG)
- [x] T034 Add Twitter-specific principles from `refs/1_principles_for_constitution.md`
- [x] T035 Ground principles in 2023-2025 case studies (Cursor, Runway, HeyGen)
- [x] T036 Add multi-kit architecture governance to constitution
- [x] T037 Add scope boundaries (in-scope: Twitter marketing, out-of-scope: code implementation)

### B. Spec Template (Owner: Content Lead)

- [x] T038 Copy `.specify/templates/spec-template.md` to `.twitterkit/templates/spec-template.md`
- [x] T039 Replace "User Stories" section with "Campaign Objectives" following `refs/2_define_for_specify.md`
- [x] T040 Replace "Technical Requirements" with "Channel Strategies & Content Strategy"
- [x] T041 Replace "Acceptance Criteria" with "Success Metrics" (engagement, activation, retention)
- [x] T042 Add "Twitter Personas" section (technical founders, growth leads, target audience)
- [x] T043 Add "Hero Workflow → Twitter Content" mapping section
- [x] T044 Add "Growth Loops" section (demo-to-inbound, artifact loop, template loop)
- [x] T045 Add "Twitter Narrative Type" section (positioning on Twitter)
- [x] T046 Update template variables: $PERSONA_PRIMARY, $HERO_WORKFLOW, $CHANNELS, $SUCCESS_METRICS

### C. Plan Template (Owner: Content Lead)

- [x] T047 Copy `.specify/templates/plan-template.md` to `.twitterkit/templates/plan-template.md`
- [x] T048 Replace "Technical Context" with "Twitter Context" following `refs/3_project_mangement_for_plan.md`
- [x] T049 Replace "Architecture" section with "Twitter Sprint Cycle" (2-week cadences)
- [x] T050 Add "Objectives & Strategy" section (All-Bound Engine, Sprint-Based Experimentation, Wow Loop)
- [x] T051 Add "Phased Launch & Activation Plan" section (Stealth Alpha, Waitlist Beta, Public Launch)
- [x] T052 Add "Growth Loops & Viral Mechanisms" section (Demo-to-Inbound, Artifact, Template)
- [x] T053 Add "Metrics & Measurement" section (activation, retention, virality, sentiment)
- [x] T054 Add "Experiment Log Template" section (hypothesis-driven testing)
- [x] T055 Update template variables: $CHANNELS, $CONTENT_PILLARS, $GROWTH_LOOPS

### D. Tasks Template (Owner: Content Lead)

- [x] T056 Copy `.specify/templates/tasks-template.md` to `.twitterkit/templates/tasks-template.md`
- [x] T057 Replace "Implementation Tasks" with "Twitter Execution Tasks" following `refs/4_pm_tasking_for_tasks.md`
- [x] T058 Add "Phase 1: Setup & Foundation" (profile, tooling, content bank)
- [x] T059 Add "Phase 2: Stealth Alpha" (outreach, growth engineering, content testing)
- [x] T060 Add "Phase 3: Public Launch" (launch day execution, post-launch momentum)
- [x] T061 Add "Phase 4: Scale Machine" (weekly recurring tasks, growth loop optimization)
- [x] T062 Add "Roles & Ownership" section (Founder, Growth Lead, Content Lead, Product Eng)
- [x] T063 Add "Checkpoints & Exit Criteria" section (Alpha → Launch → Scale gates)

---

## Phase 4: Slash Command Integration (Agent Workflow)

**Objective**: Create `/twitterkit.*` commands for AI coding agents

### A. Command Definitions (Owner: Lead Dev)

- [x] T064 [P] Create `.twitterkit/templates/commands/twitterkit.constitution.md` command definition
- [x] T065 [P] Create `.twitterkit/templates/commands/twitterkit.specify.md` command definition
- [x] T066 [P] Create `.twitterkit/templates/commands/twitterkit.plan.md` command definition
- [x] T067 [P] Create `.twitterkit/templates/commands/twitterkit.tasks.md` command definition
- [x] T068 [P] Create `.twitterkit/templates/commands/twitterkit.implement.md` command definition
- [x] T069 [P] Create `.twitterkit/templates/commands/twitterkit.clarify.md` command definition

### B. Command Implementation (Owner: Lead Dev)

- [ ] T070 Ensure each command references `.twitterkit/` package folder (not `.specify/`)
- [ ] T071 Ensure each command uses `twitterkit` namespace (not `speckit`)
- [ ] T072 Add prerequisites section to each command (required files, context)
- [ ] T073 Add execution steps section to each command (step-by-step AI agent instructions)
- [ ] T074 Add expected outputs section to each command (files to create/update)
- [ ] T075 Add validation section to each command (how to verify success)

### C. Command Installation (Owner: Lead Dev)

- [ ] T076 Update `twitter_cli init` to copy command files to user project's `.claude/commands/` directory
- [ ] T077 Implement namespace checking to avoid overwriting existing `/twitterkit.*` commands
- [ ] T078 Add command discovery help text (`twitter_cli --help` should list available commands)
- [ ] T079 Test command installation with Claude Code agent
- [ ] T080 Test command installation with Cursor agent
- [ ] T081 Test command installation with Windsurf agent

---

## Phase 5: Script Adaptation (Workflow Automation)

**Objective**: Adapt spec-kit bash scripts for Twitter marketing workflows

### A. Core Scripts (Owner: Lead Dev)

- [ ] T082 Copy `.specify/scripts/bash/create-new-feature.sh` to `.twitterkit/scripts/bash/create-new-campaign.sh`
- [ ] T083 Adapt `create-new-campaign.sh` to create campaign branches (e.g., `001-alpha-launch`)
- [ ] T084 Update script to reference `.twitterkit/templates/` instead of `.specify/templates/`
- [ ] T085 Copy `.specify/scripts/bash/setup-plan.sh` to `.twitterkit/scripts/bash/setup-plan.sh`
- [ ] T086 Adapt `setup-plan.sh` to check for Twitter-specific prerequisites
- [ ] T087 Copy `.specify/scripts/bash/update-agent-context.sh` to `.twitterkit/scripts/bash/update-agent-context.sh`
- [ ] T088 Adapt `update-agent-context.sh` to add Twitter-kit context to agent memory

### B. Script Integration (Owner: Lead Dev)

- [ ] T089 Update all scripts to use `.twitterkit/` namespace (not `.specify/`)
- [ ] T090 Update all scripts to check for `twitter_cli` CLI (not `specify`)
- [ ] T091 Test script execution on macOS
- [ ] T092 Test script execution on Linux
- [ ] T093 Create PowerShell equivalents for Windows support (`.twitterkit/scripts/ps/`)

---

## Phase 6: Documentation & Quickstart (User Onboarding)

**Objective**: Create comprehensive documentation for twitter-init-kit users

### A. Core Documentation (Owner: Content Lead)

- [ ] T094 Create `specs/000-twitter-init-kit-foundation/quickstart.md` with getting started guide
- [ ] T095 Document installation: `uv tool install twitter_cli --from git+...`
- [ ] T096 Document initialization: `twitter_cli init my-campaign --ai claude`
- [ ] T097 Document workflow: `/twitterkit.constitution` → `/twitterkit.specify` → `/twitterkit.plan` → `/twitterkit.tasks` → `/twitterkit.implement`
- [ ] T098 Add example use case: "Launch a 4-week Twitter campaign for AI SaaS product"
- [ ] T099 Add troubleshooting section (common errors, solutions)

### B. Reference Documentation (Owner: Content Lead)

- [ ] T100 [P] Finalize `refs/0_overview.md` with Twitter marketing background research
- [ ] T101 [P] Finalize `refs/1_principles_for_constitution.md` with distilled principles
- [ ] T102 [P] Finalize `refs/2_define_for_specify.md` with spec template adaptation guide
- [ ] T103 [P] Finalize `refs/3_project_mangement_for_plan.md` with plan template adaptation guide
- [ ] T104 [P] Finalize `refs/4_pm_tasking_for_tasks.md` with tasks template adaptation guide
- [ ] T105 Create `refs/6_variant_creation_guide.md` for future kit creators (pm-kit, pd-kit)

### C. README Updates (Owner: Content Lead)

- [ ] T106 Update root `README.md` with twitter-init-kit overview
- [ ] T107 Add "Multi-Kit Architecture" section explaining coexistence with spec-kit
- [ ] T108 Add "Supported AI Agents" section (Claude Code, Cursor, Windsurf, Gemini CLI)
- [ ] T109 Add "Template Transformation Guide" for creating new kit variants
- [ ] T110 Add case study examples (Cursor, Runway, HeyGen Twitter strategies)

---

## Phase 7: Testing & Validation (Quality Assurance)

**Objective**: Ensure toolkit works correctly and doesn't conflict with spec-kit

### A. Integration Tests (Owner: Lead Dev)

- [ ] T111 Create `tests/test_init.py` to test `twitter_cli init` command
- [ ] T112 Test initialization in new directory: `twitter_cli init test-project`
- [ ] T113 Test initialization in current directory: `twitter_cli init . --force`
- [ ] T114 Test agent selection: `twitter_cli init test-project --ai claude`
- [ ] T115 Test script selection: `twitter_cli init test-project --script ps`
- [ ] T116 Create `tests/test_templates.py` to test template rendering
- [ ] T117 Test template variable substitution ($PROJECT_NAME, $FEATURE_NAME)
- [ ] T118 Test missing variable error handling
- [ ] T119 Create `tests/test_agent_commands.py` to test slash commands
- [ ] T120 Test `/twitterkit.constitution` command execution
- [ ] T121 Test `/twitterkit.specify` command execution
- [ ] T122 Test `/twitterkit.plan` command execution

### B. Multi-Kit Coexistence Tests (Owner: Lead Dev)

- [ ] T123 Install both `specify` and `twitter_cli` CLIs on test machine
- [ ] T124 Verify both CLIs work independently without conflicts
- [ ] T125 Create test project with both `.specify/` and `.twitterkit/` folders
- [ ] T126 Verify `/speckit.*` and `/twitterkit.*` commands work without interference
- [ ] T127 Test agent context update script doesn't overwrite spec-kit context
- [ ] T128 Test git branch creation doesn't conflict between kits

### C. Template Quality Tests (Owner: Content Lead)

- [ ] T129 Generate test spec using `/twitterkit.specify` with sample input
- [ ] T130 Review generated spec for Twitter domain appropriateness
- [ ] T131 Verify spec includes personas, campaigns, growth loops, metrics
- [ ] T132 Generate test plan using `/twitterkit.plan` from test spec
- [ ] T133 Review generated plan for execution readiness
- [ ] T134 Verify plan includes sprint structure, growth loops, experiment log
- [ ] T135 Generate test tasks using `/twitterkit.tasks` from test plan
- [ ] T136 Review generated tasks for actionability and completeness
- [ ] T137 Verify tasks include phases, ownership, checkpoints, exit criteria

---

## Phase 8: Beta User Testing (Real-World Validation)

**Objective**: Get feedback from 5 AI SaaS founders using twitter-init-kit

### A. Beta Recruitment (Owner: Founder)

- [ ] T138 Identify 5 AI SaaS founders willing to test twitter-init-kit
- [ ] T139 Provide installation instructions and quickstart guide
- [ ] T140 Schedule onboarding calls (30 min each) to walk through workflow
- [ ] T141 Create feedback template (What worked? What didn't? What's missing?)

### B. Beta Execution (Owner: Beta Users + Founder)

- [ ] T142 Beta User 1: Complete constitution → spec → plan → tasks workflow
- [ ] T143 Beta User 2: Complete constitution → spec → plan → tasks workflow
- [ ] T144 Beta User 3: Complete constitution → spec → plan → tasks workflow
- [ ] T145 Beta User 4: Complete constitution → spec → plan → tasks workflow
- [ ] T146 Beta User 5: Complete constitution → spec → plan → tasks workflow
- [ ] T147 Collect feedback from all beta users (async via form + optional follow-up call)

### C. Iteration (Owner: Lead Dev + Content Lead)

- [ ] T148 Analyze feedback: What patterns emerge? What's confusing? What's missing?
- [ ] T149 Prioritize improvements: High-impact vs low-effort matrix
- [ ] T150 Implement critical fixes (broken commands, confusing templates)
- [ ] T151 Update documentation based on common questions
- [ ] T152 Re-test with 1-2 beta users to validate improvements

---

## Phase 9: Polish & Release Preparation (Final Touches)

**Objective**: Prepare for public release and community adoption

### A. Code Quality (Owner: Lead Dev)

- [ ] T153 Add type hints to all Python functions
- [ ] T154 Add docstrings to all public functions
- [ ] T155 Run linters (ruff, black, mypy)
- [ ] T156 Fix all linter warnings and type errors
- [ ] T157 Add error handling for edge cases
- [ ] T158 Add logging for debugging (optional --debug flag)

### B. Documentation Completeness (Owner: Content Lead)

- [ ] T159 Review all documentation for accuracy
- [ ] T160 Add screenshots/GIFs to quickstart guide
- [ ] T161 Create video walkthrough (5-10 min) showing full workflow
- [ ] T162 Add FAQ section to README
- [ ] T163 Add contributing guidelines for community contributions
- [ ] T164 Add code of conduct

### C. Release Assets (Owner: Founder)

- [ ] T165 Create GitHub release with version 0.1.0
- [ ] T166 Write release notes highlighting key features
- [ ] T167 Create Twitter announcement thread
- [ ] T168 Post on relevant communities (Reddit, Hacker News, Product Hunt)
- [ ] T169 Share with spec-kit community as first variant example

---

## Dependency Graph

### Story Completion Order

Since this is a meta-toolkit project (not feature development), dependencies are primarily sequential:

1. **Phase 1 (Setup)** → Blocks everything (must establish project structure)
2. **Phase 2 (CLI)** → Blocks Phase 4, 6, 7 (commands need working CLI)
3. **Phase 3 (Templates)** → Blocks Phase 4, 7 (commands reference templates)
4. **Phase 4 (Commands)** → Blocks Phase 7, 8 (tests need commands)
5. **Phase 5 (Scripts)** → Blocks Phase 7, 8 (tests need scripts)
6. **Phase 6 (Docs)** → Blocks Phase 8 (beta users need docs)
7. **Phase 7 (Testing)** → Blocks Phase 8 (validate before beta)
8. **Phase 8 (Beta)** → Blocks Phase 9 (iterate before release)
9. **Phase 9 (Polish)** → Final phase (release ready)

### Parallel Execution Opportunities

**Phase 2**: T018-T021 can run in parallel (different files)
**Phase 2**: T022-T027 can run in parallel (different CLI flags)
**Phase 3**: T032-T037 (constitution), T038-T046 (spec), T047-T055 (plan), T056-T063 (tasks) can partially overlap (different template files)
**Phase 4**: T064-T069 can run in parallel (different command files)
**Phase 6**: T100-T105 can run in parallel (different ref files)
**Phase 7**: T111-T122 can run in parallel after core implementation complete

---

## Implementation Strategy

### MVP Scope (Week 1-2)

**Goal**: Minimal viable toolkit that can generate one Twitter campaign spec

- Phase 1: Complete (T001-T016)
- Phase 2: Basic CLI (T017-T021, T022-T024)
- Phase 3: Spec template only (T038-T046)
- Phase 4: `/twitterkit.specify` command only (T065)
- Phase 6: Basic quickstart (T094-T097)

**Success Criteria**: User can run `twitter_cli init my-campaign` and `/twitterkit.specify` to generate Twitter-focused spec.md

### Incremental Delivery (Week 3-4)

**Goal**: Add plan and tasks generation

- Phase 3: Plan template (T047-T055)
- Phase 3: Tasks template (T056-T063)
- Phase 4: `/twitterkit.plan` and `/twitterkit.tasks` commands (T066-T067)
- Phase 5: Core scripts (T082-T088)

**Success Criteria**: User can complete full workflow: constitution → spec → plan → tasks

### Full Feature Set (Week 5-6)

**Goal**: Complete all features, test with beta users

- Phase 3: Constitution template (T032-T037)
- Phase 4: All commands (T064-T069)
- Phase 5: All scripts (T082-T093)
- Phase 6: Complete docs (T094-T110)
- Phase 7: All tests (T111-T137)

**Success Criteria**: All integration tests pass, multi-kit coexistence validated

### Beta & Release (Week 7-8)

**Goal**: Beta testing and public release

- Phase 8: Beta user testing (T138-T152)
- Phase 9: Polish and release (T153-T169)

**Success Criteria**: 5 beta users complete workflow, positive feedback, public release on GitHub

---

## Roles & Ownership

| **Role** | **Responsibilities** | **Primary KPI** |
|----------|----------------------|-----------------|
| **Lead Dev** | CLI implementation, script adaptation, testing | All tests passing, multi-kit coexistence working |
| **Content Lead** | Template transformation, documentation, ref docs | Templates generate 80%+ usable content, clear docs |
| **Founder** | Beta recruitment, community engagement, release | 5 beta users complete workflow, positive feedback |

---

## Checkpoints & Exit Criteria

### MVP Exit Criteria (Phase 1-2-3 partial)

- [ ] `twitter_cli init` command works
- [ ] Spec template generates Twitter-appropriate content
- [ ] `/twitterkit.specify` command executes successfully
- [ ] User can install and use without errors

### Full Workflow Exit Criteria (Phase 3-4-5 complete)

- [ ] All templates (constitution, spec, plan, tasks) generate quality content
- [ ] All `/twitterkit.*` commands work
- [ ] Scripts execute without errors
- [ ] Multi-kit coexistence validated (both `specify` and `twitter_cli` work)

### Beta Ready Exit Criteria (Phase 6-7 complete)

- [ ] Documentation complete and clear
- [ ] All integration tests passing
- [ ] Template quality validated (80%+ usable without modification)
- [ ] Quickstart guide tested with new user

### Release Exit Criteria (Phase 8-9 complete)

- [ ] 5 beta users complete full workflow
- [ ] 70%+ beta users say "very disappointed" if toolkit went away (Sean Ellis test)
- [ ] All critical bugs fixed
- [ ] Code quality standards met (linters pass, type hints complete)

---

## Task Summary

**Total Tasks**: 169
**Phases**: 9 (Setup → CLI → Templates → Commands → Scripts → Docs → Testing → Beta → Polish)
**Estimated Duration**: 6-8 weeks (with 1-2 developers + 1 content lead)

**Task Distribution by Phase**:
- Phase 1 (Setup): 16 tasks
- Phase 2 (CLI): 15 tasks
- Phase 3 (Templates): 32 tasks (largest - template transformation is core work)
- Phase 4 (Commands): 18 tasks
- Phase 5 (Scripts): 12 tasks
- Phase 6 (Docs): 17 tasks
- Phase 7 (Testing): 27 tasks
- Phase 8 (Beta): 15 tasks
- Phase 9 (Polish): 17 tasks

**Parallel Opportunities**: ~40 tasks can run in parallel (marked with [P])

**Critical Path**: Phase 1 → Phase 2 → Phase 3 (templates) → Phase 4 (commands) → Phase 7 (testing) → Phase 8 (beta) → Phase 9 (release)

---

**Generated**: 2025-12-04
**Tool**: Claude Code + Spec-Kit `/speckit.tasks` workflow
**Next Step**: Run `/speckit.implement` to execute tasks systematically
