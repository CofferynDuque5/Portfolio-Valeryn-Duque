@echo off
REM ============================================================
REM  setup.bat - deja el proyecto LISTO para ejecutar.
REM  Genera las carpetas de plataforma (android/ios/...) con tu
REM  Flutter SIN borrar el codigo con estilo (lib/ y pubspec.yaml).
REM  Uso: doble clic, o en terminal:  setup.bat
REM ============================================================
cd /d "%~dp0"

echo.
echo === 1) Respaldando tu codigo (lib + pubspec) ===
if exist lib_mine rmdir /s /q lib_mine
ren lib lib_mine
copy /y pubspec.yaml pubspec.mine.yaml >nul

echo.
echo === 2) Generando plataformas con flutter create ===
call flutter create .
if errorlevel 1 (
  echo.
  echo ERROR: fallo "flutter create". Revisa que "flutter" este en el PATH.
  REM restaurar por si acaso
  if exist lib rmdir /s /q lib
  ren lib_mine lib
  copy /y pubspec.mine.yaml pubspec.yaml >nul
  del pubspec.mine.yaml >nul 2>&1
  pause
  exit /b 1
)

echo.
echo === 3) Restaurando tu codigo con estilo ===
rmdir /s /q lib
ren lib_mine lib
copy /y pubspec.mine.yaml pubspec.yaml >nul
del pubspec.mine.yaml >nul 2>&1

echo.
echo === 4) Instalando dependencias ===
call flutter pub get

echo.
echo ============================================================
echo  LISTO. Conecta un dispositivo/emulador y ejecuta:
echo     flutter run
echo ============================================================
pause
