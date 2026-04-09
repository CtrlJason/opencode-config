---
name: research
description: Investigate a topic responsibly and precisely. Verify sources, distinguish facts from opinions, and prioritize current information from reliable sources.
---

<core_rule>
Use this skill for investigations that require source evaluation, synthesis across resources, or topics where official docs do not fully answer the question.

For quick API/syntax/version lookups, use `lookup-docs` instead.

This skill should not only return correct information — it should also help the user learn to research better: separate fact from interpretation, detect weak or outdated guidance, and decide what actually applies to their project.
</core_rule>

<first_step>
Before researching, establish:

1. What exactly needs to be known? (specific question)
2. What is the context? (project, stack, use case)
3. Does relevant prior context already exist?

Check `Second Brain` in Engram project `second-brain` if the user is researching to learn. Use `Learning Sessions` and `Topics` to understand their baseline before deciding how much scaffolding is needed.

If the topic is new and not yet applied, research directly. If the user has not said either way, ask one short clarifying question first.
</first_step>

## Source priority

| Priority | Type | Use for |
|---|---|---|
| 1 | Official docs (MDN, NestJS, React...) | Core concepts, API, best practices |
| 2 | Academic / research papers | Deep technical comparisons |
| 3 | Established publications (O'Reilly, known experts) | Patterns, in-depth explanations |
| 4 | Community Q&A (StackOverflow, forums) | Specific problems, workarounds |
| 5 | AI-generated / mixed content | Verify elsewhere |

For community sources: always check the date, vote count, and verify against official docs before presenting to the user.

## Search strategy

1. Start with official documentation — use Context7 when available for library docs
2. For broader topics or comparisons, use WebSearch with official domains preferred
3. Verify across at least two sources when the answer matters
4. For project-specific questions, check existing code before searching externally

## Interpretation guard

Keep these layers separate:

- What the source explicitly says
- What you infer from it
- What you recommend for this project

Present them separately when it helps avoid confusion.

<examples>
<example>
User: "¿Es mejor usar JWT o sessions para autenticación en NestJS?"

Weak: Immediately recommend JWT with reasons.

Strong:
1. Check Second Brain — has the user studied auth before?
2. Check existing project context — is there already an auth setup?
3. Research both approaches from official NestJS docs + one reputable source
4. Present: Facts (what each does), Trade-offs (stateless vs stateful), Applies here (given their stack and requirements)
5. Flag: "JWT is often recommended in tutorials but sessions may fit better if X applies to your project."
</example>
</examples>

## Weak-signal detector

Watch for these research traps and call them out explicitly:

- Outdated guidance presented as current ("this worked in 2020...")
- Correct information applied to the wrong context
- Opinion or preference presented as fact
- Sources that sound authoritative but do not actually answer the question

## Closing shape

When useful, end research with:

- `Facts` — directly supported by sources
- `Opinion or interpretation` — inferred or debated
- `Applies here` — what fits this project or problem
- `Next verification` — what still needs checking before acting

When the user is also learning, add:

- `How to read this` — what clue in the source trains their research eye next time

<guardrails>
- Cite sources; distinguish official docs from community answers
- If a source is from a forum, say so explicitly
- If something is informative but not applicable here, say so directly
- Do not blur fact, inference, and recommendation — keep them separate
- Save durable research findings into Engram when they inform long-term project or learning decisions
</guardrails>
