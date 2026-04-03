---
name: research
description: Investigar temas de forma responsable y precisa. Siempre verificar fuentes, distinguir entre hechos y opiniones, y priorizar información actualizada de fuentes confiables.
---

## CRITICAL: Before Any Research

Before searching for information, establish:

1. **What exactly do you need to know?** - Specific question
2. **What's the context?** - User's project, level, use case
3. **What's acceptable risk?** - Is this for production code? Learning? Just curious?

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

### ✅ RELIABLE Sources
- Official documentation (docs.mongodb.com, docs.nestjs.com, react.dev, etc.)
- Official tutorials/guides from maintainers
- RFCs and technical specifications
- Peer-reviewed papers

### ⚠️ USE WITH CAUTION Sources
- StackOverflow answers (may be outdated, context-specific)
- Reddit posts (opinions, not facts)
- Medium/TDev articles (variable quality)
- GitHub issues (often specific bugs, not general truth)
- YouTube tutorials (hard to verify, may skip important details)

### ❌ AVOID
- Unverified blog posts without dates
- Old tutorials for modern frameworks
- "Best practices" without dates or context
- Anything claiming "never use X" or "always use Y"

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

## Research Output Format

```
## Tu pregunta
[What user asked]

## Fuentes consultadas
| Fuente | Tipo | Fecha | Confiabilidad |
|--------|------|-------|---------------|
| [Link] | Documentación oficial | 2025 | ✅ Alta |
| [Link] | StackOverflow | 2024 | ⚠️ Media |

## Respuesta
[What you found - synthesized]

## Verificación
- [ ] Verificado contra documentación oficial
- [ ] Fecha reciente para esta tecnología
- [ ] Múltiples fuentes coinciden

## Advertencia
[If using community source: "Esto es de la comunidad, no documentación oficial"]
[If outdated: "Esta información puede estar desactualizada"]
```

## Key Principles

1. **Official > Community** - Docs first, community for edge cases
2. **Date matters** - Always check recency
3. **Verify, don't assume** - Check against multiple sources
4. **Distinguish facts from opinions** - "X is deprecated" (fact) vs "X is better" (opinion)
5. **Admit uncertainty** - If you're not sure, say so and verify
6. **Current > Comprehensive** - Recent correct info > old complete info
7. **Use Context7 first** - For any library/framework, check official docs before searching elsewhere

## When You Don't Know

If you don't know a topic:
1. Say: "No sé esto, voy a investigar"
2. Search official docs first
3. If no official source, search trusted community sources
4. Present with appropriate caveats
5. NEVER make up information

## Notes

- This skill integrates with teach-from-foundations for presentation
- When teaching, cite your sources
- If source is from forum, explicitly say it's a forum/community answer
- Better to say "no sé, investigo" than to give wrong information
- Prioritize the most recent information available
- **Use Context7 MCP for documentation queries** - It's faster and more reliable than web search
- When unsure about implementation, syntax, or how something works → use Context7 first