---
name: lookup-docs
description: Quickly look up API reference, syntax, configuration, or version-specific behavior for a library, framework, or tool. Uses official documentation first via Context7.
---

<core_rule>
Use this skill when the user needs a specific answer from official documentation — syntax, API shape, configuration options, version behavior, or migration guidance.

Fast and docs-first. Do not start with web search or inference. Go to the official source first.
</core_rule>

## Workflow

1. Use `context7_resolve-library-id` to find the library
2. Use `context7_query-docs` with a specific, narrow query
3. Present the relevant section with the exact syntax or behavior
4. Note the version if the answer is version-sensitive
5. If Context7 does not have the library, fall back to official docs via WebSearch

<examples>
<example>
User: "¿Cómo hago una transacción en Prisma?"

1. context7_resolve-library-id → "prisma"
2. context7_query-docs → "transactions prisma typescript"
3. Present: `prisma.$transaction([...])` with minimal working example
4. Note: interactive vs batch transactions behave differently — mention if relevant
</example>

<example>
User: "¿Cuál es la sintaxis de useQuery en TanStack Query v5?"

1. context7_resolve-library-id → "tanstack-query"
2. context7_query-docs → "useQuery v5 syntax options"
3. Present the updated API
4. Flag the breaking change from v4 if the user may be migrating
</example>
</examples>

<guardrails>
- Always note the library version when the answer is version-sensitive
- If the docs answer is ambiguous, say so — do not fill the gap with inference
- Show the minimal relevant section, not the full API
- If the question requires source evaluation, comparison, or synthesis across resources, switch to the `research` skill
</guardrails>
