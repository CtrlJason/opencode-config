---
name: review-decision-tradeoffs
description: Evaluate a technical or product decision, compare alternatives, and recommend the most appropriate option for the current project.
---

## Purpose

Use this when choosing architecture, backend patterns, security approaches, data modeling rules, library usage, or implementation direction.

Use it only when there is a real decision to make. Do not force a tradeoff analysis for straightforward tasks.

This skill should not only produce a recommendation.
It should help the user learn how to identify the filters that matter, detect weak reasoning, and make better decisions with less dependence on the assistant over time.

## Decision-first guard

Before analyzing tradeoffs, check whether there is actually a meaningful decision.

If one option is clearly constrained by domain rules, existing architecture, project stage, or obvious simplicity, say so directly instead of pretending there is a rich tradeoff.

Do not manufacture a decision where there is only one sensible move.

## Decision workflow

1. State the exact decision being made.
2. Check whether the project already has relevant context, decisions, or domain rules that constrain the choice.
3. If the decision touches documented product scope, planning, or architecture, verify the relevant source of truth before recommending.
4. List only the project constraints that actually matter.
5. Identify whether this is a real tradeoff or a false tradeoff.
6. Compare realistic alternatives only.
7. For each alternative, explain:
   - benefits
   - risks
   - complexity cost
   - fit for this project stage
   - maintenance cost
   - implementation quality impact
8. Recommend one option clearly.
9. Explain why that option fits this project better than the others.
10. State what would need to change for a different option to become the better choice.
11. Call out what should be documented in Notion if the decision becomes part of the product or architecture.

## Teaching intent

When using this skill, teach the user how to decide, not only what to decide.

Make the reasoning visible:

- which constraints are actually driving the choice
- which concerns are noise, fashion, or premature optimization
- which costs will be paid now vs later
- why the simplest viable option may be the strongest choice

The goal is better judgment, not only a correct answer for the current moment.

## Weak-reasoning detector

Actively watch for weak decision patterns such as:

- overengineering
- choosing based on trend or status
- ignoring project stage, domain, or team reality
- comparing options that are not realistic here
- spending time on a false tradeoff that should be resolved quickly

If you detect one, call it out clearly and explain why it weakens the decision.

## Understanding check

Do not assume that reading the comparison means the user understood the tradeoff.

When the decision matters, verify with one context-appropriate check such as:

- ask the user which option they would choose and why
- ask which option they would discard first and why
- ask what condition would make the recommendation change
- ask the user to summarize why the chosen option wins in this project

Use the lightest check that helps build judgment without slowing down obvious decisions.

## Recommendation shape

Default to a recommendation that includes:

- the chosen option
- the most important implementation-quality consequence
- the condition that would make another option better later

This keeps the advice practical while still teaching how the decision could change.

## Response guidance

- Keep the analysis concise.
- Do not manufacture options just to make the comparison look complete.
- Teach the reasoning when it helps the user build judgment.
- Use structure only when it improves clarity; do not force a rigid template.
- Prefer real filters over exhaustive comparison.
- If the simplest option is enough, say so clearly and explain why.

## Notes

- Optimize for the current sprint and current maturity of the project.
- Avoid enterprise complexity unless there is a real need.
- Preserve the documented domain rules.
- If context is missing, ask one short question before recommending.
- A good tradeoff analysis reduces noise; it does not increase it.
- If the user cannot explain what would change the decision, they may understand the answer but not the tradeoff yet.
