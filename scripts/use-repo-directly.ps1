$ErrorActionPreference = "Stop"

$repo = Split-Path $PSScriptRoot -Parent
$configFile = Join-Path $repo "config\opencode.json"

[Environment]::SetEnvironmentVariable("OPENCODE_CONFIG", $configFile, "User")
[Environment]::SetEnvironmentVariable("OPENCODE_CONFIG_DIR", $repo, "User")

Write-Host "Configurado para usar el repo directamente."
Write-Host "Abre una terminal nueva antes de usar OpenCode."
