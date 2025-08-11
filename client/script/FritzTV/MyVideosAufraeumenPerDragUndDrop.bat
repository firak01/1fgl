@echo off
setlocal EnableDelayedExpansion
title Aufräumen des Verzeichnisses myVideos

REM ============================
REM Verzeichnis bestimmen
REM ============================

if not "%~1"=="" (
    REM Prüfen, ob der Parameter ein Verzeichnis ist
    if exist "%~1\" (
        set "directory=%~1"
    ) else (
        REM Andernfalls: Parameter ist wohl eine Datei -> Verzeichnis der Datei nehmen
        set "directory=%~dp1"
        REM Letztes Backslash entfernen, falls vorhanden
        if "!directory:~-1!"=="\" set "directory=!directory:~0,-1!"
    )
) else (
    REM Kein Parameter übergeben -> Standardverzeichnis verwenden
    set "directory=C:\myVideos"
)

echo Nutze Verzeichnis: "!directory!"

REM ============================
REM Laufwerk ermitteln und wechseln
REM ============================
set "drive=%directory:~0,2%"
%drive%
cd /d "!directory!"

REM ============================
REM Aufräumen
REM ============================
del *.idx  2>nul
del *.idx2 2>nul
del *.fif  2>nul
del *.xml  2>nul
del *.html 2>nul

echo Aufräumen abgeschlossen.
pause
exit /b
