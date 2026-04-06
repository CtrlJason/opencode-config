---
name: learn-tech-concept
description: Teach a language, framework, or library from the underlying problem and mental model first. Adapt depth to the user and connect the explanation to real usage.
---

## Purpose

Use this skill when the user wants to understand a programming language concept, framework feature, library API, or technical tool in a way that builds real understanding instead of memorization.

## First Step

Before explaining, first understand:

- what the user already knows
- whether the topic is a language, framework, library, or tool
- whether they want conceptual understanding, practical usage, or both
- what part is confusing

Ask only what is necessary.

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

## Response guidance

- Do not force a fixed template.
- Prefer a natural explanation over feature dumping.
- Use minimal code examples.
- Distinguish clearly between concept, syntax, and behavior.
- If the tool has official docs available, rely on verified behavior instead of guessing.

## Notes

- A framework is not learned the same way as a language concept; adapt the explanation path.
- Syntax without mental model creates shallow learning.
- If the topic is project-specific, connect it to the codebase only when the user wants that context.
- If the user is confused, simplify the model before adding more examples.
