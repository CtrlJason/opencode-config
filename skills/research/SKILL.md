---
name: research
description: Investigar temas de forma responsable y precisa. Siempre verificar fuentes, distinguir entre hechos y opiniones, y priorizar información actualizada de fuentes confiables.
---

## CRITICAL: Before Any Research

Before searching for information, establish:

1. **What exactly do you need to know?** - Specific question
2. **What's the context?** - User's project, level, use case
3. **What's acceptable risk?** - Is this for production code? Learning? Just curious?

This skill should not only return correct information.
It should also help the user learn how to research better, separate fact from interpretation, detect weak or outdated guidance, and decide what actually applies to the current project.

## Teaching intent

When using this skill, teach the user:

- how to distinguish fact, interpretation, opinion, and recommendation
- how to identify when a source is outdated or outside the project's context
- how to tell whether a result applies here or only in another setup
- how to avoid being impressed by confident but irrelevant information

The goal is not only accurate research now, but stronger research judgment later.

## Learning-style adaptation

When the user is learning a new tool or library:

- do not assume they can infer syntax or API shape without docs
- use verified documentation to support small, teachable examples
- explain what part of the docs matters and why
- connect the docs back to the user's current task in parts, not as one giant answer

## Context First Rule

Before researching a topic that may already exist in this project, first check whether there is relevant prior context.

If the user is researching in order to learn, first check `Second Brain` context in Engram project `second-brain`. Prioritize both `Learning Sessions` and `Topics` to understand the user's current baseline, vocabulary, and likely gaps before deciding how much explanation or documentation scaffolding is needed.

Use this order:
1. If the user says the topic already exists in their work, check existing context first.
2. If the user says they have not applied it, do not spend time searching memory for it; research directly if needed.
3. If the user has not said either way, ask one short clarifying question before researching.

For design patterns and architecture decisions, verify the project implementation first when the question depends on how the code is actually built.

If the user explicitly says a topic is new or not yet applied, research directly instead of searching project memory first. For learning requests, still check `Second Brain` first to avoid ignoring prior study that was not yet applied.

If the user wants a technical explanation, investigate first unless the request is clearly just conversational or purely conceptual.

If the user is learning a new library or framework from zero, researching first is usually required before giving code or implementation advice.

## Source Evaluation Criteria

### 1. Source Types (Priority Order)

| Priority | Type | Examples | Use for |
|----------|------|----------|---------|
| 1️⃣ | **Official/Documentation** | MDN, Python docs, NestJS docs, React docs | Core concepts, API, best practices |
| 2️⃣ | **Academic/Research** | IEEE, ACM, arXiv, university papers | Deep technical details, comparisons |
| 3️⃣ | **Established Publications** | Tech blogs from known experts, O'Reilly | In-depth explanations, patterns |
| 4️⃣ | **Community Q&A** | StackOverflow, Reddit, forums | Specific problems, workarounds |
| 5️⃣ | **AI/Mixed** | GitHub issues, mixed content | Caveats - verify elsewhere |

### 2. Credibility Checklist

Ask for each source:

- [ ] **Who wrote this?** (expert? organization? anonymous?)
- [ ] **When was it published?** (current? outdated?)
- [ ] **Is this verifiable?** (can you check against official docs?)
- [ ] **What's the purpose?** (teach? sell? help? opinion?)
- [ ] **Is it peer-reviewed or community-verified?**

### 3. Date/Recency Check

**For programming:**
- Check if the technology has changed since publication
- Library versions matter - what worked in 2020 may not work now
- If no date found, assume it might be outdated

**Prioritize:**
- Most recent official documentation
- Recent blog posts (last 1-2 years for fast-moving topics)
- StackOverflow with recent activity

## Source Classification for Programming Topics

## Handling Community Sources (StackOverflow, Forums)

When using community sources, ALWAYS:

1. **Check the date** - Is this still valid?
2. **Check the votes/accepted** - Community validation
3. **Verify against official docs** - Don't rely solely on forum answers
4. **Note the context** - Solution might be specific to certain version/config

**When presenting to user:**
```
⚠️ Fuente: StackOverflow (respuesta con X votos)
Nota: Esta es una solución de la comunidad, no documentación oficial.
Verifica que funcione con tu versión actual.
```

## Search Strategy

### For Technical Topics:
1. Start with official documentation
2. If unclear, search for tutorial from established source
3. For specific problems, check StackOverflow with date filter
4. Verify across multiple sources
5. Prefer at least one official source and one corroborating source when possible

## Interpretation guard

Do not blur together:

- what the source explicitly says
- what you infer from it
- what you recommend doing in this project

Keep those layers mentally separate and present them separately when it helps.

## Context applicability check

Before presenting research as actionable, ask:

- does this match the versions, tools, or architecture in the current project?
- is this advice still current for this technology?
- is this a general best practice, or only right in a narrower context?
- would applying this here solve the user's actual problem, or only a similar one?

If something is informative but not applicable here, say so directly.

## Weak-signal detector

Actively watch for these research traps:

- outdated guidance presented as current
- correct information applied to the wrong context
- opinion or preference presented as fact
- sources that sound authoritative but do not actually answer the user's question

If one appears, call it out clearly.

### For Topics Already Touched in the Project:
1. Check existing project context first when relevant
2. Inspect the implementation if the answer depends on current code
3. Research externally only to confirm or fill gaps
4. Explain the result relative to the project's current state

## Source Preference

Prefer a mixed verification style when possible:

- one official source
- one corroborating source from community or another reputable source

If official documentation exists, use it as the primary anchor.

### For Concept Explanations:
1. Academic/technical articles > opinion pieces
2. Known experts > random blogs
3. Multiple sources agree = more reliable

## Context7 MCP Integration (RECOMMENDED for Documentation)

When you need official documentation or specific syntax/examples for a library:

### What is Context7?
An MCP server that provides up-to-date, version-specific documentation and code examples directly from official sources.

### When to use:
- You don't know how to implement something
- You need the correct syntax for a specific version
- You want to verify how something works in the official docs
- You're unsure about the current best practice

### How to use:
1. Use `context7_resolve-library-id` to find the library ID
2. Use `context7_query-docs` to get specific documentation

### Example workflow:
```
User: "How do I use transactions in Prisma?"
Action:
  1. context7_resolve-library-id (libraryName: "prisma")
  2. context7_query-docs (query: "transactions typescript prisma")
  3. Verify the answer against official docs
  4. Present with confidence - this is from official documentation
```

### Benefits:
- Always up-to-date with latest versions
- Code examples directly from official docs
- No need to search - documentation delivered to the prompt
- Version-specific information

### Libraries commonly available:
- Prisma, NestJS, React, Express, Python, Go, etc.

## Key Principles

1. **Official > Community** - Docs first, community for edge cases
2. **Date matters** - Always check recency
3. **Verify, don't assume** - Check against multiple sources
4. **Distinguish facts from opinions** - "X is deprecated" (fact) vs "X is better" (opinion)
5. **Admit uncertainty** - If you're not sure, say so and verify
6. **Current > Comprehensive** - Recent correct info > old complete info
7. **Use Context7 first** - For any library/framework, check official docs before searching elsewhere

## Understanding check

Do not assume the user learned research judgment just because sources were cited.

When the research matters, verify with one light check such as:

- ask what part of the research actually applies to this project
- ask which source they would trust most and why
- ask what should be discarded because of context or age
- ask what still needs verification before acting on it

Use the smallest check that improves judgment without over-formalizing the conversation.

## Recommended closing shape

When useful, end research with:

- `Facts` - what is directly supported by the sources
- `Opinion or interpretation` - what is inferred or debated
- `Applies here` - what fits this project or problem
- `Next verification` - what still needs to be checked before implementation or decision

When the user is also learning, it can help to add:

- `How to read this` - what clue in the docs or source should train the user's eye next time

## Notes

- This skill integrates with teach-from-foundations for presentation
- When teaching, cite your sources
- If source is from forum, explicitly say it's a forum/community answer
- Better to say "no sé, investigo" than to give wrong information
- Prioritize the most recent information available
- **Use Context7 MCP for documentation queries** - It's faster and more reliable than web search
- When unsure about implementation, syntax, or how something works → use Context7 first
- A correct answer outside the user's context is still a poor answer
