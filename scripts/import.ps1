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

$target = Join-Path $ConfigHome ".config\opencode"
$repo = $RepoPath
$configDir = Join-Path $repo "config"

New-Item -ItemType Directory -Force $target | Out-Null

Copy-Item (Join-Path $configDir "opencode.json") (Join-Path $target "opencode.json") -Force

foreach ($name in @("package.json", "AGENTS.md")) {
    $from = Join-Path $repo $name
    $to = Join-Path $target $name

    if (Test-Path $from) {
        Copy-Item $from $to -Force
    }
}

foreach ($name in @("plugins", "skills", "commands", "agents")) {
    $from = Join-Path $repo $name
    $to = Join-Path $target $name

    New-Item -ItemType Directory -Force $to | Out-Null

    if (Test-Path $to) {
        Get-ChildItem $to -Force | Remove-Item -Recurse -Force
    }

    if (Test-Path $from) {
        Copy-Item $from\* $to -Recurse -Force
    }
}

Write-Host "Import completado en $target"

# Import Claude Code config (skills + CLAUDE.md) — only if claude is installed
$claudeCmd = Get-Command claude -ErrorAction SilentlyContinue
$claudeRepoDir = Join-Path $repo "claude"
if ($claudeCmd -and (Test-Path $claudeRepoDir)) {
    $claudeDest = Join-Path $ConfigHome ".claude"

    New-Item -ItemType Directory -Force (Join-Path $claudeDest "skills") | Out-Null

    $claudeMd = Join-Path $claudeRepoDir "CLAUDE.md"
    if (Test-Path $claudeMd) {
        Copy-Item $claudeMd (Join-Path $claudeDest "CLAUDE.md") -Force
    }

    $claudeSkillsSrc = Join-Path $claudeRepoDir "skills"
    if (Test-Path $claudeSkillsSrc) {
        $claudeSkillsDest = Join-Path $claudeDest "skills"
        Get-ChildItem $claudeSkillsDest -Force -ErrorAction SilentlyContinue | Remove-Item -Recurse -Force
        Copy-Item "$claudeSkillsSrc\*" $claudeSkillsDest -Recurse -Force
    }

    Write-Host "Claude Code config imported to $claudeDest"
} elseif (-not $claudeCmd) {
    Write-Host "Claude Code not found — skipping claude import"
} else {
    Write-Host "No claude config found in repo — skipping"
}

# Import Engram memories from repo
$engramDir = Join-Path $repo ".engram"
if (Test-Path $engramDir) {
    Push-Location $repo
    engram sync --import
    Pop-Location
    Write-Host "Engram memories imported from $engramDir"
} else {
    Write-Host "No Engram chunks found in $engramDir — skipping memory import"
}
