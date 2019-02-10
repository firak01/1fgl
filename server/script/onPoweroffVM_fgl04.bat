@REM ########################################################################
@REM # Shutdown Script, wenn Maschine über den VMWare PowerOff button beendet wird
@REM # Version 20130224 by FGL
@REM ########################################################################

REM Warte auf den Domino Server
start /wait c:\server\script\onShutdownFGL04.bat
