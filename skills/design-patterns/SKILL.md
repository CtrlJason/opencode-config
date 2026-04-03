---
name: design-patterns
description: Evaluate and explain the 22 classic design patterns from refactoring.guru to solve real problems in the project.
---

## Purpose

Use this when the user asks about or needs to choose a design pattern for a specific problem.

## The 22 Classic Design Patterns

### Creational Patterns (5)

Provide object creation mechanisms that increase flexibility and reuse:

1. **Factory Method** - Defines interface for creating object, lets subclasses decide which class to instantiate
2. **Abstract Factory** - Creates families of related objects without specifying concrete classes
3. **Builder** - Constructs complex objects step by step
4. **Prototype** - Creates new objects by copying existing ones (cloning)
5. **Singleton** - Ensures only one instance of a class exists

### Structural Patterns (7)

Assemble objects and classes into larger structures:

6. **Adapter** - Converts interface of a class to another interface clients expect
7. **Bridge** - Separates abstraction from implementation so both can vary independently
8. **Composite** - Composes objects into tree structures for part-whole hierarchies
9. **Decorator** - Attaches additional responsibilities to objects dynamically
10. **Facade** - Provides unified interface to a set of interfaces in a subsystem
11. **Flyweight** - Uses sharing to support large numbers of fine-grained objects
12. **Proxy** - Provides placeholder for another object to control access

### Behavioral Patterns (10)

Algorithms and responsibility assignment between objects:

13. **Chain of Responsibility** - Passes request along chain of handlers until handled
14. **Command** - Encapsulates request as an object, allowing parameterization and queuing
15. **Iterator** - Provides way to access elements of collection sequentially
16. **Mediator** - Defines object that encapsulates how a set of objects interact
17. **Memento** - Captures and externalizes object's internal state for later restoration
18. **Observer** - Defines one-to-many dependency so when one changes, all dependents update
19. **State** - Allows object to alter behavior when its internal state changes
20. **Strategy** - Defines family of algorithms, encapsulates each one, makes them interchangeable
21. **Template Method** - Defines skeleton of algorithm, lets subclasses override specific steps
22. **Visitor** - Lets you define new operation without changing classes on which it operates

## Decision Process

1. Start from the **concrete problem**, not the pattern name
2. Explain the pattern in simple terms first
3. Cover this order:
   - What problem it solves
   - Why the pattern exists
   - How it works
   - When to use it
   - When NOT to use it
   - How it would look in this project (TypeScript/NestJS)
4. Compare with the simplest viable alternative
5. Prefer the least complex option that solves the real problem
6. If the pattern adds complexity without a current need, reject it

## Output Format

```
## Problema real
[Description of the actual problem from the codebase]

## Patrón candidato
[Pattern name from the 22 catalog]

## Qué resuelve
[What problem this pattern solves]

## Cómo funciona
[Simple explanation with code example]

## Cuándo sí
[Concrete use cases]

## Cuándo no
[When to avoid]

## Cómo se vería aquí
[TypeScript/NestJS code example for this project]

## Veredicto
[Use it / Don't use it - with clear reasoning]
```

## Notes

- Do not recommend patterns just because they are well known
- Tie every recommendation to the current sprint, current codebase, documented domain rules
- Reference refactoring.guru patterns: https://refactoring.guru/design-patterns/catalog
- Use TypeScript examples for frontend, TypeScript/NestJS for backend