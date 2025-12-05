# /twitterkit.specify

Generate a Twitter-focused specification that defines campaign objectives, target personas, success metrics, and growth loops.

## Prerequisites

- Project initialized with `twitterify init`
- Constitution created with `/twitterkit.constitution`

## Execution Steps

1. **Read user input** about what they want to build/launch on Twitter:
   - Product or feature to promote
   - Target audience segments
   - Key value proposition
   - Launch timeline
   - Success definition

2. **Generate spec.md** by:
   - Following `refs/2_define_for_specify.md` adaptation guidance
   - Creating Twitter personas (not generic user types, but Twitter-specific segments)
   - Defining campaign objectives instead of user stories
   - Mapping product hero workflows to Twitter content opportunities
   - Identifying growth loops (demo-to-inbound, artifact sharing, template distribution)
   - Defining success metrics (engagement rate, activation, retention, not vanity followers)
   - Grounding examples in Cursor, Runway, HeyGen case studies

3. **Output** to `specs/[FEATURE_NAME]/spec.md`

## Expected Outputs

- **File**: `specs/[feature]/spec.md`
- **Sections**:
  - Project summary and positioning
  - Target Twitter personas (2-3 specific segments)
  - Core problems and jobs-to-be-done
  - Hero workflows (what users will actually do with your product)
  - Campaign objectives (not user stories - Twitter-specific goals)
  - Growth loops (how content spreads organically)
  - Success metrics (workflow-level, not vanity metrics)
  - Constraints and risks
  - Out-of-scope (what we're NOT doing)

## Validation

- [ ] Spec focuses on Twitter marketing, not product features
- [ ] Personas are specific and behavioral
- [ ] Hero workflows are concrete and demo-ready
- [ ] Growth loops are identified and explained
- [ ] Success metrics are measurable and tied to business outcomes
- [ ] Grounded in 2023-2025 AI SaaS examples

## Notes

- This spec is for MARKETING strategy, not product development
- Think about how users will showcase their success with your product on Twitter
- Every section should answer "why does this matter for Twitter growth?"
