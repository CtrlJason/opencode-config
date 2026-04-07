param(
    [string]$RepoPath = "",
    [string]$ConfigHome = "",
    [string]$EngramBinDir = ""
)

$ErrorActionPreference = "Stop"

if (-not $RepoPath) {
    $RepoPath = Join-Path $HOME "opencode-config"
}

if (-not $ConfigHome) {
    $ConfigHome = $HOME
}

if (-not $EngramBinDir) {
    $EngramBinDir = Join-Path $ConfigHome "bin"
}

function Show-Check {
    param(
        [string]$Label,
        [bool]$Ok,
        [string]$Detail
    )

    $status = if ($Ok) { "OK" } else { "FAIL" }
    Write-Host ("[{0}] {1} - {2}" -f $status, $Label, $Detail)
}

$activeConfig = Join-Path $ConfigHome ".config\opencode"
$engramTarget = Join-Path $EngramBinDir "engram.exe"

$git = Get-Command git -ErrorAction SilentlyContinue
$opencode = Get-Command opencode -ErrorAction SilentlyContinue
$engram = Get-Command engram -ErrorAction SilentlyContinue

Show-Check -Label "Repo config" -Ok (Test-Path $RepoPath) -Detail $RepoPath
Show-Check -Label "Config activa" -Ok (Test-Path (Join-Path $activeConfig "opencode.json")) -Detail $activeConfig
Show-Check -Label "Git" -Ok ($null -ne $git) -Detail ($(if ($git) { $git.Source } else { "no encontrado" }))
Show-Check -Label "OpenCode" -Ok ($null -ne $opencode) -Detail ($(if ($opencode) { $opencode.Source } else { "no encontrado" }))
Show-Check -Label "Engram comando" -Ok ($null -ne $engram) -Detail ($(if ($engram) { $engram.Source } else { "no encontrado" }))
Show-Check -Label "Engram target" -Ok (Test-Path $engramTarget) -Detail $engramTarget
Show-Check -Label "package.json" -Ok (Test-Path (Join-Path $activeConfig "package.json")) -Detail (Join-Path $activeConfig "package.json")

Write-Host ""
Write-Host "Pasos manuales que pueden faltar:"
Write-Host "- opencode auth login"
Write-Host "- opencode mcp auth notion"
Write-Host "- definir OPENCODE_POSTGRES_URL si usaras Postgres"
Write-Host "- abrir una terminal nueva si acabas de instalar o modificar PATH"
