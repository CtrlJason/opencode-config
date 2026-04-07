param(
    [string]$RepoPath = "",
    [string]$TargetBinDir = "",
    [switch]$Force
)

$ErrorActionPreference = "Stop"

if (-not $RepoPath) {
    $RepoPath = Join-Path $HOME "engram"
}

if (-not $TargetBinDir) {
    $TargetBinDir = Join-Path $HOME "bin"
}

function Test-CommandExists {
    param([string]$Name)

    return $null -ne (Get-Command $Name -ErrorAction SilentlyContinue)
}

function Ensure-UserPathContains {
    param([string]$Directory)

    $currentUserPath = [Environment]::GetEnvironmentVariable("Path", "User")
    $parts = @()
    if ($currentUserPath) {
        $parts = $currentUserPath -split ";"
    }

    if ($parts -notcontains $Directory) {
        $newPath = if ($currentUserPath) { "$Directory;$currentUserPath" } else { $Directory }
        [Environment]::SetEnvironmentVariable("Path", $newPath, "User")
        Write-Host "Agregado al PATH de usuario: $Directory"
    }

    $sessionParts = $env:Path -split ";"
    if ($sessionParts -notcontains $Directory) {
        $env:Path = "$Directory;$env:Path"
    }
}

function Get-GoBin {
    if (-not (Test-CommandExists "go")) {
        return $null
    }

    $goBin = (& go env GOBIN).Trim()
    if ($goBin) {
        return $goBin
    }

    $goPath = (& go env GOPATH).Trim()
    if ($goPath) {
        return (Join-Path $goPath "bin")
    }

    return (Join-Path $HOME "go\bin")
}

function Install-FromSource {
    param(
        [string]$RepositoryPath,
        [string]$TargetFile
    )

    Write-Host "Instalando Engram desde fuente con Go..."
    & git -C $RepositoryPath pull --ff-only
    Push-Location $RepositoryPath
    try {
        & go install ./cmd/engram
    }
    finally {
        Pop-Location
    }

    $goBin = Get-GoBin
    $builtBinary = Join-Path $goBin "engram.exe"
    if (-not (Test-Path $builtBinary)) {
        throw "Go termino sin dejar engram.exe en $builtBinary"
    }

    Copy-Item $builtBinary $TargetFile -Force
}

function Install-FromRelease {
    param([string]$TargetFile)

    Write-Host "Instalando Engram desde release oficial..."
    $arch = if ([Environment]::Is64BitOperatingSystem -and $env:PROCESSOR_ARCHITECTURE -match "ARM") {
        "windows_arm64.zip"
    }
    else {
        "windows_amd64.zip"
    }

    $release = Invoke-RestMethod -Uri "https://api.github.com/repos/Gentleman-Programming/engram/releases/latest"
    $asset = $release.assets | Where-Object { $_.name -like "*${arch}" } | Select-Object -First 1

    if (-not $asset) {
        throw "No encontre un release de Engram para $arch"
    }

    $zipPath = Join-Path $env:TEMP $asset.name
    $extractPath = Join-Path $env:TEMP ("engram-" + [guid]::NewGuid().ToString("N"))

    Invoke-WebRequest -Uri $asset.browser_download_url -OutFile $zipPath
    Expand-Archive -Path $zipPath -DestinationPath $extractPath -Force

    $downloadedBinary = Join-Path $extractPath "engram.exe"
    if (-not (Test-Path $downloadedBinary)) {
        throw "No encontre engram.exe dentro del release descargado"
    }

    Copy-Item $downloadedBinary $TargetFile -Force
    Remove-Item $zipPath -Force -ErrorAction SilentlyContinue
    Remove-Item $extractPath -Recurse -Force -ErrorAction SilentlyContinue
}

$targetFile = Join-Path $TargetBinDir "engram.exe"
New-Item -ItemType Directory -Force $TargetBinDir | Out-Null
Ensure-UserPathContains -Directory $TargetBinDir

if (-not (Test-CommandExists "git")) {
    throw "Git es obligatorio para preparar el repo local de Engram. Instala Git y vuelve a correr el bootstrap."
}

if (Test-Path $RepoPath) {
    Write-Host "Actualizando repo local de Engram en $RepoPath"
    & git -C $RepoPath fetch --all --prune
    & git -C $RepoPath pull --ff-only
}
else {
    Write-Host "Clonando repo de Engram en $RepoPath"
    & git clone https://github.com/Gentleman-Programming/engram.git $RepoPath
}

if ((Test-Path $targetFile) -and -not $Force) {
    Write-Host "Engram ya existe en $targetFile"
    return
}

$existing = Get-Command engram -ErrorAction SilentlyContinue
if ($existing -and -not $Force) {
    Copy-Item $existing.Source $targetFile -Force
    Write-Host "Engram ya existia y se copio a $targetFile"
    return
}

if (Test-CommandExists "go") {
    Install-FromSource -RepositoryPath $RepoPath -TargetFile $targetFile
}
else {
    Install-FromRelease -TargetFile $targetFile
}

if (-not (Test-Path $targetFile)) {
    throw "No pude dejar engram.exe en $targetFile"
}

Write-Host "Engram listo en $targetFile"
