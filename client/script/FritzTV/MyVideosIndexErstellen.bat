@echo off
REM ========================================
REM Batch-Datei: .mpg-Dateien im Verzeichnis indizieren (Avidemux CLI)
REM ========================================

REM echo Erster Übergabeparameter %1
if [%1]==[] GOTO :paramcheck

REM Variablen zur Laufzeit erweitern, nicht beim Parsen, also auch in einer Schleife als Neuberechnung
REM z.B. SETLOCAL
REM      set "_var=first"
REM      set "_var=second" & Echo %_var%
REM      führt zur Ausgabe von first.   Grund: %_var% wurde in den speicher gelesen, bevor das 2. Set wirkte (also beim  Parsen)
REM  
REM Demgegenüber
REM z.B. SETLOCAL EnableDelayedExpansion
REM      set "_var=first"
REM      set "_var=second" & Echo %_var% !_var!
REM      führt zur Ausgabe von first second   Grund: !_var! wurde so spät als möglich in den Speicher gelesen (also zur Laufzeit)
setlocal EnableDelayedExpansion


REM Pfad zu Avidemux CLI definieren
REM set "avidemux=C:\Program Files\Avidemux 2.8 VC++ 64bits\avidemux_cli.exe"
set "avidemux=C:\Program Files\Avidemux 2.8 VC++ 64bits\avidemux.exe"


REM Die tilde ~ soll bewirken, dass ein umgebenden Hochkomma entfernt wird
:mainLoop
    echo Indiziere: %1
	
	REM das entfernt das erste und das letzte Hochkomma
	SET filetotal=%~1
	echo Indiziere filetotal: %~1
	
	REM Auf das Hochkomma als ersten Buchstaben zu prüfen ist irgendwie nicht möglich.
    REM aber durch den Trick mit SET filetotal=%~1 werden erste und letze Hochkomma entfernt
    "%avidemux%" --autoindex --load "%filetotal%" --quit )
	shift
    echo.xxx Ende der Dateiindizierung xxx
	if not "%~1"=="" goto mainLoop
goto :ende

:paramcheck
	echo 'Bitte eine oder mehrere Dateien per Drag ^& Drop auf diese Batch ziehen.'
	pause
	goto :eof


:ende
echo Fertig mit allen Dateien.
pause
