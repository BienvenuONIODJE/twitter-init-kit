# /twitterkit.clarify

Identify underspecified areas in the current spec and ask targeted clarification questions.

## Prerequisites

- Project initialized with `twitterify init`
- Constitution created with `/twitterkit.constitution`
- Spec generated with `/twitterkit.specify` (should run before `/twitterkit.plan`)

## Execution Steps

1. **Review spec.md** and identify unclear areas:
   - Ambiguous personas
   - Vague success metrics
   - Underspecified growth loops
   - Missing constraints or risks

2. **Ask 3-5 targeted clarification questions**:
   - One question per major gap
   - Specific enough to clarify, not leading
   - Enable user to make definitive decisions

3. **Incorporate answers** into spec.md

## Expected Outputs

- **Updated spec.md** with clarifications section
- **User decisions** recorded for audit trail
- **Removed ambiguity** before planning phase

## Validation

- [ ] Spec is unambiguous
- [ ] Personas are specific
- [ ] Success metrics are measurable
- [ ] Growth loops are concrete
- [ ] Timeline is realistic

## Notes

- Run this BEFORE `/twitterkit.plan` to avoid downstream rework
- Clarify high-uncertainty areas first
- Document decisions for team alignment
