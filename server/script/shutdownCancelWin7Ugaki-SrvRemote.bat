REM FGL: 20160331
REM Batch zum Abbrechen des Runterfahrens von Win7 Rechnern (OHNE Neustart)
REM falls noch spezielles erledigt werden muss. Diese Datei umbenennen z.B. nach shutdownRestartScipio.bat und dann jetzt das Spezialscript verwenden
REM cd\
REM cd server\script
REM start /wait onShutdownScipio.bat
shutdown -m \\Ugaki-SRV /a
pause
exit
