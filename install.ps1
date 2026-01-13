Write-Host ""
Write-Host "Czy chcesz zainstalować WTTI?"
Write-Host "Naciśnij T aby instalować"
Write-Host "Naciśnij N aby anulować"
Write-Host ""

do {
    $key = [System.Console]::ReadKey($true).Key
} until ($key -eq "T" -or $key -eq "N")

if ($key -eq "N") {
    Write-Host "Anulowano."
    exit
}

Write-Host "Instalowanie..."

$repoRaw = "https://github.com/bartuss225/pliki/releases/download/v1.1.1/WTTI.exe"
$outFile = Join-Path ([Environment]::GetFolderPath("Downloads")) "WTTI.exe"

try {
    Invoke-WebRequest -Uri $repoRaw -OutFile $outFile
} catch {
    Write-Error "Błąd pobierania pliku"
    exit 1
}

Write-Host "Uruchamianie instalatora..."
Start-Process $outFile -Wait
