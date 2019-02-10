REM FGL 20190201:
REM Batch zum Runterfahren und Neustarten von Win7 Rechnern REMOTE
REM zwischen den Parametern /t: 720 muss nach dem Doppelpunkt ein Leerzeichen stehen
REM Ein Abbrechen des Remote Shutdowns ist auch remote möglich


REM Voraussetzungen
REM 1. Service/Dienst RemoteRegistry auf beiden beteiligten Rechnern aktiviert und gestartet
REM 2. Auf beiden beteiligten Rechnern in der Windows Registry folgenden Eintrag eränzt:
REM    
shutdown /f /r -m \\Ugaki-SRV /t: 720 /c "Neustart des Hostsystems. Dringend alle Server runterfahren."
pause
exit

REM Das ist so nicht möglich.....
REM falls noch spezielles erledigt werden muss. Diese Datei umbenennen z.B. nach shutdownRestartScipio.bat und dann jetzt das Spezialscript verwenden
REM cd\
REM cd 1fgl\server\script
REM start /wait onShutdownScipio.bat