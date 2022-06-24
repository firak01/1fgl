REM: CODIERUNG MUSS ANSI SEIN, damit DOS Batch Befehle erkannt werden.

REM FGL 20210107:
REM Batch zum Runterfahren und Neustarten von WinXP Rechnern REMOTE
REM zwischen den Parametern /t: 720 muss nach dem Doppelpunkt ein Leerzeichen stehen
REM Ein Abbrechen des Remote Shutdowns ist auch remote möglich
REM

REM Voraussetzungen
REM 1. Service/Dienst RemoteRegistry auf beiden beteiligten Rechnern aktiviert und gestartet
REM 2. Auf beiden beteiligten Rechnern in der Windows Registry folgenden Eintrag ergänzt, bzw. das Abstellen der Rechtefilterung von der UAC ist notwendig:
REM    Abhilfe schafft der Eintrag eines Schlüssels in die Registrierdatenbank des verwalteten PCs, so dass die Rechte des lokalen Admins auch über das Netz durchgereicht werden. Dazu gibt man am einfachsten in einer Eingabeaufforderung mit Adminstratorrechten den Befehl
REM    Dies mit cmd.exe als Admin ausführen.
REM    reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\system /v LocalAccountTokenFilterPolicy /t REG_DWORD /d 1 /f
REM    
REM ABER ABER ABER: Unter WinXP gibt es diese Einschränkung nicht. Dafür hat man andere Probleme
REM

REM PROBLEME UNTER WIN XP
REM Merke: Wenn es bereits Verbindungen zu einem Rechner gibt, kann net use keine weitere Verbindung erstellen.
REM        Lösung, siehe: How to Fix Error 1219: Multiple connections to a server or shared resource by the same user
REM        http://backupchain.com/i/how-to-fix-error-1219-multiple-connections-to-a-server-or-shared-resource-by-the-same-user
REM        Beispiel:
REM        	192.168.3.103 fgl03
REM 	        192.168.3.103 fgl03_for_NetUse 
REM 
REM        ABER: Diese Lösung liefert den Fehler 52, nämlich, dass doppelte Einträge vorhanden sind.
REM              Dafür soll wiederum die Lösung sein... verwende IP Adresse.
REM              ALso kann man gleich mit der IP Adresse arbeiten. 
REM 
REM So kommt man dann zu folgendem:
REM net use \\192.168.3.103 1fgl2fgl /USER:lindhaueradmin
REM shutdown /f /s -m \\192.168.3.103 /t: 720 /c "Remote Shutdown des Systems. Dringend alle Server runterfahren."
REM 
REM Das aber reicht noch nicht. 
REM Gemäß https://administrator.de/forum/shutdown-r-m-name-zugriff-verweigert-need-help-8216.html
REM muss noch die Standardeinstellung auf dem herunterzufahrenden XP - Rechner angepasst werden.
REM Stichwort:
REM In den Gruppenrichtlinien für den lokalen Computer..
REM "Netzwerkzugriff: Modell für gemeinsame Nutzung und Sicherheitsmodell für lokale Konten"
REM Wert ändern auf: "Klassisch - lokale Benutzer authentifizieren sich als sie selbst"



REM ALSO DER KONKRETE BEFEHL FUER JEDEN INDIVIDUELLEN RECHNER, LEIDER UNTER XP NUR MIT FESTER IP:
net use \\192.168.3.131 1fgl2fgl /USER:lindhaueradmin
shutdown /f /s -m \\192.168.3.131 /t: 60 /c "Remote Shutdown des Systems. Dringend alle Server runterfahren."

pause
exit

REM Das ist so nicht möglich.....
REM falls noch spezielles erledigt werden muss. Diese Datei umbenennen z.B. nach shutdownRestartScipio.bat und dann jetzt das Spezialscript verwenden
REM cd\
REM cd server\script
REM start /wait onShutdownScipio.bat