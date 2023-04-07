@ECHO OFF
SETLOCAL
CALL auto-debug.bat
:TESTUJ
SET "WKATALOGU=%1"
IF [%1]==[] SET "WKATALOGU="
FOR /R %WKATALOGU% %%G IN (*.gz,*.xz,*.tar,*.7z,*.rar) DO CALL autotar-unzip.bat %%G "%%~dpG" "%%~dpnG" "%%~nG" 1
FOR /R %WKATALOGU% %%G IN (*.zip) DO CALL autotar-unzip.bat %%G "%%~dpG" "%%~dpnG" "%%~nG" 0
:KONIEC
IF %AUTODEBUG%==1 @ECHO KONIEC w katalogu %WKATALOGU%
ENDLOCAL