# /twitterkit.tasks

Break down the Twitter growth plan into concrete, executable tasks organized by phase with clear ownership and dependencies.

## Prerequisites

- Project initialized with `twitterify init`
- Constitution created with `/twitterkit.constitution`
- Spec generated with `/twitterkit.specify`
- Plan generated with `/twitterkit.plan`

## Execution Steps

1. **Read the plan** and extract:
   - Phases (Alpha, Beta, Launch, Scale)
   - Roles (Founder, Growth Lead, Content Lead, Product Eng)
   - Timeline and dependencies

2. **Generate tasks.md** by:
   - Following `refs/4_pm_tasking_for_tasks.md` guidance
   - Breaking plan into 4-5 phases with concrete tasks
   - Assigning clear ownership for each task
   - Defining dependencies and parallel opportunities
   - Including checklists and exit criteria for each phase
   - Mapping to specific deliverables (demo videos, threads, community assets)
   - Including PDCA reviews and checkpoints

3. **Output** to `specs/[FEATURE_NAME]/tasks.md`

## Expected Outputs

- **File**: `specs/[feature]/tasks.md`
- **Structure**:
  - Phase 1: Setup & Foundation (profile, tooling, content bank)
  - Phase 2: Stealth Alpha (outreach, discovery, validation)
  - Phase 3: Public Launch (launch day, momentum, community)
  - Phase 4: Scale Machine (weekly cadence, optimization)
  - Roles & Ownership
  - Checkpoints & Exit Criteria

## Validation

- [ ] Tasks are specific and actionable
- [ ] Ownership is clear for each task
- [ ] Dependencies are identified
- [ ] Exit criteria define when each phase is complete
- [ ] Tasks can be handed off to team members
- [ ] PDCA reviews built in for iteration

## Notes

- Each phase should be independently shippable
- Tasks should be granular enough to complete in 1-2 days each
- Include checkpoints for feedback and iteration
- Success = concrete deliverables (not "work on Twitter")
