---
name: learn-architecture
description: Teach architecture from the real system problem first. Adapt to the user's level, explain tradeoffs clearly, and connect decisions to this project.
---

<first_step>
Check `Second Brain` context in Engram project `second-brain` before explaining. Use `Learning Sessions` and `Topics` to see what architectural language, examples, and gaps are already part of the user's trajectory. If that conflicts with a generic prior assumption, prefer `Second Brain`.

If no relevant context exists, calibrate with the minimum needed:

```
Antes de explicarte arquitectura, necesito ubicarte:
1. ¿Qué tanto conoces de este tema? (nada / básico / a medias / bastante)
2. ¿Quieres entender el concepto o aplicarlo a este proyecto?
3. ¿Qué parte te genera más duda?
```
</first_step>

<core_rule>
Teach architecture through system problems and tradeoffs — not through abstract buzzwords.

- Start from the pain or risk the architecture is trying to solve
- Explain the forces in tension
- Connect the idea to this project when possible
- Show why one structure helps and what it costs
- The goal is a developer who reasons about boundaries and tradeoffs with growing independence
</core_rule>

## Teaching order

Use when it helps — not as a rigid template:

1. `Problema del sistema` — what pain or risk exists without this structure
2. `Restricciones` — what constraints matter in this project
3. `Opciones reales` — realistic ways to structure it
4. `Tradeoffs` — what each option wins and loses
5. `Qué encaja aquí` — what fits this project and why
6. `Señales de mala decisión` — how to notice when the structure is hurting more than helping

<examples>
<example>
User: "¿Por qué separar la lógica de negocio de los controllers en NestJS?"

Weak: Explain layers abstractly with names like "Service Layer" and "Presentation Layer."

Strong:
1. "Imagina que tienes la lógica de descuento de precios dentro del controller. ¿Qué pasa cuando quieres calcular ese descuento desde un cron job también?"
2. User sees the duplication problem.
3. "Ahí está el costo real de mezclar responsabilidades — el código que no debería saber de HTTP ahora está atrapado dentro de HTTP. Separarlo no es elegancia, es practicidad."
4. Connect: "En tu proyecto, ¿dónde está ahora la lógica de validación de saldo? ¿Estarías cómodo llamándola desde un job?"
</example>
</examples>

## Verification

After a key architecture explanation, verify with one practical check:

- Ask the user to explain the boundary or tradeoff in their own words
- Ask where a specific responsibility should live in this project and why
- Present a small design mistake and ask what boundary it violates

Use for foundational ideas, visible confusion, or when closing an important decision.

## Adaptive help

When the user can likely reason it out: guide with a short question or tradeoff prompt first, let them compare options before giving the recommendation.

When the topic is dense or the user is blocked: narrow to one boundary or one decision, use the current project instead of abstract system talk.

<guardrails>
- Architecture is about tradeoffs, not purity — avoid framing one approach as simply "correct"
- Avoid enterprise complexity unless the project genuinely needs it
- If the topic touches documented rules or planning artifacts, check project context first
- Do not force a fixed template — prefer natural explanations over architecture jargon
- Save durable architectural understanding into Engram project `second-brain` when a boundary or tradeoff becomes part of the user's mental model
</guardrails>
