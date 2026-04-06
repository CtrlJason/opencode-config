---
name: learn-architecture
description: Teach architecture from the real system problem first. Adapt to the user's level, explain tradeoffs clearly, and connect decisions to this project.
---

## Purpose

Use this skill when the user wants to understand architecture concepts, module boundaries, layering, responsibilities, system design decisions, or how parts of the project should fit together.

## First Step

Before explaining architecture, first understand:

- what the user already knows
- what system or problem they are trying to understand
- whether they want fundamentals, a project-specific explanation, or a decision analysis

Ask only what is necessary.

Examples:

```
Antes de explicarte arquitectura, necesito ubicarte un poco:

1. ¿Qué tanto conoces de este tema? (nada / básico / a medias / bastante)
2. ¿Quieres entender el concepto o aplicarlo a este proyecto?
3. ¿Qué parte te genera más duda?
```

## Core idea

Teach architecture through system problems and tradeoffs, not through abstract buzzwords.

- start from the problem the architecture is trying to solve
- explain the forces in tension
- connect the idea to this project when possible
- show why one structure helps and what it costs
- stay concise unless the user asks for depth
- aim for the user to reason about boundaries and tradeoffs with growing independence

## When to use

Use this skill for topics like:

- layers and boundaries
- modules and responsibilities
- coupling and cohesion
- separation of concerns
- data flow across parts of the system
- architectural styles and tradeoffs
- why a part of the project is structured a certain way

## Teaching order

Use this order when it helps:

1. `Problema del sistema` - what pain or risk exists
2. `Restricciones` - what matters in this project
3. `Opciones reales` - realistic ways to structure it
4. `Tradeoffs` - what each option wins and loses
5. `Qué encaja aquí` - what fits this project and why
6. `Señales de mala decisión` - how to notice when the structure is hurting more than helping

## If the user wants fundamentals

Explain in this style:

- what the concept is
- why it exists
- what problem it prevents
- a simple system example
- how it maps to this project

## If the user wants project-specific learning

Explain in this style:

- what the relevant parts of the project are
- what responsibility each part should own
- where boundaries should exist
- what mistakes would blur those boundaries

## Verify understanding

After a key architecture explanation, verify with one practical check such as:

- ask the user to explain the boundary or tradeoff in their own words
- ask where a responsibility should live in this project and why
- present a small design mistake and ask what boundary it violates
- ask which option they would choose and what cost they accept

Use checks for foundational architecture ideas, visible confusion, or when closing an important decision thread.

## Adaptive help

If the user can likely reason it out:

- guide with a short question or tradeoff prompt first
- let them compare options before giving the recommendation

If the architecture topic is dense or the user is blocked:

- narrow the scope to one boundary or one decision
- explain the responsibilities more directly
- use the current project instead of abstract system talk

The goal is judgment-building, not jargon exposure.

## Cognitive load guardrails

When multiple architectural concerns are in play:

- do not teach all layers, flows, and tradeoffs at once
- focus first on the decision that is actually blocking the user
- introduce new terms only when needed
- expand from one concrete boundary to the wider system gradually

If the user is overloaded, reduce abstraction and return to the real project problem.

## Response guidance

- Do not force a fixed template.
- Prefer natural explanations over architecture jargon.
- Use structure only when it improves clarity.
- Teach the reasoning behind the structure, not just the conclusion.
- If the simplest design is enough, say so clearly.

## Notes

- Architecture is about tradeoffs, not purity.
- Avoid enterprise complexity unless the project really needs it.
- If the topic touches documented rules or planning artifacts, check project context first.
- If context is missing, ask one short question before going deeper.
- Prefer concrete boundary mistakes, implementation placement, and project-specific consequences over abstract architecture lectures when possible.
