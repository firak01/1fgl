@echo aufräumen des Verzeichnisses myVideos
REM Entfernt Indexfile etc. aus dem MyVideos Verzeichnis.
pause

@echo off
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

REM ========================================
REM Batch-Datei: .mpg-Dateien im Verzeichnis indizieren (Avidemux CLI)
REM ========================================

REM echo Erster Übergabeparameter %1
REM das entfernt das erste und das letzte Hochkomma
if not "%~1"=="" ( 	SET directory=%~1
	 ) else (   SET directory=C:\myVideos
	 )
	 
	 
 echo Nutze Verzeichnis: %directory%

	
	SET result=%directory%
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
    SET drive=!ersterBuchstabe!

!drive!:
cd \
cd !directory!
del *.idx
del *.idx2
del *.fif
del *.xml
del *.html
goto :ende

:ende
pause
exit

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