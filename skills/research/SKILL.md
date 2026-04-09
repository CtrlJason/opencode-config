---
name: research
description: Investigate a topic responsibly and precisely. Verify sources, distinguish facts from opinions, and prioritize current information from reliable sources.
---

## Core Rule

Use this skill for investigations that require source evaluation, synthesis across resources, or topics where official docs do not fully answer the question.

This skill should not only return correct information — it should also help the user learn to research better: separate fact from interpretation, detect weak or outdated guidance, and decide what actually applies to their project.

## First Step

Before researching, establish:

1. What exactly needs to be known? (specific question)
2. What is the context? (project, stack, use case)
3. Does relevant prior context already exist in this project?

If the topic is new and not yet applied, research directly. If uncertain, ask one short clarifying question first.

## Source Priority

| Priority | Type | Use for |
|---|---|---|
| 1 | Official docs (MDN, NestJS, React...) | Core concepts, API, best practices |
| 2 | Academic / research papers | Deep technical comparisons |
| 3 | Established publications (O'Reilly, known experts) | Patterns, in-depth explanations |
| 4 | Community Q&A (StackOverflow, forums) | Specific problems, workarounds |
| 5 | AI-generated / mixed content | Verify elsewhere |

For community sources: always check the date, vote count, and verify against official docs before presenting.

## Search Strategy

1. Start with official documentation — use Context7 when available for library docs
2. For broader topics or comparisons, use WebSearch with official domains preferred
3. Verify across at least two sources when the answer matters
4. For project-specific questions, check existing code before searching externally

## Examples

<example>
User: "¿Es mejor usar JWT o sessions para autenticación en NestJS?"

Weak approach: Immediately recommend JWT with reasons.

Strong approach:
1. Check if there is an existing auth setup in the project first
2. Research both approaches from official NestJS docs and one reputable source
3. Present: Facts (what each does), Trade-offs (stateless vs stateful), Applies here (given their stack and requirements)
4. Flag: "JWT is recommended in most tutorials, but sessions may fit better if you need server-side revocation or your app is not stateless."
</example>

<example>
User: "¿Prisma o TypeORM para un proyecto NestJS nuevo?"

Weak approach: Give a definitive recommendation without context.

Strong approach:
1. Ask: "¿El proyecto es greenfield o ya tiene algo? ¿Cuánta experiencia tiene el equipo con ORMs?"
2. Research current state of both from official docs and community signals
3. Present the real tradeoffs: Prisma (type safety, DX, migrations) vs TypeORM (flexibility, more SQL control)
4. Separate facts from opinion clearly before recommending
</example>

## Interpretation Guard

Keep these layers separate:

- What the source explicitly says
- What you infer from it
- What you recommend for this project

Present them separately when it helps avoid confusion.

## Weak-Signal Detector

Watch for these and call them out explicitly:

- Outdated guidance presented as current
- Correct information applied to the wrong context
- Opinion or preference presented as fact
- Sources that sound authoritative but do not answer the actual question

## Closing Shape

When useful, end research with:

- `Facts` — directly supported by sources
- `Opinion or interpretation` — inferred or debated
- `Applies here` — what fits this project or problem
- `Next verification` — what still needs checking before acting

## Self-Check

Before presenting the output, verify:

- Are facts, interpretations, and recommendations clearly separated — or are they blurred together?
- Does the main recommendation actually apply to this project's stack, constraints, and context?
- Is there at least one official or primary source backing the core claim?
- Is anything presented as current that might be outdated for this technology version?
- Would the user know what to verify next before acting on this?

If any answer is no, fix it before responding.

## Guardrails

- Cite sources; distinguish official docs from community answers
- If a source is from a forum, say so explicitly
- If something is informative but not applicable here, say so directly
- Do not blur fact, inference, and recommendation — keep them separate
