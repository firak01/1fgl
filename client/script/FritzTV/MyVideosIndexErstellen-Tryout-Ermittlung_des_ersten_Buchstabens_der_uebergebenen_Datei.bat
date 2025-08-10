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



REM Ziel ist es wohl bei nur 1 Datei den ganzen Ordner zu nehmen.
REM Prüfen, ob überhaupt ein Verzeichnis oder Datei übergeben wurde
REM if "%~1"=="" (
    REM echo 'Bitte einen Ordner oder eine Datei per Drag ^& Drop auf diese Batch ziehen.'
	REM pause
    REM exit /b
REM }

REM Falls eine Datei übergeben wurde → deren Ordner verwenden
REM if not exist "%~1\" (
REM     set "folder=%~dp1"
REM ) else (
REM    set "folder=%~1"
REM )

REM echo Verwende Ordner: "%folder%"
REM echo.

REM Schleife über alle .mpg-Dateien (ohne Unterordner)
REM for %%f in ("%folder%\*.mpg") do if not exist %%f.idx2(
REM for %%f in ("%folder%\*.mpg") do (
REM    echo Indiziere: "%%f"
REM    "%avidemux%" --autoindex --load "%%f" --quit
REM   echo.
REM )

REM Die tilde ~ soll bewirken, dass ein umgebenden Hochkomma entfernt wird
:mainLoop
    echo Indiziere: %1
	
	REM das entfernt das erste und das letzte Hochkomma
	SET filetotal=%~1
	echo Indiziere filetotal: %~1
	
	REM ##################################
	REM ### Prüfe, ob der Dateinamen Hochkomma enthält.
	REM ### Falls ja, dann diese beim Start des Programms weglassen
	REM ### Falls nein, dann diese beim Start des Programms hinzufügen.
	REM ################################################################
	SET result=%filetotal%
	SET position=1
    	
	REM hier greift oben eingestelltes: setlocal EnableDelayedExpansion
	echo wert ohne ersten  Buchstabe !result:~%position%!
	
	goto laengeBerechnen
	:mainHoleErstesZeichen
	
	REM die Länge direkt eingeben ist nicht korrekt, da zuviel gezählt
	::echo wert erster Buchstabe !result:~%position%,-56!
	
	REM Ergo von der Länge die Position abziehen und einen mehr
	set /a position=%position%-1
	set /a cut=%length%-%position%-1
	echo wert von cut= %cut%
	::echo wert erster Buchstabe !result:~%position%,-%cut%!
	
	set ersterBuchstabe=!result:~%position%,-%cut%!
	echo wert erster Buchstabe !ersterBuchstabe!
	if !ersterBuchstabe!==D ( echo.1
                             "%avidemux%" --autoindex --load "%~1" --quit
	                        ) else ( echo 2
	                         "%avidemux%" --autoindex --load %~1 --quit )
	shift
    echo.xxx Ende der Dateiindizierung xxx
	if not "%~1"=="" goto mainLoop
goto :ende

:laengeBerechnen
    echo "Berechne Länge"
	set tempvar=%result%
	set length=0
	:laengeBerechnenLoop
	if "%tempvar%"=="" goto laengeBerechnenLoopEnde
	set tempvar=%tempvar:~0,-1%
	set /a length=%length%+1
	goto laengeBerechnenLoop
	:laengeBerechnenLoopEnde
	echo "Errechnete Länge="!length!
    goto mainHoleErstesZeichen

:paramcheck
	echo 'Bitte eine oder mehrere Dateien per Drag ^& Drop auf diese Batch ziehen.'
	pause
	goto :eof


:ende
echo Fertig mit allen Dateien.
pause
