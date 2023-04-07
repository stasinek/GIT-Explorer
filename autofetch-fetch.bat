IF [%AUTOSKIPUJ%]==[%~n1] GOTO :SKIPUJ
IF EXIST "%~1\.git" (
@ECHO POBIERAM GIT w %1
git.exe -C "%~1" fetch
) ELSE (
IF %AUTODEBUG%==1 @ECHO UWAGA: Nie ma gita w "%~n1"
REM CALL autofetch.bat "%~1"
)
GOTO :KONIEC
:SKIPUJ
@echo UWAGA Katalog jest na liœcie do skipowania
:KONIEC