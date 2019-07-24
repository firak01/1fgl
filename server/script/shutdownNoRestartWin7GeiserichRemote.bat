REM FGL 20190201:
REM Batch zum Runterfahren und Neustarten von Win7 Rechnern REMOTE
REM zwischen den Parametern /t: 720 muss nach dem Doppelpunkt ein Leerzeichen stehen
REM Ein Abbrechen des Remote Shutdowns ist auch remote möglich

REM Voraussetzungen
REM 1. Service/Dienst RemoteRegistry auf beiden beteiligten Rechnern aktiviert und gestartet
REM 2. Auf beiden beteiligten Rechnern in der Windows Registry folgenden Eintrag ergänzt, bzw. das Abstellen der Rechtefilterung von der UAC ist notwendig:
REM    Abhilfe schafft der Eintrag eines Schlüssels in die Registrierdatenbank des verwalteten PCs, so dass die Rechte des lokalen Admins auch über das Netz durchgereicht werden. Dazu gibt man am einfachsten in einer Eingabeaufforderung mit Adminstratorrechten den Befehl
REM    reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\system /v LocalAccountTokenFilterPolicy /t REG_DWORD /d 1 /f
REM    
shutdown /f /s -m \\GEISERICH /t: 30 /c "Remote Shutdown des Rechners. Dringend alle Server runterfahren."
pause
exit

REM Das ist so nicht möglich.....
REM falls noch spezielles erledigt werden muss. Diese Datei umbenennen z.B. nach shutdownRestartScipio.bat und dann jetzt das Spezialscript verwenden
REM cd\
REM cd server\script
REM start /wait onShutdownScipio.bat