REM Fahre das System runter und warte einige Secunden, nur um dann per Ping die Stromleiste zu erreichen.
REM Dadurch soll dort ggfs. beim Runterfahren das Abstellen einer Steckdose sichergestellt weden.
C:\WINDOWS\system32\shutdown.exe -s -f -t 15 -c "Runterfahren des Hostsystems. Dringend alle Server runterfahren. Neustart per BIOS Einstellung." -f

REM Warte bis 1 Sekunde vor Ende der Shutdown Zeit.
REM Funktioniert irgendwie nicht unter winxp timeout /t 14
REM Wartezeit in Millisekunden.
sleep 14000


REM Ping die Steckdosenleiste an
cd \
cd 1fgl\server\script
start .\PowerManagerEnergenieLAN\"PingPowerManagerEnergenie.bat"

REM das Konselenfenster schliessen. Das ist wichtig, falls ein aufrufendes Programm auf das Ende der Batch wartet.
exit
