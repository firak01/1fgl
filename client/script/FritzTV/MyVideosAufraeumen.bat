@echo aufräumen des Verzeichnisses myVideos
REM Entfernt Indexfile etc. aus dem MyVideos Verzeichnis.
pause

@echo on
cd \
cd MyVideos
del *.idx
del *.idx2
del *.fif
del *.xml
del *.html
pause