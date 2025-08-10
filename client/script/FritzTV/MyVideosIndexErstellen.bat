@echo off
REM ========================================
REM Batch-Datei: .mpg-Dateien im Verzeichnis indizieren (Avidemux CLI)
REM ========================================

REM Pfad zu Avidemux CLI definieren
set "avidemux=C:\Program Files\Avidemux 2.7 - 32 bits\avidemux_cli.exe"

REM Prüfen, ob überhaupt ein Verzeichnis oder Datei übergeben wurde
if "%~1"=="" (
    echo Bitte einen Ordner oder eine Datei per Drag & Drop auf diese Batch ziehen.
    pause
    exit /b
)

REM Falls eine Datei übergeben wurde → deren Ordner verwenden
if not exist "%~1\" (
    set "folder=%~dp1"
) else (
    set "folder=%~1"
)

echo Verwende Ordner: "%folder%"
echo.

REM Schleife über alle .mpg-Dateien (ohne Unterordner)
for %%f in ("%folder%\*.mpg") do (
    echo Indiziere: "%%f"
    "%avidemux%" --index-mpeg "%%f"
    echo.
)

echo Fertig.
pause
