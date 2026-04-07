# opencode-config

Backup privado para mi configuracion de OpenCode.

## Que guarda

- `config/opencode.json`
- `package.json`
- `plugins/`
- `skills/`
- `commands/`
- `agents/`

## Que no guarda

- `~/.local/share/opencode/auth.json`
- `~/.local/share/opencode/mcp-auth.json`
- bases locales, logs y salidas temporales
- secretos embebidos en texto plano

## Restaurar en una maquina nueva

Hay 3 formas.

### Opcion 0: bootstrap automatico desde una URL

Si quieres dejar casi todo listo con un solo comando en PowerShell:

```powershell
irm 'https://raw.githubusercontent.com/CtrlJason/opencode-config/main/scripts/bootstrap.ps1' | iex
```

Que hace:

1. verifica que `git` exista
2. clona o actualiza `~/opencode-config`
3. instala OpenCode si no existe
4. clona o actualiza `~/engram`
5. instala Engram si no existe
6. importa esta config hacia `~/.config/opencode`
7. corre un `doctor` final

Tambien acepta rutas alternativas para pruebas aisladas, sin tocar tu config real.

Que no hace:

- no autentica providers automaticamente
- no corre OAuth de Notion automaticamente
- no crea ni rellena `OPENCODE_POSTGRES_URL`

### Opcion 1: import normal a las rutas estandar

Es la mas segura y la menos fragil si OpenCode cambia internamente.

1. Instalar OpenCode.
2. Clonar este repo.
3. Ejecutar `powershell -ExecutionPolicy Bypass -File .\scripts\import.ps1`.
4. Abrir una terminal nueva.
5. Reautenticar providers con `opencode auth login` si hace falta.
6. Reautenticar MCP remotos con `opencode mcp auth <nombre>` si hace falta.

### Opcion 2: usar el repo clonado como config nativa

OpenCode soporta esto de forma nativa con variables de entorno.

1. Instalar OpenCode.
2. Clonar este repo.
3. Ejecutar `powershell -ExecutionPolicy Bypass -File .\scripts\use-repo-directly.ps1`.
4. Abrir una terminal nueva.
5. Reautenticar providers y MCP remotos si hace falta.

Esto hace que OpenCode lea directamente:

- `OPENCODE_CONFIG` -> `config/opencode.json`
- `OPENCODE_CONFIG_DIR` -> raiz del repo

La opcion 1 es la recomendada para uso diario.
La opcion 2 es util si quieres que el repo sea la fuente de verdad directa.

## Variables esperadas

- `OPENCODE_POSTGRES_URL`

La configuracion usa `{env:OPENCODE_POSTGRES_URL}` para no subir la cadena de conexion real.

## MCPs usados en esta configuracion

### Engram

- tipo: local
- instalacion: desde su repo oficial
- repo: `https://github.com/gentleman-programming/engram`
- nota: la config usa `{env:USERPROFILE}\bin\engram.exe` en Windows para evitar fijar un usuario concreto; el plugin tambien intenta resolver automaticamente el binario desde `ENGRAM_BIN`, `PATH` o la carpeta `bin` del home

### Notion

- tipo: remoto
- url MCP: `https://mcp.notion.com/mcp`
- docs MCP: `https://developers.notion.com/docs/mcp`
- auth: OAuth con `opencode mcp auth notion`
- nota: en este flujo no se guarda una API key en `opencode.json`

### Playwright

- tipo: local
- paquete: `@playwright/mcp`
- repo: `https://github.com/microsoft/playwright-mcp`
- nota: puede requerir instalar navegador local

### Postgres

- tipo: local
- paquete: `@modelcontextprotocol/server-postgres`
- auth: via connection string en `OPENCODE_POSTGRES_URL`

### Context7

- tipo: remoto
- url MCP: `https://mcp.context7.com/mcp`
- nota: normalmente funciona sin auth inicial para uso basico

## Secretos y auth

No se respaldan automaticamente:

- `~/.local/share/opencode/auth.json`
- `~/.local/share/opencode/mcp-auth.json`

Eso significa que en una maquina nueva normalmente tendras que volver a autenticar:

- providers (`opencode auth login`)
- MCP remotos (`opencode mcp auth notion`, etc.)

## Como no perder auth sensible

El repo privado guarda configuracion, pero no debe guardar credenciales en texto plano.

Opciones recomendadas:

1. volver a autenticar tras instalar de cero
2. guardar `auth.json` y `mcp-auth.json` en un gestor de contraseñas o vault cifrado
3. guardar un backup cifrado local o en la nube, separado del repo

Regla practica:

- config en el repo
- credenciales fuera del repo

### Notion y su auth

En esta configuracion, Notion usa OAuth y su sesion queda en `mcp-auth.json`.

Eso significa:

- no necesitas generar una key para este flujo MCP remoto
- si reinstalas desde cero, lo normal es volver a correr `opencode mcp auth notion`
- si quieres evitar eso, tendrias que restaurar tu `mcp-auth.json` desde un backup cifrado privado

## Flujo recomendado

- `bootstrap.ps1`: prepara una maquina nueva con un solo comando
- `install-opencode.ps1`: instala OpenCode si falta
- `install-engram.ps1`: clona/actualiza Engram e instala el binario en `~/bin`
- `doctor.ps1`: revisa el estado del setup local
- `export.ps1`: sincroniza desde `~/.config/opencode` al repo
- `import.ps1`: restaura desde el repo hacia `~/.config/opencode`
- `use-repo-directly.ps1`: hace que OpenCode use el repo clonado como config nativa
- `test-bootstrap.ps1`: prueba el bootstrap dentro de una raiz temporal
- `test-roundtrip.ps1`: prueba import/export en una raiz temporal

## Validacion local antes de hacer push

Puedes validar el flujo sin tocar tu setup real:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\test-roundtrip.ps1
powershell -ExecutionPolicy Bypass -File .\scripts\test-bootstrap.ps1
```

Ambos tests usan una raiz temporal y la eliminan si todo sale bien. Si algo falla, dejan la ruta para inspeccion.

## Recomendacion practica

- usa `import.ps1` cuando montes una maquina nueva
- usa `export.ps1` cuando hagas cambios a tu config, skills, commands o plugins
- no subas secretos ni auth tokens

## Comandos utiles dentro de OpenCode

- `commands/export-opencode.md`: exporta la config activa al repo usando `$HOME\opencode-config`
- `commands/import-opencode.md`: restaura la config activa desde el repo usando `$HOME\opencode-config`

## Pasos manuales post-bootstrap

Despues del bootstrap o de un import en una maquina nueva, lo normal es correr:

```powershell
opencode auth login
opencode mcp auth notion
```

Y si usaras Postgres:

```powershell
$env:OPENCODE_POSTGRES_URL = "postgresql://..."
```
