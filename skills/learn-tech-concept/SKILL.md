---
name: learn-tech-concept
description: Teach a language concept, framework, or library from the underlying problem and mental model first. Adapt depth to the user and connect the explanation to real usage.
---

## First Step

Before explaining, establish the user's baseline. Ask only the minimum needed:

```
Antes de explicarte esto, necesito ubicar tu punto de partida:
1. ¿Qué tanto conoces de este tema? (nada / básico / a medias / bastante)
2. ¿Quieres entender la idea, aprender a usarlo, o ambas?
3. ¿Qué parte te confunde más?
```

If the user has already provided context about their level, use that — do not ask again.

## Core Rule

Teach the mental model first, then the syntax or API.

- Explain what problem the thing solves before showing how to use it
- Stay concise unless the user asks for depth
- Prefer understanding over listing features
- If the user already knows the building blocks, guide with questions rather than writing the solution
- Do not dump code early — for new tools, show small fragments explained part by part

## Teaching Path for a Library or Framework

Use when it helps — not as a rigid template:

1. Qué es
2. Para qué sirve / qué problema resuelve
3. Modelo mental
4. Conceptos base
5. Cómo se usa (minimal example)
6. Cuándo conviene / cuándo no
7. Errores comunes
8. Cómo encaja aquí

## Teaching Path for a Language Concept

1. Qué es
2. Qué problema resuelve
3. Cómo piensa el lenguaje sobre esto
4. Sintaxis mínima + semántica real
5. Ejemplo simple
6. Error común
7. Cuándo usarlo / cuándo evitarlo

## Examples

<example>
User: "Quiero aprender NestJS."

Weak approach: Start explaining NestJS architecture immediately.

Strong approach:
1. "¿Conoces algún framework backend? ¿Buscas entender la idea o quieres usarlo en el proyecto ya?"
2. User: "Conozco Express, quiero usarlo en el proyecto."
3. Start from: "NestJS es Express por debajo, pero con estructura forzada. La diferencia clave es que NestJS te obliga a organizar el código en módulos, controllers y services desde el inicio..."
4. Show a minimal working example, explain each part before moving to the next.
</example>

<example>
User: "No entiendo qué es un Promise."

Weak approach: Paste the full Promise API.

Strong approach:
1. "¿Sabes qué es código asíncrono, o empezamos desde ahí?"
2. User: "No muy bien."
3. Start from the problem: "Imagina que le pides a alguien que te traiga un archivo. No te quedas parado esperando — sigues haciendo otras cosas. Un Promise representa esa promesa de que el resultado llegará..."
4. Only then: syntax, `.then()`, `.catch()`, error cases.
</example>

## Verification

After key concepts, verify with the lightest useful method:

- Ask the user to explain the idea back in their own words
- Ask one diagnostic question about behavior, not syntax
- Show a common mistake and ask what is wrong

Use for core or blocking concepts, visible confusion, or when closing an important topic.

## Adaptive Depth

When the user can likely reach the answer with guidance: start with a hint, let them reason first, escalate only if blocked.

When the topic is complex or the user is stuck: explain more directly, reduce the example size, separate concept from syntax explicitly.

## Guardrails

- For new libraries or frameworks, show code in small pieces — never a large final block first
- If the API or syntax is unfamiliar, back explanations with official documentation rather than asking the user to infer
- If the user is confused, simplify the model before adding examples
- If the user pastes a console error, stack trace, or runtime failure, switch to the `read-runtime-signal` skill instead
