# Twitter-Init-Kit Constitution

**Project Type**: Domain-Specific Variant of Spec-Kit Framework
**Domain Focus**: Twitter Marketing & Growth for AI/LLM SaaS Products
**Meta Purpose**: Both a production toolkit AND a reference implementation for creating spec-kit variants

**Version**: 1.0.0
**Ratified**: 2025-12-04
**Last Amended**: 2025-12-04

---

## Meta-Context: twitter-init-kit's Dual Purpose

This project serves two critical purposes:

1. **Production Toolkit**: A complete, opinionated framework for planning and executing Twitter marketing and growth strategies for AI/LLM SaaS products, built on spec-driven development principles.

2. **Reference Implementation**: A worked example demonstrating how to fork spec-kit and create domain-specific variants (pm-kit, pd-kit, marketing-kit, biz-writing-kit, etc.).

This constitution governs both aspects and explicitly addresses the architectural patterns needed for **multi-kit coexistence** on a single machine.

---

## I. Foundation: Spec-Driven Development for Twitter Marketing

### Principle 1.1: Spec-Driven Methodology Inheritance

twitter-init-kit **inherits and adapts** the core spec-driven development workflow from github.com/github/spec-kit:

- **Define** (spec.md): What you want to achieve (user personas, growth goals, campaign objectives)
- **Plan** (plan.md): How you will achieve it (channels, content strategy, growth loops)
- **Task** (tasks.md): Concrete, dependency-ordered execution plan
- **Implement**: Systematic execution with checkpoints and iteration

**Adaptation**: The spec-kit workflow, originally designed for software engineering, is here applied to **Twitter marketing strategy, content creation, and growth operations**.

### Principle 1.2: Twitter Marketing Domain Principles

From the 2023–2025 analysis of successful AI SaaS Twitter strategies (Cursor, Claude Code, Runway, Pika, HeyGen, Harvey, Writer.ai, Canva, Figma, Notion), this kit codifies:

1. **Founder-Led Marketing**: Authentic founder voices over corporate accounts
2. **Build in Public**: Transparency, frequent shipping, community engagement
3. **Demo-Driven "Show, Don't Tell"**: Visual proof of product value
4. **Narrative & Philosophy**: Selling a better way of working, not just features
5. **Product-Led Growth Loops**: Content sharing, templates, collaboration driving organic growth
6. **Workflow-Level Activation**: Success measured by completed hero workflows, not vanity metrics

These principles are **encoded** in the templates and workflows of this kit.

---

## II. Multi-Kit Architecture & Namespace Strategy

### Principle 2.1: Package-Level Isolation

**Problem**: Multiple `*-kit` variants (spec-kit, twitter-kit, pm-kit, pd-kit, blog-kit) may coexist on one machine or in one project. Package names must not collide.

**Solution**: Each kit uses a **distinct package folder name** as its namespace:

- **spec-kit** → `.specify/` (original)
- **twitter-kit** → `.twitterkit/`
- **pm-kit** → `.pmkit/`
- **pd-kit** → `.pdkit/`
- **blog-kit** → `.blogkit/`

**Implementation**:
- All kit-specific configuration, memory, templates, and scripts live under `./[kitname]/`
- Example: twitter-kit's constitution lives at `.twitterkit/memory/constitution.md`
- Example: pm-kit's templates live at `.pmkit/templates/`

**Why This Matters**: Different kits can operate in the same project directory without file conflicts. A project could use spec-kit for engineering AND twitter-kit for marketing simultaneously.

### Principle 2.2: CLI Command Naming

**Problem**: The base spec-kit installs as `specify` command. If all variants also install as `specify`, they will conflict.

**Solution**: Each kit has a **unique CLI command name**:

- **spec-kit** → `specify` (original)
- **twitter-kit** → `twitterify`
- **pm-kit** → `pmify`
- **pd-kit** → `pdify`
- **blog-kit** → `blogify`

**Implementation**:
- Install commands: `uv tool install twitterify-cli --from git+https://github.com/[org]/twitter-init-kit.git`
- Usage: `twitterify init <project>`, `twitterify check`
- Each CLI points to its own package folder (`.twitterkit/` for `twitterify`)

**Why This Matters**: Users can install multiple kits globally without command name collisions.

### Principle 2.3: Slash Command Namespacing

**Problem**: AI coding agents (Claude Code, Cursor, Gemini CLI, etc.) use slash commands like `/speckit.plan`. If multiple kits define `/plan`, they will conflict.

**Solution**: Each kit uses a **unique namespace prefix** for slash commands:

- **spec-kit** → `/speckit.specify`, `/speckit.plan`, `/speckit.tasks`, `/speckit.implement`
- **twitter-kit** → `/twitterkit.specify`, `/twitterkit.plan`, `/twitterkit.tasks`, `/twitterkit.implement`
- **pm-kit** → `/pmkit.specify`, `/pmkit.plan`, `/pmkit.tasks`, `/pmkit.implement`
- **pd-kit** → `/pdkit.specify`, `/pdkit.plan`, `/pdkit.tasks`, `/pdkit.implement`

**Implementation**:
- Slash commands are defined in `.claude/commands/[namespace].[command].md`
- Example: twitter-kit defines `/twitterkit.plan` in `.claude/commands/twitterkit.plan.md`
- Command files reference the correct package folder (`${SPECIFY_ROOT}/.twitterkit/...`)

**Why This Matters**:
1. AI agents can reliably invoke the correct workflow for each kit
2. No ambiguity when a project uses multiple kits
3. Commands can coexist in the same `.claude/commands/` directory

### Principle 2.4: Agent Integration Consistency

**Inheritance**: All kits use the **same agent integration pattern** as spec-kit:
- Commands defined in `.claude/commands/` (for Claude Code)
- Analogous patterns for Cursor, Gemini CLI, Windsurf, etc.
- Scripts in `.specify/scripts/` for original spec-kit; `.twitterkit/scripts/` for this kit

**Adaptation**: twitter-kit **reuses** the `.claude/` folder structure but with **twitterkit-namespaced** commands.

**Why This Matters**: Users familiar with one kit can immediately use another kit with the same agent.

---

## III. Template Adaptation Strategy

### Principle 3.1: Domain-Specific Templates

Each kit **adapts** the core spec-kit templates to its domain:

**spec-kit** (software engineering):
- `spec-template.md` → User stories, acceptance criteria, technical requirements
- `plan-template.md` → Architecture, tech stack, implementation details
- `tasks-template.md` → Code tasks, file paths, test-driven development

**twitter-kit** (Twitter marketing & growth):
- `spec-template.md` → Personas, growth goals, campaign objectives, PMF signals
- `plan-template.md` → Channels, content strategy, growth loops, activation plan
- `tasks-template.md` → Content creation, campaign execution, community management

**Key Adaptation Points**:
1. **Personas**: From "software user" to "Twitter audience segment"
2. **Workflows**: From "code features" to "Twitter campaigns and content flows"
3. **Metrics**: From "test coverage" to "engagement rate, activation, retention"
4. **Deliverables**: From "code files" to "content calendars, templates, community assets"

### Principle 3.2: Reference Material Structure

twitter-kit includes extensive **refs/** documentation showing the adaptation process:

- `0_overview.md` → Background research on Twitter marketing for AI SaaS
- `1_principles_for_constitution.md` → Distilled principles from case studies
- `2_define_for_specify.md` → How to adapt `/specify` command for Twitter domain
- `3_project_management_for_plan.md` → How to adapt `/plan` command for growth planning
- `4_pm_tasking_for_tasks.md` → How to adapt `/tasks` command for execution
- `5_more/` → Tactical references (launch playbooks, operations templates, etc.)

**Meta-Purpose**: These docs serve as a **blueprint** for creating other kit variants. Anyone forking twitter-kit to create pm-kit, pd-kit, or marketing-kit can follow the same research → principles → template adaptation pattern.

---

## IV. Development & Contribution Principles

### Principle 4.1: Keep the Fork Updated

twitter-init-kit is a **fork** of spec-kit. To maintain quality:

1. **Track upstream**: Regularly review spec-kit updates for improvements to core workflow, agent integrations, or infrastructure
2. **Selective merge**: Adopt upstream improvements that enhance the multi-kit architecture or core workflow
3. **Domain independence**: Do NOT merge spec-kit's software-specific templates or content into twitter-kit's domain layer

### Principle 4.2: Documentation as Code

**All adaptations must be documented**:
- Every template change must have a corresponding explanation in `refs/`
- Research prompts and Perplexity searches should be captured and versioned
- Template iterations should be tracked with rationale

**Why**: Future kit creators (pm-kit, pd-kit, etc.) need to understand **why** each adaptation was made.

### Principle 4.3: Real-World Testing

This constitution requires that twitter-init-kit **be used in production** on real AI SaaS Twitter marketing projects.

Lessons learned must feed back into:
1. Template improvements
2. Constitution amendments
3. refs/ documentation updates

**Test Projects**:
- Use twitter-kit for a real product launch
- Iterate based on what works and what doesn't
- Capture both successes and failures

---

## V. Constraints & Boundaries

### Principle 5.1: Scope Discipline

**In Scope** for twitter-kit:
- Twitter/X marketing strategy and operations for AI/LLM SaaS products
- Content planning, creation, and scheduling
- Community building and engagement
- Growth loops and viral mechanics
- Product-led growth via Twitter
- Metrics and analytics for activation/retention/growth

**Out of Scope**:
- Code implementation (use spec-kit for that)
- UI/UX design (use pd-kit or design-kit)
- General product management (use pm-kit)
- Non-Twitter marketing channels (create dedicated kits or use marketing-kit)

**Why**: Focus prevents feature creep and keeps each kit excellent at its specific domain.

### Principle 5.2: No Technical Implementation Details

This kit operates at the **strategy and operations** level, not the technical implementation level.

- **Spec.md** defines *what* growth outcomes you want, not *how* to build the product
- **Plan.md** defines *how* to execute Twitter marketing, not tech stack
- **Tasks.md** breaks down marketing execution, not code tasks

**Exception**: When Twitter marketing requires tooling (scheduling tools, analytics platforms, automation), those tools should be **specified** in plan.md and **configured/used** in tasks.md, but not **built** by this kit.

---

## VI. Quality Standards

### Principle 6.1: Evidence-Based Templates

All twitter-kit templates and guidance must be grounded in:
1. **Recent case studies** (2023–2025) from successful AI SaaS products
2. **Public research** and playbooks (referenced with links in refs/)
3. **First-principles reasoning** about social platforms, growth loops, and creator economies

**Anti-pattern**: Generic startup advice or "10 tips for Twitter growth" content without domain specificity.

### Principle 6.2: Actionable Over Theoretical

Every section of spec.md, plan.md, and tasks.md must be:
- **Concrete**: Specific enough to execute without interpretation
- **Measurable**: Tied to metrics that can be tracked
- **Time-bound**: Clear on cadence (daily, weekly, per-sprint)

**Anti-pattern**: Vague aspirations like "increase engagement" without defining what engagement means or how to measure it.

### Principle 6.3: Constitution-Driven Development

Just as spec-kit enforces TDD and architecture principles, twitter-kit enforces **Twitter marketing principles** derived from successful AI SaaS products:

- All campaigns must demonstrate "show, don't tell"
- All content must align with founder-led, authentic voice
- All tactics must connect to measurable activation or retention
- No growth hacking that sacrifices trust or brand reputation

**Governance**: The `/twitterkit.constitution` command should be run **first** to establish these principles before any spec or plan is created.

---

## VII. Extensibility & Variant Creation

### Principle 7.1: twitter-kit as a Meta-Template

This project is designed to be **forked and adapted** for other domains:

**Process for creating a new kit variant**:
1. Fork twitter-init-kit repository
2. Rename package folder (`.twitterkit/` → `.newkit/`)
3. Rename CLI command (`twitterify` → `newkitify`)
4. Update slash command namespaces (`/twitterkit.*` → `/newkit.*`)
5. Replace `refs/` research with domain-specific research (use the prompts as templates)
6. Adapt templates (spec, plan, tasks) to new domain
7. Update constitution with domain-specific principles

**Expected Variants**:
- **pm-kit**: Product management (roadmapping, feature prioritization, stakeholder management)
- **pd-kit**: Product design (user research, design systems, prototyping)
- **marketing-kit**: Multi-channel marketing (not just Twitter)
- **biz-writing-kit**: Business writing (proposals, reports, executive communication)

### Principle 7.2: Shared Infrastructure

All variants should share:
- Core workflow (define → plan → task → implement)
- Agent integration patterns (.claude/, cursor/, etc.)
- Multi-kit coexistence architecture
- Markdown-based, git-friendly format

This creates a **family of kits** that work together seamlessly.

---

## VIII. Success Criteria for This Constitution

This constitution is successful if:

1. **Multi-Kit Coexistence Works**: Users can install spec-kit, twitter-kit, and pm-kit on the same machine without conflicts
2. **AI Agents Work Seamlessly**: Claude Code, Cursor, and other agents can invoke `/twitterkit.*` and `/speckit.*` commands reliably
3. **Real Marketing Projects Succeed**: Teams use twitter-kit to plan and execute real AI SaaS Twitter campaigns with measurable results
4. **Variant Creation Is Straightforward**: New kit creators can follow this project's pattern to build pm-kit, pd-kit, etc. in <1 week
5. **Community Adoption**: Other AI SaaS teams adopt twitter-kit and contribute improvements back

---

## IX. Governance

### Amendment Process

This constitution can be amended when:
1. New research emerges that contradicts current principles
2. Multi-kit architecture reveals edge cases not addressed
3. Real-world usage exposes gaps or anti-patterns
4. New AI agents require integration pattern updates

**Process**:
1. Document the problem in a GitHub issue
2. Research and propose solution
3. Update constitution with version bump
4. Update all affected templates and refs/ docs
5. Test with real project

### Compliance

All spec.md, plan.md, and tasks.md files created with twitter-kit must:
- Reference this constitution
- Follow the principles in Sections I, V, VI
- Use the namespace strategy in Section II
- Ground decisions in the Twitter marketing principles from Section I.2

**Review Checklist**:
- [ ] Constitution read and understood before starting
- [ ] Personas defined per Principle 1.2
- [ ] Growth loops specified per Principle 1.2
- [ ] Metrics are workflow-level, not vanity
- [ ] Content strategy aligns with "show, don't tell"
- [ ] Templates sourced from refs/ research

---

## X. Living Document

This constitution is a **living document**. As twitter-init-kit is used in production and as new AI SaaS Twitter best practices emerge, this document will evolve.

**Current Status** (2025-12-04):
- Version 1.0.0: Initial constitution ratified
- Based on 2023–2025 research (Cursor, Runway, Pika, HeyGen, Harvey, Writer, Canva, Figma, Notion)
- Multi-kit architecture validated in design phase
- Awaiting real-world production testing

**Next Milestones**:
1. Real Twitter campaign execution using this kit
2. Creation of first variant kit (pm-kit or pd-kit) to validate extensibility
3. Community feedback from early adopters

---

**Ratified by**: Frank (frank@agentii.ai)
**Date**: 2025-12-04
**Version**: 1.0.0
