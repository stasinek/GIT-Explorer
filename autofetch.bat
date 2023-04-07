REM @ECHO OFF
SETLOCAL
CALL auto-debug.bat
CALL auto-config.bat
:TESTUJ
SET "WKATALOGU=%~1"
IF [%1]==[] SET "WKATALOGU=."
FOR /D /R %%G in ("%WKATALOGU%\*") DO CALL autofetch-fetch.bat %%G
:KONIEC
@ECHO KONIEC w katalogu %WKATALOGU%
ENDLOCAL