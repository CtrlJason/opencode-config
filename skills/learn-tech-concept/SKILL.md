---
name: learn-tech-concept
description: Teach a language, framework, or library from the underlying problem and mental model first. Adapt depth to the user and connect the explanation to real usage.
---

## Purpose

Use this skill when the user wants to understand a programming language concept, framework feature, library API, or technical tool in a way that builds real understanding instead of memorization.

## First Step

Before explaining, first check `Second Brain` context in Engram project `second-brain`. Use both `Learning Sessions` and `Topics` to estimate prior exposure, vocabulary, and likely gaps. If `Second Brain` context conflicts with a generic prior assumption about the user's level, prefer `Second Brain`.

If no relevant `Second Brain` context exists, proceed with normal calibration.

Once you have the baseline, ask only what is necessary to fill the remaining gap:

- whether the topic is a language, framework, library, or tool
- whether they want conceptual understanding, practical usage, or both
- what part is confusing

Examples:

```
Antes de explicarte esto, necesito ubicar tu punto de partida:

1. ¿Qué tanto conoces de este tema? (nada / básico / a medias / bastante)
2. ¿Quieres entender la idea, aprender a usarlo, o ambas?
3. ¿Qué parte te confunde más?
```

## Core idea

Teach the mental model first, then the syntax or API.

- explain what problem the thing solves
- explain how to think about it before teaching how to type it
- connect examples to real usage
- stay concise unless the user asks for depth
- prefer understanding over listing features
- aim for the user to be able to explain, choose, and use the concept with judgment

## Learning-style adaptation

Adapt to the user's current learning pattern when it is known.

In particular:

- use a real error or failure as the entry point when that helps the user learn faster
- prioritize: what it is, why it exists, how it works, and what applies here
- do not dump code early
- if the technology is new to the user, code examples may be necessary, but keep them minimal and explain them part by part
- if the user already knows the language or building blocks, prefer explanation and reasoning over writing the solution for them

## Teaching paths

### For a library or framework

Use this order when it helps:

1. `Qué es`
2. `Para qué sirve`
3. `Qué problema resuelve`
4. `Modelo mental`
5. `Conceptos base`
6. `Cómo se usa`
7. `Cuándo conviene`
8. `Cuándo no conviene`
9. `Errores comunes`
10. `Cómo encaja aquí`

### For a language concept

Use this order when it helps:

1. `Qué es`
2. `Qué problema resuelve`
3. `Cómo piensa el lenguaje sobre esto`
4. `Sintaxis mínima`
5. `Semántica real`
6. `Ejemplo simple`
7. `Error común`
8. `Cuándo usarlo`
9. `Cuándo evitarlo`

## If the user wants deep understanding

Go beyond usage and explain:

- why the feature or tool exists
- what tradeoff it makes
- what misconception is common
- how to recognize when they are using it wrong

## If the user wants practical usage

Keep it focused on:

- the minimum mental model needed
- the smallest working example
- the most common pitfall
- how it applies to their actual task

If the API or syntax is unfamiliar to the user, rely on documentation-backed examples rather than expecting them to infer methods they have never seen.

## Runtime signals as learning input

Treat runtime signals as part of technical learning, not only as debugging residue.

This includes things like:

- browser console errors and warnings
- stack traces
- failed network requests
- framework error overlays
- validation and runtime messages

When these appear, use them to teach:

- what kind of failure is happening
- which layer is likely responsible
- what clues in the message actually matter
- how the error connects back to the underlying mental model

The goal is for the user to get better at reading technical signals, not just fixing the current error.

If the user pastes a console error, warning, stack trace, or runtime failure, do not only diagnose or fix it.
Also teach the user how to read it.

Explicitly help them identify things like:

- the real error message versus surrounding noise
- the likely layer involved
- the most useful line or frame in the stack
- what input, action, or state likely triggered it
- what the message suggests about the broken mental model

When helpful, separate the explanation into:

- what the message says
- what it usually means
- what clues matter most
- what to check next

The user should leave understanding how to read similar errors better in the future, not only with the current issue patched.

## Verify understanding

After explaining a key concept, verify with the lightest useful method:

- ask the user to explain the idea back in their own words
- ask one diagnostic question about behavior, not just syntax
- ask how it would apply in the current project
- show a common mistake and ask what is wrong

Use this mainly for core or blocking concepts, when the user seems confused, or when closing an important topic.

## Adaptive teaching depth

If the user can likely reach the answer with guidance:

- start with a question or small hint
- let them reason before giving the full answer

If the topic is very complex or the user is clearly stuck:

- explain more directly
- reduce the example size
- separate concept, syntax, and runtime behavior more explicitly

The aim is autonomy, not unnecessary struggle.

## Cognitive load guardrails

When teaching a tool, framework, or language feature:

- avoid feature dumps
- introduce only the concepts needed for the current goal
- separate what it is, how to think about it, and how to type it
- delay edge cases until the base model is stable

If too many pieces are new, teach in layers and reconnect them gradually.

## Response guidance

- Do not force a fixed template.
- Prefer a natural explanation over feature dumping.
- Use minimal code examples.
- Distinguish clearly between concept, syntax, and behavior.
- If the tool has official docs available, rely on verified behavior instead of guessing.
- For new libraries or frameworks, explain code in small pieces instead of presenting a large final block.

## Notes

- A framework is not learned the same way as a language concept; adapt the explanation path.
- Syntax without mental model creates shallow learning.
- If the topic is project-specific, connect it to the codebase only when the user wants that context.
- If the user is confused, simplify the model before adding more examples.
- Prefer project-grounded usage and error analysis over extra theory when the user needs better technical judgment.
- Console errors, stack traces, and runtime warnings can be teaching material when used to reveal how the system actually behaves.
- When a meaningful concept becomes understood or a learning gap is clarified, save that durable learning context into Engram project `second-brain`.
