---
description: Exportar y subir backup de OpenCode al repo privado
agent: build
---

Ejecuta el backup del repo de configuracion de OpenCode.

Pasos:

1. Ejecuta el script de export:
```powershell
powershell -ExecutionPolicy Bypass -File C:\Users\guini\opencode-config\scripts\export.ps1
```

2. Ve al repo:
```powershell
cd C:\Users\guini\opencode-config
```

3. Verifica los cambios:
```powershell
git status --short
```

4. Si hay cambios, haz commit y push:
```powershell
git add . && git commit -m "update config" && git push
```

5. Si no hay cambios, avisa al usuario que no hay nada que subir.

Usa `{env:OPENCODE_POSTGRES_URL}` en la config para no exponer secretos.
