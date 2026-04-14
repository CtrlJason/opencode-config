---
name: learn-tech-concept
description: Teach a language concept, framework, or library from the underlying problem and mental model first. Adapt depth to the user and connect the explanation to real usage.
---

<first_step>
Follow the Second Brain protocol from CLAUDE.md before explaining anything:

1. Check Engram project `second-brain` first
2. If stale or insufficient, fetch the Topic from Notion
3. Read Estado, Nivel, Confianza, Bloqueado, Prerrequisitos
4. If Bloqueado = true → address the bloqueo first
5. If any Prerrequisito is at "Por aprender" or "0 - Sin base" → address that first
6. Calibrate depth and pace to Nivel + Confianza

If no Topic exists, calibrate with the minimum needed:

```
Antes de explicarte esto, necesito ubicar tu punto de partida:
1. ¿Qué tanto conoces de este tema? (nada / básico / a medias / bastante)
2. ¿Quieres entender la idea, aprender a usarlo, o ambas?
3. ¿Qué parte te confunde más?
```
</first_step>

<core_rule>
Teach the mental model first, then the syntax or API.

- Explain what problem the thing solves before showing how to use it
- Stay concise unless the user asks for depth
- Prefer understanding over listing features
- If the user already knows the building blocks, guide with questions rather than writing the solution
- Do not dump code early — for new tools, show small fragments explained part by part
</core_rule>

## Teaching path for a library or framework

Use when it helps — not as a rigid template:

1. Qué es
2. Para qué sirve / qué problema resuelve
3. Modelo mental
4. Conceptos base
5. Cómo se usa (minimal example)
6. Cuándo conviene / cuándo no
7. Errores comunes
8. Cómo encaja aquí

## Teaching path for a language concept

1. Qué es
2. Qué problema resuelve
3. Cómo piensa el lenguaje sobre esto
4. Sintaxis mínima + semántica real
5. Ejemplo simple
6. Error común
7. Cuándo usarlo / cuándo evitarlo

<examples>
<example>
User: "Quiero aprender NestJS."

Weak: Start explaining NestJS architecture immediately.

Strong:
1. Check Second Brain — if the user knows Express or Spring, start from that analogy.
2. "¿Conoces algún framework backend? ¿Buscas entender la idea o quieres usarlo en el proyecto ya?"
3. User: "Conozco Express, quiero usarlo en el proyecto."
4. Start from: "NestJS es Express por debajo, pero con estructura forzada. La diferencia clave es..."
5. Show a minimal working example, explain each part before moving to the next.
</example>

<example>
User: "No entiendo qué es un Promise."

Weak: Paste the full Promise API.

Strong:
1. Check Second Brain — has the user studied async before?
2. If no context: "¿Sabes qué es código asíncrono, o empezamos desde ahí?"
3. User: "No muy bien."
4. Start from the problem: "Imagina que le pides a alguien que te traiga un archivo. No te quedas parado esperando — sigues haciendo otras cosas. Un Promise representa esa promesa de que el resultado llegará..."
5. Only then: syntax, `.then()`, `.catch()`, error cases.
</example>
</examples>

## Verification

After key concepts, verify with the lightest useful method:

- Ask the user to explain the idea back
- Ask one diagnostic question about behavior, not syntax
- Show a common mistake and ask what is wrong

Use for core or blocking concepts, visible confusion, or when closing an important topic.

## Adaptive depth

When the user can likely reach the answer with guidance: start with a hint, let them reason first, escalate only if blocked.

When the topic is complex or the user is stuck: explain more directly, reduce the example size, separate concept from syntax explicitly.

<guardrails>
- For new libraries or frameworks, show code in small pieces — never a large final block first
- If the API or syntax is unfamiliar, back explanations with docs rather than asking the user to infer
- If the user pastes a console error, stack trace, or runtime failure, use `read-runtime-signal` instead
- After each session: follow the Second Brain close protocol from CLAUDE.md — create a Learning Session in Notion and update the Topic properties (Último repaso, Estado, Nivel, Confianza, Bloqueado)
- Never advance Estado or Nivel without the user demonstrating understanding — being taught is not the same as having learned
</guardrails>
