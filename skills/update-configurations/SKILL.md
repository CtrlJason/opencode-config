---
name: update-configurations
description: Safely update local or shared configuration, MCP setup, environment variables, and secret-backed tooling without coupling global config to a single project.
---

## Purpose

Use this when the task involves configuration rather than product code.

Examples:
- MCP servers
- local agent config
- user-level shell or tool config
- environment variables
- secret-backed integrations
- shared tooling used across multiple projects

Do not use this for normal app feature work.

This skill should not only make configuration work.
It should also help the user understand scope, persistence, source of truth, secret handling, and the risks of contaminating other projects or creating hidden dependencies.

## Teaching intent

When using this skill, teach the user:

- how to choose between session, project, user, and machine scope
- how to decide where a value should come from
- how to keep reusable configuration from becoming project-coupled
- how to handle secrets without leaking them or normalizing unsafe habits

The goal is safer and more transferable configuration judgment.

## Core Rules

1. Treat global and shared configuration as higher risk than project code.
2. Keep secrets out of committed config, logs, and user-facing responses.
3. Never hardcode credentials, database URLs, tokens, or other secrets into config files.
4. Never assume a project-specific `.env` value should become the default for global tooling.
5. If scope is ambiguous, ask one short clarifying question before editing.

## Scope model

Treat configuration scope as a technical decision, not a convenience shortcut.

- `session`: temporary, useful for one shell or one debugging session
- `project`: only for this repository or app
- `user`: reusable across the user's work on this machine
- `machine`: system-wide, broadest blast radius, highest caution

If a value does not need to escape the current project or session, do not promote it upward by default.

## Required Clarification Triggers

Ask before making changes when any of these are true:
- the config affects more than the current project
- the change involves a secret or connection string
- the user says "make it global", "for all projects", or implies reusable/shared setup
- there are multiple valid persistence options, such as session-only vs user-level vs project-level
- the source of truth is unclear

Good example questions:
- "Should this be global for all projects or only for this repo?"
- "Do you want this persisted as a user env var or only for the current session?"
- "Should I read this from an existing env var, or do you want me to create one?"

## Preferred Configuration Order

When secrets or connection values are involved, prefer this order unless the user says otherwise:

1. Existing user environment variable
2. Existing machine environment variable
3. Session-only environment variable
4. Prompt the user for the intended persistence strategy

Project `.env` files may be used as references only when the user explicitly wants a project-scoped setup or explicitly asks to promote a value into another scope.

## Source-of-truth guidance

When deciding where a config value should come from, prefer sources that make the dependency explicit and understandable.

Good source-of-truth questions include:

- is this value owned by the current project or by the user's general environment?
- does another project need the same value?
- would a future reader understand where this value comes from?
- is the source reusable without being coupled to one repository?

Avoid configurations that technically work but hide the origin of critical values.

## MCP Workflow

1. Identify whether the MCP is project-scoped or global.
2. Confirm how connection values should be supplied.
3. Prefer environment variable expansion over embedded values.
4. If the config system does not resolve env placeholders as expected, do not silently replace them with hardcoded secrets.
5. Instead, stop and ask for the desired fallback strategy.

Valid fallback strategies may include:
- defining a user env var
- defining a session env var
- disabling the MCP until proper config exists
- using a user-provided launcher script that reads from an approved source

## Editing Guidance

- Make the smallest viable config change.
- Keep reusable config generic.
- Keep project-specific knowledge out of shared config unless explicitly requested.
- Do not print secret values back to the user.
- When verification needs a secret value, verify presence or connectivity without echoing the secret.

## Hidden-dependency detector

Actively watch for configuration that would create hidden or confusing dependencies, such as:

- shared tooling that silently reads from one repo-specific file
- values that only work because a local shell state happens to exist
- global config that depends on a project path or project naming convention
- setups where a future user cannot tell where the value is sourced from

If you detect one, call it out and prefer a more explicit source.

## Understanding check

Do not assume the user understood the config decision just because the tool now works.

When the decision matters, verify with one light check such as:

- ask which scope they would choose and why
- ask what risk appears if the value is placed in a broader scope
- ask what source of truth they would prefer for the value
- ask whether the value should be temporary or persistent

Use the lightest check that helps build reusable judgment.

## Response Guidance

- State the scope you are changing: project, session, user, or machine.
- State where the value is sourced from without exposing the value.
- State the main risk avoided by choosing this approach.
- State what would need to change for a different scope to become the better choice.
- If you had to ask a clarification question, wait for the answer before editing.
- If a previous assumption was wrong, revert only the incorrect config change and say why.

## Anti-Patterns

Avoid these:
- copying a database URL from one repo into global config without explicit approval
- hardcoding a path to one project's `.env` for shared tooling
- assuming "make it work" means "make it global"
- leaking a secret in command output, patches, or summaries
- leaving a configuration working through hidden local state that the user cannot easily reason about
