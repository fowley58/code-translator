$ErrorActionPreference = "Stop"

$msysGcc = "C:\msys64\ucrt64\bin\gcc.exe"
$projectDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$version = "1.0.1"
$exeName = "AI-Code-Translator-$version.exe"

if (-not (Test-Path $msysGcc)) {
    throw "MSYS2 GCC was not found at $msysGcc. Install MSYS2 UCRT64 and raylib first."
}

Set-Location $projectDir
& $msysGcc -Wall -Wextra -std=c11 main.c -o $exeName -mwindows -lraylib -lopengl32 -lgdi32 -lwinmm -lwinhttp
if ($LASTEXITCODE -ne 0) {
    throw "Windows build failed."
}

Write-Host "Windows build created: $projectDir\$exeName"
Write-Host "Copying runtime DLLs next to the executable..."
$runtimeDir = "C:\msys64\ucrt64\bin"
Get-ChildItem $runtimeDir -Filter *.dll | ForEach-Object {
    $target = Join-Path $projectDir $_.Name
    if (-not (Test-Path $target)) {
        Copy-Item $_.FullName $projectDir -Force
    }
}

Write-Host "Version: $version"
Write-Host "Build finished. You can run the app by double-clicking: $projectDir\$exeName"
