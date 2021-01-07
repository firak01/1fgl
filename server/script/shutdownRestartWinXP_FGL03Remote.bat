REM FGL: 20210107
REM Batch zum Runterfahren und Neustarten von Win7 Rechnern REMOTE
REM In den Shutdown Scripten ist beschrieben, welche Voraussetzungen erfüllt sein müssen.
net use \\192.168.3.103 1fgl2fgl /USER:lindhaueradmin
shutdown /f /r -m \\192.168.3.103 /t: 20 /c "Remote Neustart des Systems. Dringend alle Server runterfahren."
pause
exit
