@echo offf
REM Starte nach dem Einschalten alle angeschlossenen Rechner
REM Win7 Version: Hier gibt es den sleep Befehl nicht mehr. 
REM               Verwende timeout
REM               Sleep Befehl kann über "Windows Resource Kit Tools" installiert werden.


REM #######################################################
echo WARTE ERST EINIGE ZEIT -  REchner SOLL FERTIG SEIN UND NETZWERK SOLL AKTIV SEIN
timeout 240
 
echo ################################################################
echo VERSUCHE DEN RECHNER ALARICH ZU STARTEN
timeout 30
REM call C:\1fgl\server\WakeOnLAN\mc-wol\wolAlarichFGL.bat
start C:\1fgl\server\WakeOnLAN\mc-wol\wolAlarichFGL.bat

echo ################################################################
echo VERSUCHE DEN RECHNER TOTILA ZU STARTEN
timeout 30
REM call C:\1fgl\server\WakeOnLAN\mc-wol\wolTotilaFGL.bat
start C:\1fgl\server\WakeOnLAN\mc-wol\wolTotilaFGL.bat

REM echo ################################################################
REM echo VERSUCHE DEN RECHNER PATTON ZU STARTEN
REM timeout 10
REM call C:\1fgl\server\WakeOnLAN\mc-wol\wolPattonFGL.bat


@echo on
REM Fahre den Rechner wieder automatisch herunter
echo ################################################################
echo VERSUCHE DEN RECHNER SCIPIO WIEDER HERUNTERZUFAHREN
timeout 30
REM call C:\1fgl\server\script\shutdownNoRestartScipioHost.bat
REM start C:\1fgl\server\script\shutdownNoRestartScipioHost.bat
start C:\1fgl\server\script\shutdownNoRestartWin7.bat


pause
exit