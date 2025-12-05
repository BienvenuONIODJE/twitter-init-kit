# /twitterkit.constitution

Generate or update the project's Twitter marketing constitution - the foundational principles that guide all growth decisions.

## Prerequisites

- Project initialized with `twitterify init`
- Optional: Read `.specify/memory/constitution.md` or `.twitterkit/memory/constitution.md` for reference

## Execution Steps

1. **Read the user's input** about project context:
   - What is the product/service?
   - Who is the target audience on Twitter?
   - What principles matter for this Twitter presence?
   - What are non-negotiables and guardrails?

2. **Generate constitution** by:
   - Referencing Twitter marketing principles from `refs/1_principles_for_constitution.md`
   - Adapting the template in `.twitterkit/memory/constitution.md`
   - Grounding guidance in 2023-2025 AI SaaS case studies (Cursor, Runway, HeyGen)
   - Creating project-specific principles for:
     - Brand voice and authenticity
     - Content pillars and themes
     - Engagement and community standards
     - Success definition (metrics that matter)
     - Growth loops and viral mechanics
     - Non-negotiables (what NOT to do)

3. **Output** the updated constitution to `.twitterkit/memory/constitution.md`

## Expected Outputs

- **File**: `.twitterkit/memory/constitution.md` (updated with project-specific principles)
- **Content**:
  - Project context section
  - 6-8 core Twitter marketing principles
  - Success metrics definition
  - Community standards and guardrails
  - Decision-making framework for growth decisions

## Validation

- [ ] Constitution clearly states what this Twitter presence is about
- [ ] Principles are actionable (not vague platitudes)
- [ ] Success metrics are defined upfront
- [ ] Non-negotiables are explicitly stated
- [ ] Principles align with product vision and values

## Notes

- This is the FIRST command to run - it sets the tone for all subsequent work
- Constitution should be 2-3 pages, not a short paragraph
- Reference case studies to show why principles matter
- This constitution will guide `/twitterkit.specify`, `/twitterkit.plan`, and `/twitterkit.tasks`
