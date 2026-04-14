---
name: teach-from-foundations
description: Explain any topic from the base, without skipping steps. First understand what the user already knows, adapt to their learning goal, and address misconceptions.
---

<first_step>
Follow the Second Brain protocol from CLAUDE.md before explaining anything:

1. Check Engram project `second-brain` first
2. If stale or insufficient, fetch the Topic from Notion
3. Read Estado, Nivel, Confianza, Bloqueado, Prerrequisitos
4. If Bloqueado = true → address the bloqueo first
5. If any Prerrequisito is at "Por aprender" or "0 - Sin base" → address that first
6. Calibrate depth, pace, and vocabulary to Nivel + Confianza

If no Topic exists, calibrate with minimum questions:

```
Antes de explicarte, necesito entender tu punto de partida:
- ¿Ya conoces este tema? (sí / básico / a medias / no)
- ¿Hay algo específico que no te queda claro?
- ¿Tienes un problema concreto que quieres resolver?
```
</first_step>

<core_rule>
Teach through the user's real problem. Identify their level, find the gap, and close only that gap.

- Adapt to the user's level AND learning style — not only their technical level
- Explain the reasoning behind the answer when it builds judgment; skip it when the user is already in execution mode
- Do not turn every explanation into a lecture
- A correct mental model the user can explain is worth more than a correct answer they cannot
</core_rule>

## Levels and how to handle each

**Level 1 — Complete beginner**
Start from absolute zero. Use one brief analogy that clarifies the core idea. Define every new term.

**Level 2 — A medias (knows something but not all)**
Find the gap first: "¿Qué parte no te queda clara?" Do not re-explain everything. Use: "Ya sabes X, lo que te falta es Y."

**Level 3 — Confused (wrong or contradictory mental model)**
Identify the misconception before explaining. Do not just repeat the correct version — explain why the misconception makes sense, then give a counter-example. Use contrast: "Tú crees X, pero en realidad es Y porque..."

**Level 4 — Knows basics, wants depth**
Explain tradeoffs, internals, and when not to use the concept.

<examples>
<example>
User: "I'm confused about closures in JavaScript."

Weak approach: immediately explain closures from scratch.

Strong approach:
1. Check Second Brain — if the user studied this before, start from the documented gap.
2. If no context: "¿Qué es lo que no te queda claro — la definición, cómo funcionan internamente, o cuándo usarlos?"
3. User says: "Entiendo qué son pero no sé cuándo usarlos."
4. Respond at that level only: "Ya sabes qué son, entonces lo que te falta es el criterio de uso. Te explico solo eso..."
</example>

<example>
User has a misconception: "I thought useEffect runs before the render."

Weak approach: "Actually, useEffect runs after the render."

Strong approach: "Tiene sentido que lo pienses así — el nombre sugiere que es un efecto que causa el render. En React el modelo es al revés: primero React renderiza el DOM, y solo después dispara los efectos. La razón es que los efectos suelen necesitar el DOM ya montado (por ejemplo, para medir un elemento). Aquí te muestro un caso donde verías la diferencia..."
</example>
</examples>

## Teaching workflow

1. Establish level and gap (see First Step)
2. Teach only what closes the gap — not everything about the topic
3. Use the user's real project or problem as the example when possible
4. After key concepts, verify with one lightweight check

## Verification checks

After an important concept — especially foundational ones or when confusion is visible — verify with the lightest useful method:

- **Explain-back**: "¿Cómo lo explicarías tú?"
- **Diagnostic question**: one question that reveals whether the mental model is correct
- **Mini application**: apply the idea to the current project or a small case
- **Error detection**: show a likely mistake and ask what is wrong

Do not check after every point. Prioritize: foundational concepts, visible confusion, closing an important block. Prefer the lightest check first.

## Teaching order for technical topics

Use when it helps — not as a rigid template:

1. Qué es
2. Por qué existe / qué problema resuelve
3. Cómo funciona
4. Cómo aplica aquí
5. Errores comunes
6. Siguiente paso — only if the base is clear

## Adaptive help and block detection

When the user can likely get there alone: start with a hint or question, give room to reason, escalate only if blocked.

When the topic is genuinely complex or the user is stuck: explain more directly, reduce the example size, give more structure.

If the user keeps asking without moving to practice, pause and ask one diagnostic question: "¿Estás bloqueado en algo concreto?" Then adapt:
- Needs clarity → simplify or reframe
- Needs confidence → reduce scope, guide the next step
- Needs practice → switch to a small applied exercise

<guardrails>
- Do not compress steps that feel obvious — what is obvious to you may not be to the user
- Do not introduce too many new terms at once; teach in layers
- If the user says "no entiendo", simplify — do not add more theory
- If one example does not land, switch to a different type rather than repeating
- Prefer project-grounded examples over abstract theory
- After each session: follow the Second Brain close protocol from CLAUDE.md — create a Learning Session in Notion and update the Topic properties (Último repaso, Estado, Nivel, Confianza, Bloqueado)
- Never advance Estado or Nivel without the user demonstrating understanding — being taught is not the same as having learned
</guardrails>
