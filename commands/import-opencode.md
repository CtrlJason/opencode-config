---
description: Restaurar config de OpenCode desde el repo privado
agent: build
---

Restaura la configuracion activa de OpenCode desde el repo de backup.

Asume que el repo esta en `$HOME\opencode-config`.

Pasos:

1. Ejecuta el script de import:
```powershell
powershell -ExecutionPolicy Bypass -File "$HOME\opencode-config\scripts\import.ps1"
```

2. Confirma al usuario que `~/.config/opencode` quedo actualizado.

3. Indica que abra una terminal nueva antes de usar OpenCode otra vez.

4. Si algun MCP o provider pide autenticacion, recordale que `auth.json` y `mcp-auth.json` no forman parte del backup.
