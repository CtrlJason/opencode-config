---
description: Exportar y subir backup de OpenCode al repo privado
agent: build
---

Ejecuta el backup del repo de configuracion de OpenCode.

Asume que el repo esta en `$HOME\opencode-config`.

Pasos:

1. Ejecuta el script de export:
```powershell
powershell -ExecutionPolicy Bypass -File "$HOME\opencode-config\scripts\export.ps1"
```

2. Ve al repo:
```powershell
cd "$HOME\opencode-config"
```

3. Verifica los cambios:
Usa las herramientas Git MCP para revisar el repo (`status`, `diff` y `log`) en lugar de ejecutar `git` por shell cuando sea posible.

4. Si hay cambios, haz commit y push:
Usa las herramientas Git MCP para:

- revisar el estado del repo
- stagear los archivos relevantes
- crear un commit con un mensaje breve y correcto
- hacer `push` a `origin/main`

5. Si no hay cambios, avisa al usuario que no hay nada que subir.

Usa `{env:OPENCODE_POSTGRES_URL}` en la config para no exponer secretos.

Este flujo tambien versiona `package.json`, para que los plugins locales con dependencias externas se puedan restaurar mejor en otra maquina.
