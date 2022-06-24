REM FGL: 20200618, Zur Reparatur der automatischen Zeitsynchronisation.
REM      Merke: In der Registry wird gesetzt welcher Server und welches Intervall verwendet wird
REM      HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\W32Time\TimeProviders\NtpClient


REM https://www.tecchannel.de/a/windows-zeitdienst-reparieren,2033008
REM https://docs.microsoft.com/en-us/windows-server/networking/windows-time-service/windows-time-service-tools-and-settings

net Stop w32time
W32tm.exe /unregister
W32tm.exe /register
sc config w32time type= own
net Start w32time

w32tm /resync
pause
EOF