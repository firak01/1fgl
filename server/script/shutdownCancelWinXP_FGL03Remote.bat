REM FGL: 20210107
REM Batch zum Abbrechen des Runterfahrens von Win7 Rechnern (REMOTE)
REM In den Shutdown Scripten ist beschrieben, welche Voraussetzungen erfüllt sein müssen.
net use \\192.168.3.103 1fgl2fgl /USER:lindhaueradmin
shutdown -m \\192.168.3.103 /a
pause
exit

