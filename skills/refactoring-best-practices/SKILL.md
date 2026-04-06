---
name: refactoring-best-practices
description: Guide safe, incremental refactoring with strong teaching focus, preserving behavior while improving clarity, maintainability, and design.
---

## Purpose

Use this skill when the user wants to refactor code, evaluate whether refactoring is worth it, or learn how to improve code quality without changing outward behavior.

This skill should not only produce cleaner code.
It should also help the user build judgment about when to refactor, when not to refactor yet, and how to refactor safely in small, verifiable steps.

## Core rule

Refactoring means improving the internal structure of code without changing its external behavior.

If the work changes behavior, adds a feature, or alters product/domain meaning, do not treat it as pure refactoring.
Separate the refactor from behavior changes whenever possible.

## Teaching intent

When using this skill, teach the user:

- how to recognize when refactoring is justified
- how to distinguish a true refactor from feature work or cosmetic cleanup
- how to reduce risk with small steps and verification
- how to optimize for clarity, maintainability, and sound design without over-refactoring

The goal is safe improvement plus stronger engineering judgment.

## Good triggers for refactoring

Refactoring is especially worth considering when you see:

- low clarity: the code is hard to read or reason about
- poor naming: names hide intent or domain meaning
- high coupling: one change forces changes in too many places
- recurring bugs or fragile fixes in the same dirty area
- difficulty extending the code without awkward or risky changes
- repeated logic that has crossed the rule of three

## When to refactor

Use the classic guidance as a base:

- first time: just get it done
- second time: notice the repetition but tolerate it
- third time: start refactoring

Also consider refactoring:

- before or while adding a feature to make the code easier to extend
- while fixing a bug in a dirty area so the real problem becomes easier to see
- during code review, when this is the last safe moment to improve clarity

## When NOT to refactor yet

Say "not yet" when:

- there is not enough test or verification safety
- the area is high-risk and there is no time to validate properly
- the cleanup would not help the current problem
- the proposed change is mostly cosmetic and does not improve real understanding

If you reject or postpone refactoring, explain why clearly.

## Safety rules

Refactor in a way that keeps risk low:

- make small, incremental changes
- keep the program working after each step
- do not mix refactoring with new features in the same unit of work when avoidable
- verify after each meaningful change
- prefer the smallest refactor that materially improves the code

If tests exist, they should keep passing.
If tests fail, first assume the refactor introduced an error.
If the failure comes from overly brittle tests tied to internals, call that out explicitly.

## Refactoring workflow

1. State the real problem in the code.
2. Decide whether this is true refactoring, feature work, or cosmetic cleanup.
3. Confirm the safety net: tests, manual checks, or another verification path.
4. Name the quality goal: clarity, maintainability, lower coupling, better design, or a combination.
5. Break the work into small, reversible steps.
6. Apply one small change at a time.
7. Verify after each meaningful step.
8. Reassess whether the code is actually getting simpler.
9. Stop once the code is clearly better; do not keep polishing out of perfectionism.

## Smell-aware guidance

Use code smells only when they clarify the problem.
Do not turn the session into a catalog recital.

Common smells that justify refactoring well:

- long method
- duplicate code
- large class
- long parameter list
- data clumps
- switch-heavy branching that obscures intent
- feature envy
- speculative generality

Name the smell only if it helps the user see why the refactor is worth doing.

## Understanding check

Do not assume the user understood the refactor just because the code looks cleaner.

When the refactor matters, verify with one light check such as:

- ask what specific problem the refactor is solving
- ask why this is a refactor and not a feature change
- ask what the next smallest safe step would be
- ask what risk would make it better to stop or postpone

Use the lightest check that improves judgment without slowing obvious work.

## Success criteria

Treat the refactor as successful when most of these are true:

- the code is easier to read
- external behavior did not change
- tests or other validation still pass
- the area has less friction for future changes
- unnecessary moving parts were reduced

If the result is not visibly cleaner, question whether the refactor was worth it.

## Failure signs

Warning signs that the refactor is going wrong:

- too many changes bundled together
- new functionality slipped in "while we are here"
- more abstraction but not more clarity
- validation became harder instead of easier
- the code is different but not clearly better

If that happens, reduce scope, step back, or split the work.

## Recommendation shape

Default to an answer that includes:

- whether to refactor now, later, or not at all
- the main reason for that decision
- the smallest safe next step
- the main verification method

## Response guidance

- Keep the guidance practical.
- Prefer small-step plans over big rewrites.
- Prefer clarity over elegance.
- If rewrite is truly better, say so only after calling out the required safety conditions.
- Teach why the refactor helps, not only what technique name applies.

## Notes

- Clean code should be obvious to another programmer.
- Less duplication and fewer moving parts usually reduce maintenance cost.
- Refactoring without verification is gambling.
- Stopping at "clear enough" is often better than polishing indefinitely.
