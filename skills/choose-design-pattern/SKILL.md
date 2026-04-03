---
name: choose-design-pattern
description: Help user understand and choose design patterns using learning-first approach. ALWAYS start by understanding what the user already knows.
---

## CRITICAL: First Question (MUST ASK)

Before ANY pattern explanation, ALWAYS ask:

```
Antes de explicarte algo sobre patrones de diseño, necesito saber:

1. ¿Ya sabes qué es un patrón de diseño? (sí/no)
2. ¿Hay algo específico que quieras aprender? (patrón concreto / problema en tu código / ninguno)
3. ¿Tienes un problema en el código que quieres resolver?
```

DO NOT skip this step. If user is unsure or confused, start from zero.

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
3. **Pedir permiso para dar más detalles** - "¿Quieres que profundice?"

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

## Output Format (when explaining a specific pattern)

```
## Explicación simple
[2-3 sentences - no jargon]

## Por qué existe
[What pain it solves]

## Ejemplo cotidiano
[Real-world analogy]

## Cuándo usarlo
[Concrete scenarios]

## Cuándo NO usarlo
[Warnings]

## Ejemplo de código (minimal)
[Only if user asks or already understands]
```