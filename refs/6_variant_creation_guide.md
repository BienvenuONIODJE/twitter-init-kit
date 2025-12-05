# Kit Variant Creation Guide

**How to create your own domain-specific kit variant (pm-kit, pd-kit, marketing-kit, etc.)**

---

## Overview

This guide documents the systematic process for forking spec-kit and adapting it to a new domain. Twitter-init-kit serves as the reference implementation—follow this pattern to create pm-kit (product management), pd-kit (product design), marketing-kit (general marketing), or any other domain-specific variant.

**Estimated Time**: 4-6 weeks (with 1-2 developers + 1 content lead)

---

## Prerequisites

Before starting, you should have:

1. **Deep domain expertise** in your target area (product management, design, marketing, sales, etc.)
2. **Familiarity with spec-kit** - Complete at least one full workflow (constitution → implement)
3. **Evidence base** - Collect 5-10 case studies or best practices from your domain (2023-2025 preferred)
4. **Target users** - Identify 5+ beta users willing to test your kit

---

## Phase 1: Research & Domain Mapping (Week 1)

### Step 1.1: Define Your Domain

**Questions to answer:**

1. **Domain name**: What's your domain? (Product Management, Product Design, Sales Ops, etc.)
2. **Target users**: Who will use this kit? (Product managers, designers, sales leaders, etc.)
3. **Core workflows**: What workflows will your kit support? (Roadmapping, design specs, sales playbooks, etc.)
4. **Out-of-scope**: What should users NOT use your kit for?

**Example (PM-Kit)**:
```markdown
## Domain Definition

**Domain**: Product Management & Roadmapping
**Target Users**: Product managers at SaaS companies, technical product leads
**Core Workflows**:
- Product requirement documents (PRDs)
- Roadmap planning (quarterly OKRs)
- Feature prioritization (impact/effort scoring)
- Stakeholder alignment (exec reviews, eng handoffs)

**Out-of-Scope**:
- Code implementation (use spec-kit)
- UI/UX design (use pd-kit)
- Marketing/growth (use twitter-kit or marketing-kit)
```

### Step 1.2: Map Spec-Kit Concepts to Your Domain

Create a mapping table:

| Spec-Kit Concept | Twitter-Kit | PM-Kit | PD-Kit | Your Kit |
|------------------|-------------|---------|---------|----------|
| **User stories** | Campaign objectives | PRD requirements | Design goals | ? |
| **Technical requirements** | Channel strategies | Technical constraints | Design system specs | ? |
| **Implementation** | Content creation | Engineering handoff | Design implementation | ? |
| **Code files** | Social posts | Product specs | Figma files | ? |
| **Tests** | Engagement metrics | Success metrics | Usability tests | ? |
| **Feature branch** | Campaign branch | Feature branch | Design sprint | ? |

**Deliverable**: Save this as `refs/domain_mapping.md`

### Step 1.3: Collect Evidence Base

**Research 5-10 case studies or best practices** from your domain:

1. **What worked**: Concrete examples of success (e.g., "Figma's file-based collaboration enabled viral growth")
2. **What didn't work**: Common anti-patterns (e.g., "Waterfall roadmaps cause misalignment")
3. **Principles**: Extract 5-10 actionable principles for your constitution

**Twitter-Kit Examples**:
- Cursor: Founder-led Twitter (CEO tweets daily demo clips)
- Runway: Demo-driven content (show, don't tell)
- HeyGen: PLG activation loops (free trial → power user → advocate)

**PM-Kit Examples**:
- Linear: Public roadmaps increase stakeholder alignment
- Figma: Weekly ship rhythm maintains velocity
- Notion: Bottom-up feature requests inform top-down strategy

**Deliverable**: Save as `refs/0_overview.md`

---

## Phase 2: Namespace Strategy (Week 1)

### Step 2.1: Choose Your Namespace

**Decision Matrix**:

| Element | Spec-Kit | Twitter-Kit | PM-Kit | PD-Kit | Your Kit |
|---------|----------|-------------|---------|---------|----------|
| **Package folder** | `.specify/` | `.twitterkit/` | `.pmkit/` | `.pdkit/` | `.yourkit/` |
| **CLI command** | `specify` | `twitterify` | `pmify` | `pdify` | `yourcommand` |
| **Slash commands** | `/speckit.*` | `/twitterkit.*` | `/pmkit.*` | `/pdkit.*` | `/yourkit.*` |
| **Python package** | `specify-cli` | `twitterify-cli` | `pmify-cli` | `pdify-cli` | `yourkit-cli` |

**Rules**:
1. **Package folder**: Use `.yourkit/` format (lowercase, no special chars)
2. **CLI command**: Short, memorable, verb-like (e.g., `pmify`, `designify`, `sellify`)
3. **Slash commands**: Match kit name (e.g., `/pmkit.*`, `/pdkit.*`)
4. **Python package**: `yourcommand-cli` (matches CLI command)

### Step 2.2: Document Coexistence Strategy

**Test coexistence** with spec-kit and twitter-kit:

```bash
# Install all three kits
uv tool install specify-cli
uv tool install twitterify-cli
uv tool install yourkit-cli

# Verify CLI commands don't conflict
specify --help
twitterify --help
yourcommand --help

# Verify package folders coexist
ls -d .specify/ .twitterkit/ .yourkit/

# Verify slash commands don't conflict
ls .claude/commands/speckit.*
ls .claude/commands/twitterkit.*
ls .claude/commands/yourkit.*
```

**Deliverable**: Document in `refs/namespace_strategy.md`

---

## Phase 3: Template Transformation (Week 2-3)

This is the most labor-intensive phase. You'll adapt spec-kit's engineering templates to your domain.

### Step 3.1: Constitution Template

**Source**: `.specify/memory/constitution.md`
**Target**: `.yourkit/memory/constitution.md`

**Transformation Steps**:

1. **Copy base structure**: Keep the 6-section structure (Foundation, Multi-Kit, Adaptation, Workflows, Scope, Quality)
2. **Replace domain principles**: Swap engineering principles with your domain principles
3. **Update scope boundaries**: Define in-scope and out-of-scope for your domain
4. **Add evidence**: Reference your case studies from refs/0_overview.md

**Twitter-Kit Example**:
```markdown
### Twitter Marketing Principles

1. **Founder-Led**: Authentic founder voice outperforms brand marketing
   - Evidence: Cursor CEO tweets daily, drove 1M+ user growth

2. **Demo-Driven**: Show don't tell - demos convert 10x better than copy
   - Evidence: Runway's video demos generated viral loops

3. **PLG Activation**: Product is the hero, marketing amplifies
   - Evidence: HeyGen's free trial → activation → advocacy loop
```

**PM-Kit Example**:
```markdown
### Product Management Principles

1. **Evidence-Based**: Ground decisions in user research and data
   - Evidence: Linear's user interview cadence informs roadmap

2. **Outcomes Over Outputs**: Measure impact, not feature count
   - Evidence: Figma's "ship weekly" rhythm maintains velocity

3. **Stakeholder Alignment**: Public roadmaps reduce misalignment
   - Evidence: Notion's public roadmap increased eng/PM trust
```

### Step 3.2: Spec Template

**Source**: `.specify/templates/spec-template.md`
**Target**: `.yourkit/templates/spec-template.md`

**Section Mappings**:

| Spec-Kit Section | Twitter-Kit | PM-Kit | PD-Kit |
|------------------|-------------|---------|---------|
| **User Stories** | Campaign Objectives | PRD Requirements | Design Goals |
| **Technical Requirements** | Channel Strategies | Technical Constraints | Design System Specs |
| **Acceptance Criteria** | Success Metrics | Success Metrics | Usability Criteria |
| **Out of Scope** | Out of Scope Channels | Out of Scope Features | Out of Scope Screens |

**Transformation Process**:

1. **Replace section headers**: "User Stories" → "Campaign Objectives" (twitter-kit) or "PRD Requirements" (pm-kit)
2. **Update variables**: `$USER_PERSONA` → `$TWITTER_PERSONA` (twitter-kit) or `$PRODUCT_PERSONA` (pm-kit)
3. **Rewrite examples**: Replace code examples with domain examples
4. **Add domain-specific sections**: E.g., twitter-kit adds "Growth Loops", pm-kit adds "Prioritization Matrix"

**Twitter-Kit Example (Spec Template)**:
```markdown
## Campaign Objectives *(mandatory)*

### Objective 1: [Brief Title] (Priority: P1)

**Context**: [What problem are we solving on Twitter?]

**Success Scenario**:
- **Given** [campaign state], **When** [content posted], **Then** [expected engagement]

**Success Metrics**:
- Impressions: [target]
- Engagement rate: [target]
- Signups: [target]
- Activations: [target]
```

**PM-Kit Example (Spec Template)**:
```markdown
## PRD Requirements *(mandatory)*

### Requirement 1: [Brief Title] (Priority: P1)

**Context**: [What user problem are we solving?]

**Acceptance Scenario**:
- **Given** [user state], **When** [user action], **Then** [system behavior]

**Success Metrics**:
- Adoption: [target % of users using feature]
- Engagement: [target usage frequency]
- Satisfaction: [target NPS/CSAT]
```

### Step 3.3: Plan Template

**Source**: `.specify/templates/plan-template.md`
**Target**: `.yourkit/templates/plan-template.md`

**Section Mappings**:

| Spec-Kit Section | Twitter-Kit | PM-Kit | PD-Kit |
|------------------|-------------|---------|---------|
| **Technical Context** | Twitter Context | Product Context | Design Context |
| **Architecture** | Sprint Cycle Structure | Roadmap Structure | Design Sprint Structure |
| **Implementation Phases** | Campaign Phases | Feature Phases | Design Phases |

**Transformation Process**:

1. **Replace "Architecture"**: Spec-kit talks about system architecture; your kit talks about workflow structure
   - Twitter-kit: "Twitter Sprint Cycle" (2-week cadences)
   - PM-kit: "Quarterly Roadmap" (OKR cycles)
   - PD-kit: "Design Sprint" (1-week cycles)

2. **Replace "Implementation"**: Spec-kit talks about code implementation; your kit talks about domain execution
   - Twitter-kit: "Content Creation & Distribution"
   - PM-kit: "Engineering Handoff & Launch"
   - PD-kit: "Design Implementation & QA"

3. **Add domain-specific sections**:
   - Twitter-kit: "Growth Loops & Viral Mechanisms"
   - PM-kit: "Stakeholder Alignment & Review Cycles"
   - PD-kit: "Design System Integration & Accessibility"

### Step 3.4: Tasks Template

**Source**: `.specify/templates/tasks-template.md`
**Target**: `.yourkit/templates/tasks-template.md`

**Section Mappings**:

| Spec-Kit Section | Twitter-Kit | PM-Kit | PD-Kit |
|------------------|-------------|---------|---------|
| **Implementation Tasks** | Execution Tasks | Delivery Tasks | Design Tasks |
| **Roles** | Founder, Growth Lead, Content Lead | PM, Eng Lead, Designer | Designer, Researcher, PM |
| **Checkpoints** | Alpha → Launch → Scale | PRD → Dev → Launch | Research → Design → Build |

**Transformation Process**:

1. **Replace task types**: Spec-kit has "Backend Tasks", "Frontend Tasks", "Testing Tasks"; your kit has domain-specific task types
   - Twitter-kit: "Content Creation", "Engagement", "Community", "Analytics"
   - PM-kit: "Research", "Spec Writing", "Stakeholder Review", "Launch Prep"
   - PD-kit: "User Research", "Wireframes", "High-Fidelity Mockups", "Prototyping"

2. **Update roles**: Replace engineering roles with your domain roles
   - Twitter-kit: Founder, Growth Lead, Content Lead, Product Eng
   - PM-kit: Product Manager, Eng Lead, Designer, Data Analyst
   - PD-kit: Lead Designer, UX Researcher, Product Manager, Eng Lead

3. **Update checkpoints**: Replace engineering milestones with your domain milestones
   - Twitter-kit: Alpha → Launch → Scale
   - PM-kit: PRD Review → Eng Kickoff → Beta → Launch
   - PD-kit: Research → Design Review → Implementation → QA

---

## Phase 4: CLI Implementation (Week 3-4)

### Step 4.1: Fork Twitter-Init-Kit Repository

```bash
# Fork twitter-init-kit (it's cleaner than spec-kit)
git clone https://github.com/yourusername/twitter-init-kit.git yourkit
cd yourkit

# Rename package directory
mv .twitterkit .yourkit

# Update pyproject.toml
# Change: name = "twitterify-cli" → name = "yourkit-cli"
# Change: twitterify = "twitterify_cli:main" → yourcommand = "yourkit_cli:main"

# Rename Python package
mv src/twitterify_cli src/yourkit_cli
```

### Step 4.2: Update All References

**Search and replace** across the entire codebase:

| Find | Replace |
|------|---------|
| `twitterify` | `yourcommand` |
| `twitterkit` | `yourkit` |
| `twitter-init-kit` | `yourkit` |
| `Twitter-init-kit` | `YourKit` |
| `.twitterkit/` | `.yourkit/` |

**Files to update**:
- `pyproject.toml` - Package name and entry points
- `src/yourkit_cli/__init__.py` - Import statements
- `src/yourkit_cli/commands/init.py` - Package folder references
- `.yourkit/scripts/bash/*.sh` - Script references
- `.yourkit/templates/commands/*.md` - Command definitions
- `README.md` - Documentation

### Step 4.3: Test CLI

```bash
# Install locally
uv tool install -e .

# Test commands
yourcommand --help
yourcommand version
yourcommand check
yourcommand init test-project --ai claude
```

---

## Phase 5: Slash Command Integration (Week 4)

### Step 5.1: Adapt Command Definitions

**Source**: `.twitterkit/templates/commands/`
**Target**: `.yourkit/templates/commands/`

**For each command** (constitution, specify, plan, tasks, implement, clarify):

1. **Update command name**: `twitterkit.specify.md` → `yourkit.specify.md`
2. **Update package references**: `.twitterkit/` → `.yourkit/`
3. **Update prompt text**: Replace Twitter-specific instructions with your domain instructions
4. **Update expected outputs**: Replace Twitter artifacts with your domain artifacts

**Twitter-Kit Example** (`twitterkit.specify.md`):
```markdown
# Create Twitter Campaign Specification

Generate a Twitter-focused campaign specification following the twitter-init-kit methodology.

## Prerequisites
- Project initialized with `twitterify init`
- Constitution defined (optional but recommended)

## Execution Steps
1. Read `.twitterkit/templates/spec-template.md`
2. Gather campaign requirements from user
3. Define target Twitter personas (technical founders, growth leads)
4. Define hero workflow and demo strategy
5. Define growth loops and success metrics
6. Write `specs/[campaign]/spec.md`

## Expected Outputs
- `specs/###-campaign-name/spec.md` - Twitter campaign specification
```

**PM-Kit Example** (`pmkit.specify.md`):
```markdown
# Create Product Requirement Document (PRD)

Generate a product requirement document following the pm-kit methodology.

## Prerequisites
- Project initialized with `pmify init`
- Product constitution defined (optional but recommended)

## Execution Steps
1. Read `.pmkit/templates/spec-template.md`
2. Gather product requirements from stakeholders
3. Define target user personas (end users, buyers, admins)
4. Define user workflows and acceptance criteria
5. Define success metrics and rollout plan
6. Write `specs/[feature]/spec.md`

## Expected Outputs
- `specs/###-feature-name/spec.md` - Product requirement document
```

### Step 5.2: Test with AI Agents

Test your slash commands with multiple agents:

```bash
# Test with Claude Code
yourcommand init test-project --ai claude
cd test-project
# Run: /yourkit.constitution
# Run: /yourkit.specify
# Run: /yourkit.plan
# Run: /yourkit.tasks

# Test with Cursor
yourcommand init test-project2 --ai cursor
cd test-project2
# Run: /yourkit.constitution (in Composer)

# Test with Windsurf
yourcommand init test-project3 --ai windsurf
cd test-project3
# Run: /yourkit.constitution (in Cascade)
```

---

## Phase 6: Documentation (Week 5)

### Step 6.1: Write Quickstart Guide

**Template**: `specs/000-yourkit-foundation/quickstart.md`

**Sections to include**:
1. What is YourKit?
2. Installation
3. Quick Start: Your First [Domain Workflow]
4. Example Use Case
5. Troubleshooting
6. Multi-Kit Architecture
7. Supported AI Agents

**Follow twitter-init-kit's quickstart.md as a template**.

### Step 6.2: Update README

**Sections to add**:
1. **Overview**: What is yourkit? Who is it for?
2. **Installation**: How to install
3. **Quick Start**: 5-minute walkthrough
4. **Multi-Kit Architecture**: How it coexists with spec-kit, twitter-kit, etc.
5. **Supported AI Agents**: Claude, Cursor, Windsurf, etc.
6. **Template Transformation**: How you adapted spec-kit to your domain
7. **Case Studies**: Evidence base (link to refs/)
8. **Contributing**: How others can improve your kit

### Step 6.3: Document Reference Materials

**Files to create in `refs/`**:
1. `refs/0_overview.md` - Domain background and case studies
2. `refs/1_principles_for_constitution.md` - Distilled principles
3. `refs/2_define_for_specify.md` - Spec template adaptation guide
4. `refs/3_project_mangement_for_plan.md` - Plan template adaptation guide
5. `refs/4_pm_tasking_for_tasks.md` - Tasks template adaptation guide
6. `refs/6_variant_creation_guide.md` - This guide (for future kit creators)

---

## Phase 7: Testing & Validation (Week 6)

### Step 7.1: Multi-Kit Coexistence Testing

**Test matrix**:

| Test | Spec-Kit | Twitter-Kit | Your-Kit | Expected Result |
|------|----------|-------------|----------|-----------------|
| Install all CLIs | ✅ | ✅ | ✅ | All commands work independently |
| Create project with all kits | ✅ | ✅ | ✅ | All package folders coexist |
| Run all slash commands | ✅ | ✅ | ✅ | Commands trigger correct workflows |
| Git branches | ✅ | ✅ | ✅ | Branches don't conflict |

### Step 7.2: Template Quality Testing

**Checklist**:
- [ ] All templates generate 80%+ usable content without modification
- [ ] Variables are clearly defined and documented
- [ ] Examples are domain-specific (not generic)
- [ ] Evidence is cited and relevant
- [ ] Templates are self-documenting (inline help text)

### Step 7.3: Beta User Testing

**Recruit 5+ beta users** from your target domain:

1. **Onboarding**: Walk through installation and first workflow
2. **Execution**: Have them complete full workflow (constitution → implement)
3. **Feedback**: Collect feedback via form or interview
   - What worked well?
   - What was confusing?
   - What's missing?
   - Would you be "very disappointed" if this kit went away?

4. **Iteration**: Implement critical fixes based on feedback

---

## Phase 8: Release (Week 6)

### Step 8.1: Prepare Release

**Checklist**:
- [ ] All tests passing
- [ ] Documentation complete (README, quickstart, refs/)
- [ ] GitHub repository public
- [ ] PyPI package published (optional)
- [ ] Version 0.1.0 tagged

### Step 8.2: Announce

**Announcement channels**:
1. **Twitter/X**: Thread explaining what yourkit is and why you built it
2. **Spec-Kit Community**: Share as a variant example
3. **Domain Communities**: Share in relevant Slack/Discord communities
4. **Blog Post**: Write about your template transformation process

**Announcement Template**:
```
Introducing [YourKit] 🚀

A domain-specific toolkit for systematic [domain] work, adapted from spec-kit.

What it does:
- [Workflow 1]
- [Workflow 2]
- [Workflow 3]

Built with:
- Structured templates (constitution → specify → plan → tasks → implement)
- AI agent integration (Claude Code, Cursor, Windsurf)
- Evidence-based principles (grounded in [case studies])

Install: uv tool install yourkit-cli --from git+...

Why I built it: [1-2 sentences]

Try it and let me know what you think!
```

---

## Common Pitfalls

### Pitfall 1: Not Domain-Specific Enough

**Symptom**: Templates are too generic (e.g., "Define goals" instead of "Define PRD requirements")

**Fix**: Replace every generic term with domain-specific language. If your template could apply to any domain, it's not specific enough.

### Pitfall 2: Copying Without Adapting

**Symptom**: Templates still reference code, tests, or engineering concepts

**Fix**: Do a full find-replace of all engineering terms. Every section should make sense to a domain expert, not a software engineer.

### Pitfall 3: No Evidence Base

**Symptom**: Principles are generic best practices ("Be user-centric", "Move fast")

**Fix**: Ground every principle in a concrete case study. "Cursor's founder-led Twitter strategy drove 1M+ users" is better than "Founders should be active on social media."

### Pitfall 4: Breaking Multi-Kit Coexistence

**Symptom**: Installing your kit breaks spec-kit or twitter-kit

**Fix**: Never modify `.specify/` or `.twitterkit/`. Always use your own namespace (`.yourkit/`, `yourcommand`, `/yourkit.*`).

### Pitfall 5: Ignoring AI Agent Compatibility

**Symptom**: Slash commands work in Claude Code but not Cursor

**Fix**: Test on all major agents (Claude, Cursor, Windsurf) and document agent-specific quirks in quickstart.md.

---

## Success Criteria

**Your kit is successful if:**

1. ✅ **Multi-kit coexistence works**: Users can install spec-kit, twitter-kit, and yourkit without conflicts
2. ✅ **Template quality is high**: 80%+ of AI-generated content is usable without modification
3. ✅ **Adoption**: 20+ users complete at least one full workflow
4. ✅ **Feedback**: 70%+ of beta users say they'd be "very disappointed" if your kit went away
5. ✅ **Extension**: 1+ community member uses your kit to create another variant (validates meta-framework)

---

## Examples & References

### Existing Kits

| Kit | Status | Repository | Use For |
|-----|--------|-----------|---------|
| **spec-kit** | ✅ Public | [github/spec-kit](https://github.com/github/spec-kit) | Software engineering, code implementation |
| **twitter-kit** | ✅ Public | [yourorg/twitter-init-kit](https://github.com/yourorg/twitter-init-kit) | Twitter marketing, growth campaigns |
| **pm-kit** | 🚧 In progress | TBD | Product management, PRDs, roadmapping |
| **pd-kit** | 🚧 In progress | TBD | Product design, design sprints, Figma workflows |

### Template Transformation Examples

See twitter-init-kit's `refs/` directory for detailed examples:
- `refs/2_define_for_specify.md` - Spec template transformation
- `refs/3_project_mangement_for_plan.md` - Plan template transformation
- `refs/4_pm_tasking_for_tasks.md` - Tasks template transformation

---

## Get Help

**Questions?** Open an issue on the spec-kit or twitter-init-kit repositories.

**Want to share your kit?** Tag @yourhandle on Twitter/X or post in spec-kit community.

**Found a bug in this guide?** Submit a PR to improve it for future kit creators.

---

**Time to create a new kit**: 4-6 weeks (1-2 developers + 1 content lead)
**Maintenance burden**: ~4 hours/month (merge spec-kit infrastructure improvements)
**Community impact**: Validates spec-kit as a meta-framework, helps others in your domain

Ready to create your own kit? Start with Phase 1: Research & Domain Mapping. Good luck! 🚀
