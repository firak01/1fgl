REM In das Verzeichnis der .exe wechseln

REM IP Adresse /a 192.168.3.130
REM MAC ADresse
REM FGL 2011-12-25: Funktioniert nur, wenn der Rechner kurz zuvor an war. Das BIOS scheint die Netzwerkkarte zu deaktivieren nach einiger Zeit.
REM ??? ipconfig /all gibt aber andere Angaben zurück .... mc-wol 00:11:d8:5f:d1:ff

REM In das Verzeichnis der EXE-Wechseln
cd mc-wol
mc-wol 00:11:D8:75:92:FE
pause
