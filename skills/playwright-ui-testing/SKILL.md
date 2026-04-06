---
name: playwright-ui-testing
description: Validate frontend flows with Playwright by testing forms, responsive behavior, navigation, console errors, and network requests.
---

## Purpose

Use this skill when the user wants to test UI behavior in the browser, especially forms, responsive layouts, CRUD flows, and user interactions.

## When to use

- Testing a form submission flow
- Checking responsive behavior at different viewport sizes
- Verifying modals, drawers, tabs, or navigation
- Confirming console errors or failed network requests
- Checking that a UI change persists correctly in the backend when relevant

If the user mentions forms, responsive behavior, or navigation, prefer this skill over generic reasoning.

## Default workflow

1. Open the relevant page with Playwright.
2. Reproduce the user flow.
3. Check browser console for errors or warnings.
4. Check network requests for failures or unexpected payloads.
5. Verify visible UI state after the interaction.
6. If persistence matters, confirm the backend or database result when possible.
7. Report whether the flow is:
   - `OK` if it works end-to-end
   - `Fail` if something breaks for the user or backend
   - `Debt` if it works but relies on a temporary shortcut

When testing UI, prioritize both the user flow and the console/network checks.

## Testing order

When testing a frontend feature, prefer this order:

1. Happy path
2. Validation errors
3. Edge cases
4. Responsive behavior
5. Console/network review

## Test dimensions

Treat these as separate dimensions when relevant:

- functionality / bugs
- responsive layout
- user experience / interaction quality

Do not collapse them into one vague check if the feature needs all three.

## Output format

Keep the answer short:

- flow tested
- UI result
- console/network findings
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
