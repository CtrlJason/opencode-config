---
name: verify-ui-db-flow
description: Validate a UI flow end-to-end by exercising the interface, checking console or network issues, and confirming persistence in Postgres.
---

## Purpose

Use this skill when validating forms, CRUD flows, auth flows, or other UI-backed business features.

## Default workflow

1. Use Playwright to open the relevant page and execute the flow.
2. Inspect browser console for errors or warnings relevant to the flow.
3. Inspect network requests for key API calls, status codes, and failures.
4. If the flow should persist data, confirm the result in Postgres.
5. Report the result as:
   - `OK` when the flow works end-to-end
   - `Fail` when a user-visible or backend-visible step breaks
   - `Debt` when the flow works but relies on a known temporary shortcut

## Output format

Keep the response short and include:

- flow tested
- UI result
- console/network findings
- DB confirmation
- final status: `OK`, `Fail`, or `Debt`

## Notes

- Do not assume success from the UI alone.
- Prefer checking both console and network when something looks suspicious.
- For create or update flows, confirm persistence in Postgres when possible.
- If a known temporary hardcode is involved, call it out as debt instead of treating it as a regression.
