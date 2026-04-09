---
name: sdd-domain-validation
description: Validate domain changes before implementation so feature, refactor, issue, and testing work stays consistent with project rules.
---

<core_rule>
Use this skill when a change may affect domain behavior, business rules, entity state, persistence rules, or planning artifacts that could distort domain meaning.

The goal is not only protecting the domain — it is helping the user understand why the rule exists, what it constrains, and what breaks when it is misunderstood.

Do not use this skill for changes clearly outside domain meaning: environment config, pure utility extraction, styling, or administrative doc edits that cannot affect business logic.
</core_rule>

<first_step>
Before validating, identify whether the change touches domain meaning or only technical structure.

If it touches domain, check:
1. Project documentation or SDD context when available
2. Notion as source of truth for stories, epics, sprints, or backlog items
3. Whether the operation is truly `delete`, `close`, `deactivate`, `archive`, or another domain action — naming matters

Do not inspect code unless the user asks or the implementation state is required to resolve the domain question.
</first_step>

## Core domain checklist

Before implementation, confirm whether the change alters any of these:

1. Domain state or lifecycle of an entity
2. Business invariants
3. Data persistence rules
4. Ownership or permissions
5. Interactions between entities

For docs/planning changes, also confirm whether it alters:

6. The written meaning of a story, epic, or backlog item
7. The terminology used to describe the domain
8. The relationship between planning artifacts and documented domain rules

If yes to any → validate the domain first.

<examples>
<example>
User wants to add a "delete wallet" button.

Weak: Immediately discuss the DELETE endpoint implementation.

Strong:
1. "Antes de implementar, ¿qué significa 'eliminar' una billetera en tu dominio? ¿Desaparece permanentemente, o se desactiva?"
2. User: "La verdad no lo hemos definido."
3. "Entonces lo que necesitas primero no es código — es esa decisión. Si un usuario elimina su billetera y tiene transacciones históricas, ¿qué pasa con ese historial?"
4. Surface the invariant: wallets with transaction history likely cannot be hard-deleted without breaking audit trails.
5. Recommend: model as `deactivate`, not `delete`. Document the rule before implementing.
</example>
</examples>

## Implementation quality link

Connect domain validation to implementation explicitly:

- Naming should reflect the real business action, not a technical shortcut
- Layer placement should match responsibility, not convenience
- Persistence behavior should reflect the true lifecycle of the entity
- Observable behavior in UI/API should match the source of truth

If the implementation idea violates one of these, name the mismatch directly.

## Completion check

When the user says they are done, verify:

- The domain rule was preserved
- The naming matches the real business action
- No planning artifact was rewritten in a way that changes domain meaning without confirmation
- The technical solution did not smuggle in a different domain meaning

## Output shape

When this skill is used, return:

- `Change type`
- `Affects domain?`
- `Domain rule to protect`
- `Source of truth checked`
- `Implementation impact`
- `Recommended action`

<guardrails>
- Do not rewrite domain logic, planning meaning, or terminology from intuition
- If a planning artifact conflicts with documented domain logic, stop, surface the conflict, and ask before editing
- If something is not truly deleted, do not call it delete
- If the change is ambiguous, ask one short question before deciding
</guardrails>
