# ============================================================
#  setup.ps1 - deja el proyecto LISTO para ejecutar (alternativa PowerShell).
#  Genera android/ios con tu Flutter SIN borrar el codigo con estilo.
#  Uso:  powershell -ExecutionPolicy Bypass -File .\setup.ps1
# ============================================================
Set-Location -Path $PSScriptRoot

Write-Host "`n=== 1) Respaldando tu codigo (lib + pubspec) ===" -ForegroundColor Cyan
if (Test-Path lib_mine) { Remove-Item lib_mine -Recurse -Force }
Rename-Item lib lib_mine
Copy-Item pubspec.yaml pubspec.mine.yaml -Force

Write-Host "`n=== 2) Generando plataformas con flutter create ===" -ForegroundColor Cyan
flutter create .
if ($LASTEXITCODE -ne 0) {
    Write-Host "ERROR: fallo 'flutter create'. Revisa que 'flutter' este en el PATH." -ForegroundColor Red
    Remove-Item lib -Recurse -Force -ErrorAction SilentlyContinue
    Rename-Item lib_mine lib
    Copy-Item pubspec.mine.yaml pubspec.yaml -Force
    Remove-Item pubspec.mine.yaml -Force -ErrorAction SilentlyContinue
    exit 1
}

Write-Host "`n=== 3) Restaurando tu codigo con estilo ===" -ForegroundColor Cyan
Remove-Item lib -Recurse -Force
Rename-Item lib_mine lib
Copy-Item pubspec.mine.yaml pubspec.yaml -Force
Remove-Item pubspec.mine.yaml -Force -ErrorAction SilentlyContinue

Write-Host "`n=== 4) Instalando dependencias ===" -ForegroundColor Cyan
flutter pub get

Write-Host "`nLISTO. Conecta un dispositivo/emulador y ejecuta:  flutter run" -ForegroundColor Green
