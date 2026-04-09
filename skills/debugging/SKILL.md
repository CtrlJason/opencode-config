---
name: debugging
description: Find and fix bugs systematically. Start from the real signal, narrow the search space, and teach the user to debug better — not just patch this one issue.
---

## Core Rule

A bug is a gap between what the code does and what the programmer thinks it does.

The job is not to patch the symptom. The job is to find where the mental model and the actual behavior diverge, and fix the real cause.

When debugging with the user, also teach them:
- How to read error messages and stack traces as signals, not noise
- How to narrow the search space systematically instead of guessing
- How to form one hypothesis and test it in one move
- How to distinguish symptoms from causes

The goal is a developer who debugs faster and more accurately over time.

## First Step

Identify what is actually known before doing anything else:

- What is the exact error or unexpected behavior?
- Where does it appear — browser, server, DB, test, CI?
- What was the last change made before it appeared?
- Is it reproducible consistently or only sometimes?

Ask only what is needed. Do not assume context the user has not provided.

## Debugging Workflow

1. Read the error or behavior carefully — what exactly does it say?
2. Identify the layer: UI, network, API, business logic, DB, config.
3. State what should have happened vs what actually happened.
4. Identify the last change that could plausibly have introduced this.
5. Form one hypothesis about the cause.
6. Test it with the smallest possible check — log, breakpoint, query, isolated reproduction.
7. If confirmed: fix the cause, not the symptom.
8. If not confirmed: eliminate it, refine the hypothesis, test the next most likely cause.
9. Verify the fix did not break adjacent behavior.

## Hypothesis Discipline

One hypothesis at a time.

- State what you think is wrong and why
- Test with the minimum change that confirms or eliminates it
- Do not change multiple things at once — that hides which fix actually worked
- If a fix works but you do not know why, keep investigating

An unexplained fix is a future bug waiting to happen.

## Examples

<example>
Bug: a form submission silently fails — no error shown, no data saved.

Weak hypothesis: "Maybe the API is down."

Strong hypothesis chain:
1. "The request is probably not reaching the server — check Network tab first."
2. Check → request IS going out, getting a 422 response.
3. Refined: "The server is rejecting the payload — probably validation. Read the response body."
4. Response body: `{ error: "email is required" }`
5. Root cause: the email field was excluded from the form serialization.

Teach: "You found this by reading the signal layer by layer — Network → status code → response body. That sequence works for almost any silent failure."
</example>

## Search Space Narrowing

When the source of the bug is unclear:

- Comment out or isolate the suspected area
- Reproduce with the smallest possible input
- Verify assumptions one layer at a time — is the data correct at this point? Is this function being called?
- Binary search the call stack if the trace does not point clearly

Avoid looking everywhere at once.

## Understanding Check

Do not assume the bug being fixed means the user understood the debugging process. When the moment matters, verify with one light check:

- "¿Qué te estaba diciendo el error realmente?"
- "¿Por qué esa hipótesis era la correcta para probar primero?"
- "¿Qué suposición reveló este bug que tenías equivocada?"

## Guardrails

- Do not skip to guessing before reading the signal carefully
- Do not change multiple things at once before testing each
- Do not assume the framework or library is wrong before ruling out the user's code
- If the user is stuck, reduce scope: reproduce the bug in the smallest possible isolated case first
- Speed matters less than correctness — a rushed guess often introduces a second bug
