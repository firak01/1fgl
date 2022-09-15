REM FGL: 20160331
REM Batch zum Runterfahren von Win10 Rechnern (OHNE Neustart)
REM falls noch spezielles erledigt werden muss. Diese Datei umbenennen z.B. nach shutdownRestartScipio.bat und dann jetzt das Spezialscript verwenden
REM zwischen den Parametern /t: 720 muss nach dem Doppelpunkt ein Leerzeichen stehen
REM cd\
REM cd server\script
REM start /wait onShutdownScipio.bat
shutdown /f /s /t: 720 /c "Runterfahren des Hostsystems. Dringend alle Server runterfahren."
pause
exit