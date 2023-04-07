IF [%AUTOSKIPUJ%]==[%~n1] GOTO :SKIPUJ
IF EXIST "%~1\.git" (
@ECHO ZIPUJE plik "%~1.zip"
7z.exe a -tzip -mx8 -mmt -sdel "%~1.zip" %1 
) ELSE (
IF %AUTODEBUG%==1 @ECHO UWAGA: Nie ma gita w "%~n1"
CALL autozip.bat %1
)
GOTO :KONIEC
:SKIPUJ
@echo UWAGA Katalog jest na liście do skipowania
:KONIEC