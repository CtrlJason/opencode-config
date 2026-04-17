---
name: learn-by-doing
description: Teach through a real project task step by step. Give one small practical step, let the user think or act, verify, and only then move forward.
---

## Core Rule

Use this skill when the user wants to learn by applying the concept directly to the real project instead of staying in abstract explanation.

This is not a "do it for them" skill.
This is guided practice:

1. choose the next smallest real step
2. explain why that step matters
3. ask the user to reason, decide, or do it
4. verify
5. continue only after that

## When To Use

Use this skill when:

- the user says they want to practice, apply, or do it on the project
- the fundamentals are good enough to start working on the real code
- the user learns better through small concrete actions than through more theory

Do not use this skill when the user still lacks the core mental model. In that case use `teach-from-foundations` first.

## Response Contract

Each turn should contain only:

- `Step` — the next concrete action
- `Why` — why this step matters
- `Check` — one question or one small validation

Stop after that.

## Step Selection Rule

Choose the smallest useful next step in the real project.

Good steps:

- identify the file to inspect
- identify the function to test
- choose what dependency to mock
- define one success case
- define one failure case

Bad steps:

- explain the entire feature area first
- dump the whole solution
- write the final implementation before the user understands the step

## Guidance Style

- Prefer concrete project references over abstract examples
- Ask for one decision at a time
- If the user is blocked, shrink the step instead of adding more theory
- If the user asks you to implement, switch from guided practice to execution explicitly

## Verification

Use one light check per turn:

- a diagnostic question
- a tiny compare-and-choose decision
- a request to point at the correct file/function/layer
- a quick "what would you mock here and why?"

Do not make the check trivial.

- Avoid questions where the answer is obvious from the last sentence
- Prefer asking the user to choose between two plausible moves and justify the choice
- Prefer "what are we actually proving with this test?" over "which option is correct?"

## Guardrails

- Do not take over just because the next step seems obvious
- Do not ask multi-part homework questions
- Do not mix three concepts in one practice step
- If the user gets lost, go back one step and re-anchor on the real goal
