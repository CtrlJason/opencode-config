---
name: review-decision-tradeoffs
description: Evaluate a technical or product decision, compare alternatives, and recommend the most appropriate option for the current project.
---

## Purpose

Use this when choosing architecture, backend patterns, security approaches, data modeling rules, library usage, or implementation direction.

Use it only when there is a real decision to make. Do not force a tradeoff analysis for straightforward tasks.

## Decision workflow

1. State the exact decision being made.
2. Check whether the project already has relevant context, decisions, or domain rules that constrain the choice.
3. If the decision touches documented product scope, planning, or architecture, verify the relevant source of truth before recommending.
4. List only the project constraints that actually matter.
5. Compare realistic alternatives only.
6. For each alternative, explain:
   - benefits
   - risks
   - complexity cost
   - fit for this project stage
7. Recommend one option clearly.
8. Explain why that option fits this project better than the others.
9. Call out what should be documented in Notion if the decision becomes part of the product or architecture.

## Response guidance

- Keep the analysis concise.
- Do not manufacture options just to make the comparison look complete.
- Teach the reasoning when it helps the user build judgment.
- Use structure only when it improves clarity; do not force a rigid template.

## Notes

- Optimize for the current sprint and current maturity of the project.
- Avoid enterprise complexity unless there is a real need.
- Preserve the documented domain rules.
- If context is missing, ask one short question before recommending.
