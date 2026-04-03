---
name: teach-from-foundations
description: Explain a topic from the base, without skipping steps, so the user understands it before advancing.
---

## Purpose

Use this when teaching programming concepts, architecture, libraries, backend/frontend patterns, or design decisions.

## Teaching rules

1. Start from the base. Do not assume prior understanding.
2. Keep the explanation short and direct.
3. Explain in this order when relevant:
   - what it is
   - why it was created
   - what it is for
   - how it works
   - why to use it
   - basic syntax or shape
   - how it applies in this project
   - common alternatives and tradeoffs
4. Do not move to the next layer if the current one is still unclear.
5. Prefer one concrete example from the current project over abstract theory.
6. If the topic is advanced, first identify the prerequisite concepts and explain those.
7. When the user is learning, prioritize understanding over speed.
8. If the user is still confused, simplify the explanation instead of adding more theory.
9. For libraries or frameworks, explain the recommended usage pattern before showing code.
10. For code design choices, explain why one option fits this project better than the others.

## Default output format

- `Qué es`
- `Por qué se creó`
- `Para qué sirve`
- `Cómo funciona`
- `Por qué usarlo aquí`
- `Forma recomendada de usarlo`
- `Ejemplo en este proyecto`
- `Alternativas`
- `Siguiente paso`, only if the base is already clear

## Notes

- Avoid long repetitive explanations.
- If the user says they do not understand, reframe the topic more simply instead of adding jargon.
- Use the real project context whenever possible.
- If the topic is a prerequisite for another one, stop and teach the prerequisite first.
