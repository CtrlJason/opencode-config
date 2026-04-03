$ErrorActionPreference = "Stop"

$target = Join-Path $HOME ".config\opencode"
$repo = Split-Path $PSScriptRoot -Parent
$configDir = Join-Path $repo "config"

New-Item -ItemType Directory -Force $target | Out-Null

Copy-Item (Join-Path $configDir "opencode.json") (Join-Path $target "opencode.json") -Force

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
