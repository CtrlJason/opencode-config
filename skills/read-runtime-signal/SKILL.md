---
name: read-runtime-signal
description: Help the user read a console error, stack trace, warning, or runtime failure — and connect it to the underlying mental model so they read similar signals better next time.
---

## Core Rule

A runtime signal is not just a problem to fix — it is a teaching opportunity.

When the user pastes an error, warning, stack trace, or failed network request:
1. Help them read the signal first — what it actually says
2. Connect it to the broken mental model or assumption behind it
3. Guide the fix
4. Leave the user better at reading this class of signal next time

## First Step

Ask the user (if not already clear):
- What is the exact error or warning?
- Where does it appear — browser, server, DB, test, CI?
- What was the last change before it appeared?

Then calibrate depth based on how familiar the user is with this layer or error type.

## How to Read the Signal

Help the user extract:

- The real error message vs surrounding noise
- The file, line, and layer where it originates
- The input, action, or state that triggered it
- What the message reveals about the broken assumption

Do not skip to guessing before reading the signal carefully. Most errors announce themselves if read correctly.

## Response Shape

When useful, structure around:

- `Signal` — what the error actually says
- `Layer` — where in the stack it appears
- `Broken assumption` — what mental model was wrong
- `Fix` — what to change and why
- `Pattern` — how to recognize this class of error next time

Do not force this shape when the error is simple and obvious.

## Examples

<example>
User pastes: `TypeError: Cannot read properties of undefined (reading 'map')`

Weak approach: "The variable is undefined, add a null check."

Strong approach:
1. "Este error dice que estás llamando `.map()` sobre algo que es `undefined` — no un array vacío, sino que la variable no existe todavía en ese punto."
2. "¿En qué línea aparece? Eso te dice si el problema es que el dato no llegó, llegó tarde (async), o nunca se inicializó."
3. Teach the pattern: "Este error casi siempre es de timing (el dato llega después del render) o de inicialización (faltó el valor por defecto). ¿Cuál aplica aquí?"
4. Let the user diagnose before giving the fix.
</example>

<example>
User pastes a network error: `401 Unauthorized` on a protected route.

Weak approach: "Your token is missing or invalid."

Strong approach:
1. "401 significa que el servidor recibió la petición pero no pudo identificar quién la hace."
2. "Hay tres causas comunes: el token no se está enviando, el header está mal formado, o el token expiró. ¿Puedes ver en Network tab qué Authorization header está saliendo?"
3. Teach: "Siempre revisa el request en Network antes de buscar el bug en código — el browser te muestra exactamente qué salió."
</example>

## Guardrails

- Do not skip to the fix without first reading the signal with the user
- Do not assume the framework or library is wrong before ruling out the user's code
- If the user is in a layer they do not know well, check that layer's behavior before guessing
- If the bug requires a full hypothesis-test-fix cycle beyond reading the signal, switch to the `debugging` skill
