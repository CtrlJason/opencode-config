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

# Export Claude Code config (skills + CLAUDE.md) — only if claude is installed
$claudeCmd = Get-Command claude -ErrorAction SilentlyContinue
if ($claudeCmd) {
    $claudeSrc = Join-Path $ConfigHome ".claude"
    $claudeRepoDir = Join-Path $repo "claude"
    $exported = $false

    $claudeMd = Join-Path $claudeSrc "CLAUDE.md"
    if (Test-Path $claudeMd) {
        New-Item -ItemType Directory -Force $claudeRepoDir | Out-Null
        Copy-Item $claudeMd (Join-Path $claudeRepoDir "CLAUDE.md") -Force
        $exported = $true
    }

    $claudeSkillsSrc = Join-Path $claudeSrc "skills"
    if (Test-Path $claudeSkillsSrc) {
        $claudeSkillsDest = Join-Path $claudeRepoDir "skills"
        New-Item -ItemType Directory -Force $claudeSkillsDest | Out-Null
        Get-ChildItem $claudeSkillsDest -Force -ErrorAction SilentlyContinue | Remove-Item -Recurse -Force
        Copy-Item "$claudeSkillsSrc\*" $claudeSkillsDest -Recurse -Force
        $exported = $true
    }

    if ($exported) {
        Write-Host "Claude Code config exported to $claudeRepoDir"
    } else {
        Write-Host "Claude Code installed but no config found — skipping claude export"
    }
}
else {
    Write-Host "Claude Code not found — skipping claude export"
}

# Sync Engram memories to repo
Push-Location $repo
engram sync --all
Pop-Location
Write-Host "Engram memories synced to $repo/.engram"
