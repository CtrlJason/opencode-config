---
name: teach-from-foundations
description: Explain any topic from the base, without skipping steps. First understand what the user already knows, adapt to their learning goal, and address misconceptions.
---

## First Step

Before explaining anything, establish the user's knowledge floor. Ask only the minimum needed:

```
Antes de explicarte, necesito entender tu punto de partida:
- ¿Ya conoces este tema? (sí / básico / a medias / no)
- ¿Hay algo específico que no te queda claro?
- ¿Tienes un problema concreto que quieres resolver?
```

If the user has already provided context about their level, use that — do not ask again.

## Core Rule

Teach through the user's real problem. Identify their level, find the gap, and close only that gap.

- Adapt to the user's level AND learning style — not only their technical level
- Explain the reasoning behind the answer when it builds judgment; skip it when the user is already in execution mode
- Do not turn every explanation into a lecture
- A correct mental model the user can explain is worth more than a correct answer they cannot

Use this skill when the user is missing the base model, is new to the topic, or is visibly confused about fundamentals.
Do not use this as the default for project-first practical learning once the base is already clear — hand off to `learn-tech-concept` or a learn-by-doing skill.

## Prompting Note

Do not try to improve teaching reliability by making instructions more aggressive or repetitive.
For agents, stronger wording alone is weak control. Prefer:

- sequential steps
- explicit output shape
- one-turn advance gates
- short examples
- a required lightweight check before moving on

For GPT-style agents specifically:

- more prompt lines do not reliably improve obedience
- long preference lists can dilute the active signal
- short local control blocks work better than broad repeated reminders

When behavior needs correction, prefer a task-local override like:

`For this turn only: one concept, max 4 short paragraphs, end with one check, then stop.`

instead of adding more global wording.

This skill is the reusable home for zero-to-one teaching behavior. Keep `AGENTS.md` minimal and stable; keep the teaching protocol here and keep user-specific preferences in memory.

## Levels and How to Handle Each

**Level 1 — Complete beginner**
Start from absolute zero. Use one brief analogy that clarifies the core idea. Define every new term.
Do not front-load the whole topic. Teach in small sequential parts and verify each part before moving on.

**Level 2 — A medias (knows something but not all)**
Find the gap first: "¿Qué parte no te queda clara?" Do not re-explain everything. Use: "Ya sabes X, lo que te falta es Y."

**Level 3 — Confused (wrong or contradictory mental model)**
Identify the misconception before explaining. Do not just repeat the correct version — explain WHY the misconception makes sense, then give a counter-example. Use contrast: "Tú crees X, pero en realidad es Y porque..."

**Level 4 — Knows basics, wants depth**
Explain tradeoffs, internals, and when not to use the concept.

## Examples

<example>
User: "I'm confused about closures in JavaScript."

Weak approach: Immediately explain closures from scratch.

Strong approach:
1. "¿Qué es lo que no te queda claro — la definición, cómo funcionan internamente, o cuándo usarlos?"
2. User says: "Entiendo qué son pero no sé cuándo usarlos."
3. Respond at that level only: "Ya sabes qué son, lo que te falta es el criterio de uso. Te explico solo eso..."
</example>

<example>
User has a misconception: "I thought useEffect runs before the render."

Weak approach: "Actually, useEffect runs after the render."

Strong approach: "Tiene sentido que lo pienses así — el nombre sugiere que es un efecto que causa el render. En React el modelo es al revés: primero React renderiza el DOM, y solo después dispara los efectos. La razón es que los efectos suelen necesitar el DOM ya montado. Aquí te muestro un caso donde verías la diferencia..."
</example>

## Teaching Workflow

1. Establish level and gap (see First Step above)
2. If the topic is new from zero, start with only the first useful slice, not the full map
3. Teach only what closes the gap — not everything about the topic
4. Use the user's real project or problem as the default example when possible
5. After each important slice, verify with one lightweight check before advancing

## Zero-To-One Rule

When the user is learning a new topic from zero:

1. Start from the smallest useful part
2. Explain that part briefly
3. Apply it immediately to the user's real project/problem
4. Check understanding
5. Only then move to the next part

Avoid giving the full taxonomy, full lifecycle, or all test types up front unless the user explicitly asks for the bigger picture.

## Zero-To-One Protocol

When the topic is new from zero, each teaching turn must follow this protocol:

1. Give exactly one new concept
2. Explain it in the minimum useful length
3. If helpful, add one tiny example
4. End with exactly one lightweight check
5. Stop

Advance gate:

- Do not move to the next concept until the user answers the check, asks to continue, or explicitly skips the check.
- Do not stack multiple new concepts in the same turn just because they are related.
- Do not jump to project code before the base concept is confirmed, unless the user explicitly asks to learn directly on the code.

Default output shape for zero-to-one teaching:

- `Qué es`
- `Por qué importa` or `Mini ejemplo`
- `Chequeo`

Keep the output compact. Prefer short paragraphs over long structured lectures.

## Handoff Rule

Switch away from this skill when:

- the user already understands the core concept and now wants practical usage
- the user wants to learn by applying the concept directly in the project
- the discussion is no longer about the base model but about reading APIs, library behavior, or implementation choices

Recommended handoff:

- `learn-tech-concept` for practical concept usage
- `read-runtime-signal` for errors, warnings, and stack traces
- `debugging` for hypothesis-test-fix work
- `learn-by-doing` for guided practice on the real project

## Teaching Order for Technical Topics

Use when it helps — not as a rigid template:

1. Qué es
2. Por qué existe / qué problema resuelve
3. Cómo funciona
4. Cómo aplica aquí
5. Errores comunes
6. Siguiente paso — only if the base is clear

## Verification Checks

After an important concept — especially foundational ones or when confusion is visible — verify with the lightest useful method:

- **Explain-back**: "¿Cómo lo explicarías tú?"
- **Diagnostic question**: one question that reveals whether the mental model is correct
- **Mini application**: apply the idea to the current project or a small case
- **Error detection**: show a likely mistake and ask what is wrong

Do not check after every point. Prioritize: foundational concepts, visible confusion, closing an important block.

Checks must be diagnostic, not ceremonial.

- Avoid multiple-choice questions when one option is obviously correct from the explanation you just gave
- Avoid restating the answer inside the question
- Prefer contrast questions, "what would break if...", "why not X instead of Y?", or tiny applications to the real project
- A good check should reveal whether the user can distinguish close ideas, not just repeat the last sentence

## Adaptive Help and Block Detection

When the user can likely get there alone: start with a hint or question, give room to reason, escalate only if blocked.

When the topic is genuinely complex or the user is stuck: explain more directly, reduce the example size, give more structure.

If the user keeps asking without moving to practice, pause and ask one diagnostic question: "¿Estás bloqueado en algo concreto?" Then adapt:
- Needs clarity → simplify or reframe
- Needs confidence → reduce scope, guide the next step
- Needs practice → switch to a small applied exercise

## Guardrails

- Do not compress steps that feel obvious — what is obvious to you may not be to the user
- Do not introduce too many new terms at once; teach in layers
- If the user says "no entiendo", simplify — do not add more theory
- If one example does not land, switch to a different type rather than repeating
- Prefer project-grounded examples over abstract theory
