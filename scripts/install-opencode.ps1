param(
    [switch]$Force
)

$ErrorActionPreference = "Stop"

function Test-CommandExists {
    param([string]$Name)

    return $null -ne (Get-Command $Name -ErrorAction SilentlyContinue)
}

function Get-CommandPath {
    param([string]$Name)

    $cmd = Get-Command $Name -ErrorAction SilentlyContinue
    if (-not $cmd) {
        return $null
    }

    return $cmd.Source
}

$existing = Get-CommandPath "opencode"
if ($existing -and -not $Force) {
    Write-Host "OpenCode ya existe en $existing"
    return
}

if (Test-CommandExists "scoop") {
    Write-Host "Instalando OpenCode con Scoop..."
    scoop install opencode
}
elseif (Test-CommandExists "choco") {
    Write-Host "Instalando OpenCode con Chocolatey..."
    choco install opencode -y
}
elseif (Test-CommandExists "npm") {
    Write-Host "Instalando OpenCode con npm..."
    npm install -g opencode-ai
}
else {
    throw "No encontre un metodo soportado para instalar OpenCode. Instala Scoop, Chocolatey o npm y vuelve a correr el bootstrap."
}

$installed = Get-CommandPath "opencode"
if (-not $installed) {
    Write-Warning "OpenCode se instalo, pero no aparece en la terminal actual. Abre una terminal nueva y verifica con: opencode --version"
    return
}

Write-Host "OpenCode instalado en $installed"
