---
name: sdd-domain-validation
description: Validate domain changes before implementation so feature, refactor, issue, and testing work stays consistent with project rules.
---

## Purpose

Use this skill when a change may affect domain behavior, business rules, entity state, persistence rules, feature flow, or planning/documentation artifacts that could distort domain meaning.

This skill should not only protect the domain.
It should also help the user understand why the rule exists, how it affects implementation quality, and what risks appear when the domain is interpreted incorrectly.

## When to use

Use this skill when the user is about to work on something like:

- feature work that changes business behavior (`feat`)
- refactors that could affect rules or data flow (`refactor`)
- bug fixes tied to domain inconsistencies (`fix`)
- tests that need domain expectations clarified (`test`)
- maintenance work that still affects the domain (`chore`)
- documentation updates that reflect or could distort real domain rules (`docs`)
- edits to stories, epics, sprints, backlog items, or planning artifacts when they may change domain meaning
- performance changes that alter behavior or invariants (`perf`)
- formatting or non-behavioral cleanup only when it touches domain files (`style`)
- build or CI changes that can impact validation of domain rules (`build`, `ci`)
- state changes like open/close/activate/deactivate/delete

## When NOT to use

Do not use this skill for changes that are clearly outside domain validation, such as:

- database configuration
- environment configuration
- pure utility extraction with no business meaning
- styling or presentational UI changes
- simple helper functions with no domain impact
- planning or documentation edits that are purely administrative and cannot affect domain meaning

## Scope boundary

Only apply this skill when the change can affect the meaning of the domain, not just the technical shape of the code or the wording of an artifact.

Usually outside scope:

- environment or database configuration
- pure utility extraction with no business meaning
- formatting-only, naming-only, or docs-only changes that do not change behavior or domain meaning

## Core rule

Before implementation, identify whether the change alters any of these:

1. domain state
2. business invariants
3. data persistence rules
4. ownership or permissions
5. lifecycle meaning of an entity
6. interactions between entities

If the task is in docs/planning, also identify whether it alters any of these:

7. the written meaning of a story, epic, sprint, or backlog item
8. the terminology used to describe the domain
9. the relationship between planning artifacts and documented domain rules

If yes, validate the domain first.

## Teaching intent

When this skill is used, do not stop at "this is the rule".

Also teach:

- why the rule exists in the business or product meaning
- what implementation decisions it constrains
- what would likely break if the rule is misunderstood
- how naming, layering, persistence, and permissions should reflect the real domain meaning

The goal is not only correct validation now, but better domain judgment from the user over time.

## Workflow

1. Identify the change type: `feat`, `refactor`, `issue`, or `testing`.
2. Determine if the change touches domain meaning or only technical structure.
3. If it touches domain, list the affected entities and rules.
4. Check the project documentation or SDD context when available.
5. If the task touches stories, epics, sprints, backlog items, or documentation, read the documented business meaning first and treat Notion as the source of truth.
6. Do not inspect code unless the user asks for it or the implementation state is required to resolve the domain question.
7. Decide whether the operation is really `delete`, `close`, `deactivate`, `archive`, or another domain action.
8. If a planning or documentation artifact conflicts with documented domain logic, stop, surface the conflict, and ask before editing.
9. Propose the safest next step.
10. If the user says they think the work is finished, run a completion check before accepting it.

## Documentation interpretation guard

If a story, epic, backlog item, or other documentation artifact is ambiguous:

1. point to the exact ambiguous phrase or decision
2. separate documented facts from current inference
3. ask one short question that resolves the ambiguity if possible

Do not silently fill domain gaps with intuition.
If there are multiple plausible readings, say so clearly before recommending implementation.

## Implementation quality link

Connect domain validation to implementation quality explicitly:

- naming should reflect the real business action, not a technical shortcut
- layer placement should match responsibility, not convenience
- persistence behavior should reflect the true lifecycle of the entity
- permissions and ownership should match the documented business rule
- observable behavior in UI/API should match the meaning described in the source of truth

If the implementation idea violates one of these, explain the mismatch directly.

## Understanding check

Do not assume that reading the documentation means the user understood the domain.

For important or risky domain topics, verify understanding with one light check such as:

- ask the user to summarize the domain rule in their own words
- ask how the rule affects naming, layers, or persistence
- ask what risk appears if the rule is implemented the wrong way
- ask the user to distinguish the business action from the technical action

Use the lightest check that helps the user build judgment without turning the flow into bureaucracy.

## Completion check

When the user says they think they are done, verify:

- the domain rule was preserved
- the change matches the requirement
- the layer boundaries still make sense
- no obvious inconsistency was introduced
- the naming matches the real behavior
- the implementation does not hide a domain mismatch
- no planning or documentation artifact was rewritten in a way that changes domain meaning without confirmation

Also verify:

- the chosen names still describe the real business action
- the implementation respects the responsibility of each layer
- the technical solution did not smuggle in a different domain meaning

If something is off, report it clearly and suggest the smallest fix.

## Output format

When this skill is used, return:

- `Change type`
- `Affects domain?`
- `Affected entities`
- `Domain rule to protect`
- `Source of truth checked`
- `Implementation impact`
- `Risk if misunderstood`
- `Recommended action`
- `Next step`

## Notes

- Prefer the domain term that matches the real behavior.
- If something is not truly deleted, do not call it delete.
- Do not rewrite domain logic, planning meaning, or terminology from intuition.
- Planning artifacts are not safe to edit blindly; they can encode real domain decisions.
- If the change is ambiguous, ask one short question before deciding.
- Keep the answer short and practical.
- Prefer teaching the reason behind the rule over merely stating the rule.
- If the user can name the rule but cannot explain its implementation impact, keep teaching before moving on.
