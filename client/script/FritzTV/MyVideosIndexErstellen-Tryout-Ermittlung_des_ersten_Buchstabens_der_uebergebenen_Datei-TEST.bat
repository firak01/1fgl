REM nicht mit dem Wait befehl arbeiten, da das Konsolenfenster der neuen Batch sich nicht schliesst start /wait .\Domino\ServerDominoQuit.bat 
REM ausser die Batch schliesst explizit das konsolenfenster mit einem exit befehl
REM ABER: Wenn der server nicht mehr läuft, dann kann die konsole nix mehr entgegennehmen. Darum nicht verwenden:
REM start /wait .\Domino\ServerDominoQuit.bat 
start .\MyVideosIndexErstellen-Tryout-Ermittlung_des_ersten_Buchstabens_der_uebergebenen_Datei.bat "D:\1fgl\virtualIO\1todovideo\arte 2022-05-11 20-15-00.mpg" "D:\1fgl\virtualIO\1todovideo\arte 2022-05-14 20-15-00.mpg"