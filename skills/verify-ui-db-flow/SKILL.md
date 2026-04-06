---
name: verify-ui-db-flow
description: Validate a UI flow end-to-end by exercising the interface, checking console or network issues, and confirming persistence in Postgres.
---

## Purpose

Use this skill when validating forms, CRUD flows, auth flows, or other UI-backed business features.

This skill should not only confirm that a UI action reached the database.
It should help the user understand the end-to-end path from UI to API to persistence, validate that the right data and state were stored, and avoid false confidence based on surface-level success.

## Teaching intent

When using this skill, teach the user:

- how to trace a flow across UI, network, backend behavior, and database state
- how to identify where a failure or inconsistency actually appears
- how to validate correct data and state, not just the existence of a record
- how to avoid false `OK` conclusions based only on visual feedback

The goal is stronger end-to-end judgment, not only confirmation that "something was saved".

## Risk-first rule

If time is limited, prioritize the parts of the flow with the highest business or data risk.

Risk is higher when:

- the flow creates, updates, or deletes meaningful data
- the flow changes business state
- the UI claims success before persistence is truly confirmed
- validation rules or business rules are involved
- inconsistent data would cause user or domain problems

## Default workflow

1. State the exact user goal and expected end-to-end outcome.
2. Identify the highest-risk part of the flow.
3. Use Playwright to open the relevant page and execute the flow.
4. Inspect browser console for errors or warnings relevant to the flow.
5. Inspect network requests for key API calls, status codes, request/response behavior, and failures.
6. Verify the visible UI state and feedback after the interaction.
7. If the flow should persist data, confirm the result in Postgres.
8. Compare what the UI claimed, what the API did, and what the DB actually stored.
9. Report the result as:
   - `OK` when the flow works end-to-end
   - `Fail` when a user-visible or backend-visible step breaks
   - `Debt` when the flow works but relies on a known temporary shortcut

## Persistence checks

When checking persistence, validate more than mere existence.

Explicitly consider:

- whether the stored data is the correct data
- whether the resulting business state is the correct one
- whether the persisted result matches what the UI communicated
- whether the flow avoided a false success state in the interface

If the DB state and UI story diverge, call that out directly.

## Failure interpretation

When something goes wrong, try to classify it clearly:

- validation issue: the flow rejects or mishandles input rules
- business logic issue: the flow violates expected domain behavior or state transitions
- data issue: the wrong value or state was persisted
- UX issue: the user feedback or UI behavior misleads even if persistence succeeded
- debt: the flow works but depends on a workaround, hardcode, or fragile shortcut

If multiple apply, say so.

## Understanding check

Do not assume the user understood the flow just because the DB was checked.

When the flow matters, verify with one light check such as:

- ask which layer they think failed or carried the problem
- ask what UI result, request behavior, and DB state they expected to see
- ask what they would confirm in the database and why
- ask them to describe how the data moved from UI to persistence

Use the lightest check that strengthens end-to-end reasoning.

## Output format

Keep the response short and include:

- flow tested
- risk focus
- UI result
- console/network findings
- DB confirmation
- consistency check
- final status: `OK`, `Fail`, or `Debt`

## Notes

- Do not assume success from the UI alone.
- Prefer checking both console and network when something looks suspicious.
- For create or update flows, confirm persistence in Postgres when possible.
- If a known temporary hardcode is involved, call it out as debt instead of treating it as a regression.
- A record existing in the DB does not automatically mean the flow is correct.
- Prefer confirming the right value and right state, not only that "something" was saved.
