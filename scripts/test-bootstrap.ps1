param(
    [string]$RepoPath = "",
    [string]$TestRoot = "",
    [switch]$KeepOnSuccess
)

$ErrorActionPreference = "Stop"

if (-not $RepoPath) {
    $RepoPath = Split-Path $PSScriptRoot -Parent
}

if (-not $TestRoot) {
    $TestRoot = Join-Path $env:TEMP ("opencode-bootstrap-" + [guid]::NewGuid().ToString("N"))
}

$bootstrapRepo = Join-Path $TestRoot "opencode-config"
$configHome = Join-Path $TestRoot "home"
$engramRepo = Join-Path $TestRoot "engram"
$engramBin = Join-Path $configHome "bin"
$bootstrapScript = Join-Path $bootstrapRepo "scripts\bootstrap.ps1"

function Assert-PathExists {
    param([string]$Path)

    if (-not (Test-Path $Path)) {
        throw "Falta la ruta esperada: $Path"
    }
}

try {
    Copy-Item $RepoPath $bootstrapRepo -Recurse -Force

    & $bootstrapScript -RepoPath $bootstrapRepo -EngramRepoPath $engramRepo -ConfigHome $configHome -EngramBinDir $engramBin -SkipRepoUpdate

    Assert-PathExists (Join-Path $configHome ".config\opencode\opencode.json")
    Assert-PathExists (Join-Path $configHome ".config\opencode\commands\import-opencode.md")
    Assert-PathExists (Join-Path $configHome ".config\opencode\plugins\engram.ts")
    Assert-PathExists (Join-Path $engramBin "engram.exe")
    Assert-PathExists (Join-Path $engramRepo ".git")

    Write-Host "Bootstrap OK en $TestRoot"

    if (-not $KeepOnSuccess) {
        Remove-Item $TestRoot -Recurse -Force
        Write-Host "Bootstrap limpio: $TestRoot"
    }
}
catch {
    Write-Host "Bootstrap FAIL en $TestRoot"
    throw
}
