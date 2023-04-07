@ECHO OFF
SETLOCAL
CALL auto-debug.bat
:TESTUJ
FOR /D /R %%G IN ("%~1\*.tar") CALL autoren-rename.bat %%G "%%~dpG" "%%~dpnG" "%%~nG" 1
:KONIEC
@ECHO "KONIEC w %1 CDN.."
ENDLOAL