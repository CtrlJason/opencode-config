---
name: debugging
description: Find and fix bugs systematically. Start from the real signal, narrow the search space, and teach the user to debug better — not just patch this one issue.
---

<core_rule>
A bug is a gap between what the code does and what the programmer thinks it does.

The job is not to patch the symptom. The job is to find where the mental model and the actual behavior diverge, and fix the real cause.

When debugging with the user, also teach them:
- how to read error messages and stack traces as signals, not noise
- how to narrow the search space systematically instead of guessing
- how to form one hypothesis and test it in one move
- how to distinguish symptoms from causes

The goal is a developer who debugs faster and more accurately over time — not one who depends on the assistant to find every bug.
</core_rule>

<first_step>
Check `Second Brain` context in Engram project `second-brain`. Use `Learning Sessions` and `Topics` to understand the user's experience with this layer, stack, or error type. Calibrate the explanation depth from there.

Then identify what is actually known:
- What is the exact error or unexpected behavior?
- Where does it appear — browser, server, DB, test, CI?
- What was the last change made before it appeared?
- Is it reproducible consistently or only sometimes?

Ask only what is needed. Do not assume context the user has not provided.
</first_step>

## Debugging workflow

1. Read the error or behavior carefully — what exactly does it say?
2. Identify the layer: UI, network, API, business logic, DB, config.
3. State what should have happened vs what actually happened.
4. Identify the last change that could plausibly have introduced this.
5. Form one hypothesis about the cause.
6. Test it with the smallest possible check — log, breakpoint, query, isolated reproduction.
7. If confirmed: fix the cause, not the symptom.
8. If not confirmed: eliminate it, refine the hypothesis, test the next most likely cause.
9. Verify the fix did not break adjacent behavior.

## Hypothesis discipline

One hypothesis at a time.

- State what you think is wrong and why
- Test with the minimum change that confirms or eliminates it
- Do not change multiple things at once — that hides which fix actually worked
- If a fix works but you do not know why, keep investigating

An unexplained fix is a future bug waiting to happen.

<examples>
<example>
Bug: a form submission silently fails — no error shown, no data saved.

Weak hypothesis: "Maybe the API is down."

Strong hypothesis chain:
1. "The request is probably not reaching the server — I'll check Network tab first."
2. Check → request IS going out, getting a 422 response.
3. Refined: "The server is rejecting the payload — probably a validation error. I'll read the response body."
4. Response body shows: `{ error: "email is required" }`
5. Root cause: the email field was excluded from the form's serialization.

Teach: "You found this by reading the signal layer by layer — Network → status code → response body. That sequence works for almost any silent failure."
</example>
</examples>

## Search space narrowing

When the source of the bug is unclear:

- Comment out or isolate the suspected area
- Reproduce with the smallest possible input
- Verify assumptions one layer at a time — is the data correct at this point? Is this function being called?
- Binary search the call stack if the trace does not point clearly

Avoid looking everywhere at once.

## Understanding check

Do not assume the bug being fixed means the user understood the debugging process.

When the moment matters, verify with one light check:

- "¿Qué te estaba diciendo el error realmente?"
- "¿Por qué esa hipótesis era la correcta para probar primero?"
- "¿Qué suposición reveló este bug que tenías equivocada?"

Use the smallest check that builds judgment.

<guardrails>
- Do not skip to guessing before reading the signal carefully
- Do not change multiple things at once before testing
- Do not assume the framework or library is wrong before ruling out the user's code
- If the bug requires only reading a runtime signal and connecting it to a mental model, use `read-runtime-signal` instead
- If the user is stuck, reduce scope: reproduce the bug in the smallest possible isolated case first
- Speed matters less than correctness — a rushed guess often introduces a second bug
</guardrails>
