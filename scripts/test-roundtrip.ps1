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
    $TestRoot = Join-Path $env:TEMP ("opencode-roundtrip-" + [guid]::NewGuid().ToString("N"))
}

$homeRoot = Join-Path $TestRoot "home"
$roundtripRepo = Join-Path $TestRoot "roundtrip-repo"
$importScript = Join-Path $RepoPath "scripts\import.ps1"
$exportScript = Join-Path $RepoPath "scripts\export.ps1"

function Assert-PathExists {
    param([string]$Path)

    if (-not (Test-Path $Path)) {
        throw "Falta la ruta esperada: $Path"
    }
}

try {
    New-Item -ItemType Directory -Force $homeRoot | Out-Null
    New-Item -ItemType Directory -Force $roundtripRepo | Out-Null

    & $importScript -RepoPath $RepoPath -ConfigHome $homeRoot
    & $exportScript -RepoPath $roundtripRepo -ConfigHome $homeRoot

    Assert-PathExists (Join-Path $homeRoot ".config\opencode\opencode.json")
    Assert-PathExists (Join-Path $homeRoot ".config\opencode\commands\import-opencode.md")
    Assert-PathExists (Join-Path $homeRoot ".config\opencode\plugins\engram.ts")
    Assert-PathExists (Join-Path $roundtripRepo "config\opencode.json")
    Assert-PathExists (Join-Path $roundtripRepo "commands\export-opencode.md")
    Assert-PathExists (Join-Path $roundtripRepo "commands\import-opencode.md")
    Assert-PathExists (Join-Path $roundtripRepo "plugins\engram.ts")
    Assert-PathExists (Join-Path $roundtripRepo "package.json")

    Write-Host "Roundtrip OK en $TestRoot"

    if (-not $KeepOnSuccess) {
        Remove-Item $TestRoot -Recurse -Force
        Write-Host "Roundtrip limpio: $TestRoot"
    }
}
catch {
    Write-Host "Roundtrip FAIL en $TestRoot"
    throw
}
