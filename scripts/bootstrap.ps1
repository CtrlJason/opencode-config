param(
    [string]$RepoUrl = "https://github.com/CtrlJason/opencode-config.git",
    [string]$RepoPath = "",
    [string]$EngramRepoPath = "",
    [string]$ConfigHome = "",
    [string]$EngramBinDir = "",
    [switch]$SkipRepoUpdate
)

$ErrorActionPreference = "Stop"

if (-not $RepoPath) {
    $RepoPath = Join-Path $HOME "opencode-config"
}

if (-not $EngramRepoPath) {
    $EngramRepoPath = Join-Path $HOME "engram"
}

if (-not $ConfigHome) {
    $ConfigHome = $HOME
}

if (-not $EngramBinDir) {
    $EngramBinDir = Join-Path $ConfigHome "bin"
}

function Test-CommandExists {
    param([string]$Name)

    return $null -ne (Get-Command $Name -ErrorAction SilentlyContinue)
}

if (-not (Test-CommandExists "git")) {
    throw "Git no esta instalado o no esta en PATH. Instala Git primero y vuelve a correr este bootstrap."
}

if ($SkipRepoUpdate -and -not (Test-Path $RepoPath)) {
    throw "SkipRepoUpdate requiere que RepoPath ya exista: $RepoPath"
}

if ($SkipRepoUpdate) {
    Write-Host "Usando repo de config existente sin fetch/pull: $RepoPath"
}
elseif (Test-Path $RepoPath) {
    Write-Host "Actualizando repo de config en $RepoPath"
    & git -C $RepoPath fetch --all --prune
    & git -C $RepoPath pull --ff-only
}
else {
    Write-Host "Clonando repo de config en $RepoPath"
    & git clone $RepoUrl $RepoPath
}

$installOpenCode = Join-Path $RepoPath "scripts\install-opencode.ps1"
$installEngram = Join-Path $RepoPath "scripts\install-engram.ps1"
$importScript = Join-Path $RepoPath "scripts\import.ps1"
$doctorScript = Join-Path $RepoPath "scripts\doctor.ps1"

# TODO: workaround temporal para bug de opencode donde {env:USERPROFILE} se expande con
# backslashes antes del parse JSON, produciendo escapes invalidos como \U, \Y, \b.
# Cuando sst/opencode PR #14987 sea released, eliminar esta linea y cambiar opencode.json
# para usar {env:USERPROFILE} directamente.
$userProfileFwd = $HOME.Replace('\', '/')
[System.Environment]::SetEnvironmentVariable("USERPROFILE_FWD", $userProfileFwd, "User")
Write-Host "USERPROFILE_FWD definido como variable de entorno: $userProfileFwd"

& $installOpenCode
& $installEngram -RepoPath $EngramRepoPath -TargetBinDir $EngramBinDir
& $importScript -RepoPath $RepoPath -ConfigHome $ConfigHome
& $doctorScript -RepoPath $RepoPath -ConfigHome $ConfigHome -EngramBinDir $EngramBinDir

Write-Host ""
Write-Host "Bootstrap completado."
Write-Host ""
Write-Host "Pasos manuales sugeridos:"
Write-Host "- Abre una terminal nueva"
Write-Host "- Ejecuta: opencode auth login"
Write-Host "- Ejecuta: opencode mcp auth notion"
Write-Host "- Si usaras Postgres, define OPENCODE_POSTGRES_URL"
$exportScriptPath = Join-Path $RepoPath "scripts\export.ps1"
Write-Host ("- Para exportar cambios despues: powershell -ExecutionPolicy Bypass -File '{0}'" -f $exportScriptPath)
