REM FGL: 20160331
REM Batch zum Runterfahren und Neustarten von Win7 Rechnern REMOTE
REM falls noch spezielles erledigt werden muss. Diese Datei umbenennen z.B. nach shutdownRestartScipio.bat und dann jetzt das Spezialscript verwenden
REM zwischen den Parametern /t: 720 muss nach dem Doppelpunkt ein Leerzeichen stehen
REM cd\
REM cd server\script
REM start /wait onShutdownScipio.bat
shutdown /f /r -m \\ugaki-srv /t: 720 /c "Neustart des Hostsystems. Dringend alle Server runterfahren."
pause
exit