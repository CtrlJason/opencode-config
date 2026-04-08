---
name: debugging
description: Find and fix bugs systematically. Start from the real signal, narrow the search space, and teach the user to debug better — not just patch this one issue.
---

## Purpose

Use this skill when the user needs help finding a bug, tracing an unexpected behavior, or understanding why something is failing.

This skill should not only find the bug.
It should help the user learn how to read signals, form hypotheses, and narrow the problem space — so they debug better next time without depending on the assistant.

## First Step

Before debugging, check `Second Brain` context in Engram project `second-brain`. Use `Learning Sessions` and `Topics` to understand the user's experience with this layer, stack, or error type. If relevant context exists, calibrate the explanation depth from there.

Then identify what is actually known:

- what is the exact error or unexpected behavior?
- where does it appear (browser, server, DB, test, CI)?
- what was the last change made before it appeared?
- is it reproducible? consistently or only sometimes?

Ask only what is needed. Do not assume context the user has not provided.

## Core debugging rule

A bug is a gap between what the code does and what the programmer thinks it does.

The job is not to patch the symptom.
The job is to find where the mental model and the actual behavior diverge, and fix the real cause.

## Teaching intent

When debugging with the user, teach them:

- how to read error messages and stack traces as signals, not noise
- how to narrow the search space systematically instead of guessing
- how to form a hypothesis and test it in one move
- how to distinguish symptoms from causes
- how to recognize patterns in the failure that transfer to future bugs

The goal is a developer who debugs faster and more accurately over time.

## Debugging workflow

1. Read the error or behavior carefully — what exactly does it say?
2. Identify the layer where the failure appears: UI, network, API, business logic, DB, config.
3. State what should have happened vs what actually happened.
4. Identify the last change that could plausibly have introduced this.
5. Form one hypothesis about the cause.
6. Test that hypothesis with the smallest possible check (log, breakpoint, query, isolated reproduction).
7. If confirmed: fix the cause, not just the symptom.
8. If not confirmed: eliminate it, refine the hypothesis, and test the next most likely cause.
9. Verify the fix did not break adjacent behavior.

## Signal reading

Treat errors and stack traces as the first and most reliable clue.

When a signal appears, help the user extract:

- the real error message vs surrounding noise
- the file, line, and layer where it originates
- the input, action, or state that triggered it
- what the message reveals about the broken assumption

Do not skip to guessing before reading the signal carefully. Most bugs announce themselves if the error is read correctly.

## Hypothesis discipline

One hypothesis at a time.

- state what you think is wrong and why
- test it with the minimum change that confirms or eliminates it
- do not change multiple things at once — that hides which fix actually worked
- if a fix works but you do not know why, keep investigating

An unexplained fix is a future bug waiting to happen.

## Search space narrowing

When the source of the bug is unclear, reduce the space:

- comment out or isolate the suspected area
- reproduce the failure with the smallest possible input
- verify assumptions one layer at a time (is the data correct at this point? is this function being called?)
- binary search the call stack if the trace does not point clearly

Avoid looking everywhere at once.

## Common traps

Watch for these:

- fixing the symptom without understanding the cause
- changing multiple things before testing each one
- trusting visual UI feedback without checking the actual data
- assuming the framework or library is wrong before ruling out your own code
- skipping the error message and going straight to guessing

If the user falls into one of these, name it directly and explain the cost.

## Understanding check

Do not assume the bug being fixed means the user understood the debugging process.

When the moment matters, verify with one light check such as:

- ask what the error was actually telling them
- ask why that specific hypothesis was the right one to test first
- ask what they would check first if the same symptom appeared in a different place
- ask what assumption the bug revealed was wrong

Use the smallest check that builds judgment.

## Response shape

Keep the output short and focused:

- `Signal` - what the error or behavior actually says
- `Layer` - where in the stack the failure appears
- `Hypothesis` - the most likely cause and why
- `Test` - the smallest check to confirm or eliminate it
- `Fix` - what to change and why it resolves the root cause
- `Lesson` - what this reveals about the system or a habit to carry forward

Do not force this shape when the bug is simple and obvious.

## Notes

- A correct fix that the user cannot explain is worth less than an understood fix.
- The best debugging session is one where the user could reproduce the process alone next time.
- If the bug is in an unfamiliar layer, research the layer's behavior before guessing.
- If the user is stuck, reduce scope: reproduce the bug in the smallest possible isolated case first.
- Speed matters less than correctness in debugging — a rushed guess often introduces a second bug.
