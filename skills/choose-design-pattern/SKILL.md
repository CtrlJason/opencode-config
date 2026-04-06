---
name: choose-design-pattern
description: Help the user understand and choose design patterns from the real problem first. Start by understanding what the user already knows and whether a pattern is even needed.
---

## First Step

Before explaining or recommending a pattern, first understand the user's level and the actual problem.

Ask only what is necessary.

Examples:

```
Antes de explicarte algo sobre patrones de diseño, necesito saber:

1. ¿Ya sabes qué es un patrón de diseño? (sí/no)
2. ¿Hay algo específico que quieras aprender? (patrón concreto / problema en tu código / ninguno)
3. ¿Tienes un problema en el código que quieres resolver?
```

If user is unsure or confused, start from zero.

## Conditional Verification Rule

If the user says they already applied the pattern in this project:
- first check Engram for prior research/context
- then inspect the relevant project code to verify how it is actually used
- only after that, explain whether the application is correct or needs adjustment

If the user has not said they already applied it:
- ask first whether they want theory, a concrete pattern, or help with a code problem
- do not pull extra context unless it actually matters to the recommendation

If the user is actively implementing and asks about the pattern as part of the current change, keep the answer tied to that code path instead of giving a generic pattern lecture

## Priority Rule

When choosing or explaining a pattern:

1. Check project context first when the pattern may already be in use.
2. Focus on the real problem the pattern solves.
3. Compare against the simplest viable alternative.
4. Only recommend the pattern if it clearly improves the code or flow.
5. If the simplest solution is enough, say so clearly.

## Teaching intent

This skill should not only identify patterns.
It should help the user:

- see the real problem before naming a solution
- distinguish a classic pattern from a simple refactor or basic code organization
- detect when no pattern is needed
- judge the clarity, maintenance, and abstraction cost of introducing a pattern

The goal is better design judgment, not broader pattern vocabulary.

## Core rule

Do not start from the catalog of patterns.

Start from:

1. the concrete problem
2. the constraints of this project
3. the simplest viable solution

Only then evaluate whether a pattern helps.

## Pattern reality check

Before recommending a pattern, ask these questions internally:

- is this actually a recurring design problem or just a local code smell?
- is a pattern solving the problem, or would a simpler refactor solve it?
- would introducing the pattern improve clarity, or mostly add abstraction?
- is the user identifying a real need, or trying to force the problem into a familiar label?

If the pattern mainly adds indirection, naming overhead, or premature structure, reject it.

## False-pattern detector

Actively watch for weak moves such as:

- wanting a pattern because it sounds more professional
- forcing the problem to fit a known pattern name
- adding interfaces, layers, or abstractions before they are needed
- turning a readable solution into a more obscure one for architectural neatness

If you detect one of these, say so directly and explain the cost.

## If User Doesn't Know What Design Patterns Are

Start from absolute basics:

### ¿Qué es un patrón de diseño?

Imagina que tienes una colección de recetas de cocina. No son reglas estrictas, pero son soluciones probadas que funcionan bien para ciertos tipos de platos.

Los patrones de diseño son igual, pero para programar. Son soluciones típicas a problemas típicos que los desarrolladores han descubierto a lo largo de décadas.

**No son:**
- Reglas obligatorias
- Código listo para copiar
- Algo que "debes" usar siempre

**Son:**
- Plantillas de solución
- Maneras de pensar sobre problemas
- Herramientas para cuando las necesitas

### Ejemplo simple

Si tienes una función muy larga que hace muchas cosas, ¿qué haces?

**Sin patrón**: Dejas todo ahí porque funciona
**Con patrón**: Aplicas "Extract Method" para dividirla en partes

Ese "Extract Method" es un refactoring, no un pattern clásico, pero la idea es la misma: cuando identificas un problema, existe una solución conocida.

## If User HAS a Specific Problem

Then follow this process:

1. **Identificar el problema real** - No el patrón, el problema concreto en el código
2. **Explicar en palabras simples** - Sin jargon técnico
3. **Comparar con la solución más simple** - Antes de proponer un patrón
4. **Evaluar qué se gana y qué se pierde** - Claridad, mantenimiento, flexibilidad, complejidad
5. **Pedir permiso para dar más detalles** - "¿Quieres que profundice?"

If the answer depends on whether the pattern is already in the code, verify the implementation before teaching it.

## If User Asks About a Specific Pattern

Follow learning approach:

### Step 1: Simple explanation (2-3 sentences)
- What does it do in plain language?
- Use an analogy from everyday life

### Step 2: Why it exists
- What problem does it solve?
- Why was it invented?

### Step 3: When to use it
- Concrete examples
- Real scenarios in a project like this

### Step 4: Code example (minimal)
- Keep it simple
- Show only the essential part

### Step 5: When NOT to use it
- Clear warnings about over-engineering
- When it's overkill

### Step 6: Simpler alternative
- What would be the lighter solution if the pattern is unnecessary

### Step 7: Cost of introducing it
- What clarity, maintenance, or abstraction cost it adds
- What project conditions would justify paying that cost

## Understanding check

Do not assume that learning the pattern name means the user understood the design decision.

When the topic matters, verify with one light check such as:

- ask what concrete problem the pattern solves here
- ask whether a pattern is really needed or not
- ask what simpler alternative they would use instead
- ask what clarity or simplicity would be lost by introducing the pattern

Use the check that best fits the context and the user's current confusion.

## Recommendation shape

Default to an ending that includes:

- whether a pattern is needed or not
- the most important real-world impact on clarity, maintenance, or flexibility
- what would need to change for the pattern to become worth it later

This keeps the conclusion useful and teaches when the answer could change.

## The 22 Classic Patterns (Reference)

Only show this if user asks for it or already knows basics:

### Creational (5)
Factory Method, Abstract Factory, Builder, Prototype, Singleton

### Structural (7)
Adapter, Bridge, Composite, Decorator, Facade, Flyweight, Proxy

### Behavioral (10)
Chain of Responsibility, Command, Iterator, Mediator, Memento, Observer, State, Strategy, Template Method, Visitor

## Key Principles

1. **Never assume prior knowledge**
2. **Start simple, go deeper only if asked**
3. **Tie to real problems, not abstract theory**
4. **Prefer simple solutions over patterns**
5. **If pattern adds complexity without clear need, reject it**
6. **Do not recommend a pattern just because it matches a familiar name**
7. **Teach the tradeoff, not just the pattern**
8. **No pattern needed is a valid and often strong conclusion**
9. **Pattern vocabulary is less important than problem diagnosis**

## Response guidance

- Do not force a fixed template.
- Keep the explanation tied to the user's problem or learning goal.
- Use the smallest amount of theory needed to help the user decide well.
- If no pattern is needed, say that directly.
- Prefer clarity over architectural elegance.
- If a pattern hurts readability in this project stage, call that out explicitly.
