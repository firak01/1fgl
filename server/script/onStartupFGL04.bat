@echo off
REM 20130224: Einbinden �ber Gruppenrichtlinien (Policy)
REM Unter Windows XP: Powertoys f�r Windows XP / TweakUI starten
REM                   Menue w�hlen: About \ Policy => Run Group Policy Editor
REM 		      Im Baum w�hlen: Computerkonfiguration \ Windows-Einstellungen \ Scripts (Starten / herunterfahren)
REM                   Doppelclick rechts auf "Starten"
REM                   Button hinzuf�gen: und z.B. scriptHostAll anlegen.

REM unter dem Button <Dateien Anzeigen> sieht man dann eine scriptHostAll.cmd Datei (bzw. beim ersten Mal muss man die selbst anlegen),
REM die kann man mit dem Editor bearbeiten und folgenden Eintrag erstellen (OHNE DAS ERSTE REM)
REM REM Das muss im autologon-Ordner liegen. Hier wird das nicht ausgef�hrt.
REM start /wait c:\server\virtualbox\startFGL02.bat

@echo off
echo.##########################################
echo.# Domino Server - 0 Byte Dateien l�schen #
echo.# FGL04 Version vom 2009-02-14    by FGL #
echo.##########################################
REM Manchmal bleiben diese 0 Byte Dateien zur�ck und verhindern den Start des Domino Servers

set "notesdatadir=C:\Lotus\Domino\data"
del /F /Q %notesdatadir%\.jsc_cmd
del /F /Q %notesdatadir%\.jsc_lock
del /F /Q %notesdatadir\~notes.lck
exit

