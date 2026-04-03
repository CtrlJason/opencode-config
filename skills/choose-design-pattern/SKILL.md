---
name: choose-design-pattern
description: Evaluate which design pattern fits a specific problem, explain why it exists, how it works, and whether it should be used in this project.
---

## Purpose

Use this when deciding whether a design pattern should be used for a real problem in the project.

## Decision rules

1. Start from the concrete problem, not the pattern name.
2. Explain the pattern in simple terms first.
3. Cover this order:
   - what problem it solves
   - why the pattern exists
   - how it works
   - when to use it
   - when not to use it
   - how it would look in this project
4. Compare it with the simplest viable alternative.
5. Prefer the least complex option that solves the real problem.
6. If the pattern adds complexity without a current need, reject it.

## Default output format

- `Problema real`
- `Patrón candidato`
- `Qué resuelve`
- `Cómo funciona`
- `Cuándo sí`
- `Cuándo no`
- `Cómo se vería aquí`
- `Qué tomar`

## Notes

- Do not recommend patterns just because they are well known.
- Tie every recommendation to the current sprint, current codebase, and documented domain rules.
