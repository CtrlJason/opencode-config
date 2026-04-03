$ErrorActionPreference = "Stop"

[Environment]::SetEnvironmentVariable("OPENCODE_CONFIG", $null, "User")
[Environment]::SetEnvironmentVariable("OPENCODE_CONFIG_DIR", $null, "User")

Write-Host "Se quitaron OPENCODE_CONFIG y OPENCODE_CONFIG_DIR del entorno de usuario."
Write-Host "Abre una terminal nueva antes de usar OpenCode."
