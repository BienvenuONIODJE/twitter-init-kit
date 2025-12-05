# /twitterkit.plan

Generate a comprehensive Twitter growth plan with sprint cycles, growth loops, activation strategies, and experiment framework.

## Prerequisites

- Project initialized with `twitterify init`
- Constitution created with `/twitterkit.constitution`
- Spec generated with `/twitterkit.specify`

## Execution Steps

1. **Read user input** about execution approach:
   - Which channels beyond Twitter? (Reddit, Product Hunt, LinkedIn)
   - Team size and available bandwidth
   - Timeline and phases (alpha, beta, launch, scale)
   - Budget or resource constraints

2. **Generate plan.md** by:
   - Following `refs/3_project_mangement_for_plan.md` guidance
   - Defining strategic pillars (founder-led engine, sprint-based experimentation, wow loops)
   - Creating 4-phase launch plan (Stealth Alpha, Waitlist Beta, Public Launch, Scale Machine)
   - Mapping 2-week sprint cycles with PDCA (Plan-Do-Check-Act)
   - Defining growth loops (demo-to-inbound, artifact sharing, template distribution)
   - Creating experiment log template for hypothesis testing
   - Defining metrics (activation, retention, virality, not vanity)
   - Identifying risks and mitigation strategies

3. **Output** to `specs/[FEATURE_NAME]/plan.md`

## Expected Outputs

- **File**: `specs/[feature]/plan.md`
- **Sections**:
  - Strategic objectives and OKRs
  - Phased launch plan (Stealth → Beta → Launch → Scale)
  - Twitter sprint cycle (2-week PDCA cadence)
  - Growth loops and viral mechanisms
  - Metrics and measurement framework
  - Risks and mitigation
  - Experiment log template

## Validation

- [ ] Plan translates spec into executable phases
- [ ] Sprint cycles are clear and realistic
- [ ] Growth loops are specific and measurable
- [ ] Metrics align with business goals (not vanity)
- [ ] Experiment framework enables data-driven decisions
- [ ] Risks are identified with mitigations

## Notes

- Plan should be 4-6 weeks realistic execution timeline
- PDCA loop: Plan → Do → Check → Act (iterate)
- Growth loops must be built INTO the product (share buttons, artifacts, etc.)
- Founder involvement is critical for authenticity and credibility
