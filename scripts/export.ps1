param(
    [string]$RepoPath = "",
    [string]$ConfigHome = ""
)

$ErrorActionPreference = "Stop"

if (-not $RepoPath) {
    $RepoPath = Split-Path $PSScriptRoot -Parent
}

if (-not $ConfigHome) {
    $ConfigHome = $HOME
}

$source = Join-Path $ConfigHome ".config\opencode"
$repo = $RepoPath
$configDir = Join-Path $repo "config"

New-Item -ItemType Directory -Force $configDir | Out-Null
New-Item -ItemType Directory -Force (Join-Path $repo "plugins") | Out-Null
New-Item -ItemType Directory -Force (Join-Path $repo "skills") | Out-Null
New-Item -ItemType Directory -Force (Join-Path $repo "commands") | Out-Null
New-Item -ItemType Directory -Force (Join-Path $repo "agents") | Out-Null

Copy-Item (Join-Path $source "opencode.json") (Join-Path $configDir "opencode.json") -Force

foreach ($name in @("package.json", "AGENTS.md")) {
    $from = Join-Path $source $name
    $to = Join-Path $repo $name

    if (Test-Path $from) {
        Copy-Item $from $to -Force
    }
}

foreach ($name in @("plugins", "skills", "commands", "agents")) {
    $from = Join-Path $source $name
    $to = Join-Path $repo $name

    if (Test-Path $to) {
        Get-ChildItem $to -Force | Remove-Item -Recurse -Force
    }

    if (Test-Path $from) {
        Copy-Item $from\* $to -Recurse -Force
    }
}

Write-Host "Export completado en $repo"

# Sync Engram memories to repo
Push-Location $repo
engram sync --all
Pop-Location
Write-Host "Engram memories synced to $repo/.engram"
