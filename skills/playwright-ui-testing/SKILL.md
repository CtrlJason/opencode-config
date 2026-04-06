---
name: playwright-ui-testing
description: Validate frontend flows with Playwright by testing forms, responsive behavior, navigation, console errors, and network requests.
---

## Purpose

Use this skill when the user wants to test UI behavior in the browser, especially forms, responsive layouts, CRUD flows, and user interactions.

This skill should not only say whether a flow passed or failed.
It should help the user learn how to think about UI risk, what must be validated in a real browser, and how to interpret failures across UI, network, and user experience.

## When to use

- Testing a form submission flow
- Checking responsive behavior at different viewport sizes
- Verifying modals, drawers, tabs, or navigation
- Confirming console errors or failed network requests
- Checking that a UI change persists correctly in the backend when relevant

If the user mentions forms, responsive behavior, or navigation, prefer this skill over generic reasoning.

## Teaching intent

When using this skill, teach the user:

- how to identify the riskiest parts of a flow before testing
- what validations are essential versus nice to have
- how to distinguish functional bugs from UX debt or technical debt
- how to read console, network, and visible UI together instead of in isolation

The goal is better validation judgment, not only test execution.

## Risk-first rule

If there is not enough time to test everything, prioritize by risk.

Risk is usually higher when a flow:

- affects important user outcomes
- persists data or changes backend state
- contains validation logic
- depends on multiple UI states or async transitions
- has history of breakage or fragile interaction

Do not spend the same energy on low-risk polish and high-risk flows.

## Default workflow

1. State the exact user goal of the flow.
2. Identify the highest-risk parts worth checking first.
3. Open the relevant page with Playwright.
4. Reproduce the user flow.
5. Check browser console for errors or warnings.
6. Check network requests for failures or unexpected payloads.
7. Verify visible UI state after the interaction.
8. Evaluate UX quality where relevant: feedback clarity, loading states, error prevention, and visual consistency.
9. If persistence matters, confirm the backend or database result when possible.
10. Report whether the flow is:
   - `OK` if it works end-to-end
   - `Fail` if something breaks for the user or backend
   - `Debt` if it works but relies on a temporary shortcut

When testing UI, prioritize both the user flow and the console/network checks.

## Testing order

When testing a frontend feature, prefer this order:

1. Highest-risk happy path
2. Validation errors
3. Edge cases with meaningful user impact
4. Responsive behavior when layout matters
5. Console/network review

## Test dimensions

Treat these as separate dimensions when relevant:

- functionality / bugs
- responsive layout
- user experience / interaction quality
- async behavior / loading transitions
- persistence / backend state when relevant

Do not collapse them into one vague check if the feature needs all three.

## UX checks

When relevant, explicitly evaluate:

- whether success and error feedback are understandable
- whether loading states communicate what is happening
- whether the UI helps prevent obvious user mistakes
- whether the interaction still feels visually and behaviorally consistent

Do not treat "it technically worked" as enough if the UX is confusing or fragile.

## Failure interpretation

When something is wrong, try to classify it clearly:

- functional bug: the flow does not behave correctly
- UX debt: the flow works but communicates poorly, confuses the user, or makes errors too easy
- technical debt: the flow works but relies on a brittle shortcut or suspicious implementation

If multiple apply, say so.

## Understanding check

Do not assume the user learned validation judgment just because a browser run happened.

When the flow matters, verify with one light check such as:

- ask what part of the flow they would test first and why
- ask what still feels uncovered
- ask which part seems riskiest and why
- ask whether an issue is a bug, UX debt, or technical debt

Use the smallest check that strengthens judgment without slowing obvious validation.

## Output format

Keep the answer short:

- flow tested
- risk focus
- UI result
- console/network findings
- UX findings
- backend/database confirmation if relevant
- final status: `OK`, `Fail`, or `Debt`

## Notes

- Do not trust the visible UI alone if the flow should persist data.
- Prefer real browser checks over assumptions.
- Use responsive tests when layout or mobile behavior matters.
- If the user asks about a form, validate both interaction and feedback.
- If the user asks about responsive design, test at at least one desktop size and one mobile size.
- If the user is only discussing pure business logic, do not force browser testing
- If the result works but there is temporary technical debt, report both the debt and the reason briefly
- A green happy path does not prove the whole experience is good.
- When time is limited, explain what you prioritized and what remains untested.
