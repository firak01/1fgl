REM In das Verzeichnis der .exe wechseln

REM IP Adresse /a 192.168.3.110
REM MAC Adresse
REM Physikalische Adresse hier takagi:

REM In das Verzeichnis der EXE-Wechseln
cd mc-wol
mc-wol 10:FF:E0:AF:6D:10

REM angehängt die IP Adresse von dem Rechner von dem man aus den Befehl startet... damit man nicht die falsche NIC erwischt.
REM cd wol
REM wol 10:FF:E0:AF:6D:10 192.168.3.194

pause
