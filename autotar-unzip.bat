REM %1 katalog zrodlowy, %2 katalog docelowy
REM %3 katalog docelowy jesli w archiwum nie ma podkatalogu o nazwie takiej jak archiwum
REM %4 nazwa pliku docelowego bez rozszerzenia
REM %5 = 1 po udanej operacji usuñ archuwum tar,gz,xz,7z

IF EXIST %3 GOTO :PLIKISTNIEJE
REM Sprawdz czy istnieje w pliku archiwum podkatalog o tej samej nazwie co plik archiwum
REM errorlevel = 0 w FIND oznacza ze, 7zip nie znalazl katalogu o danej nazwie, musisz go utworzyc

7z.exe l %1 %4 | FIND "0 folders"
REM Jezeli 7zip nie znajdzie takiego to tworz katalog wypakuj do niego %~dpn1
REM else wypakuj bezposrednio %2

IF NOT %errorlevel% == 0 GOTO :TWORZKATALOG 
@ECHO "WYPAKOWUJE bezposrednio 7z.exe e -y %1 -o%2"
7z.exe x -y %1 -o%2 
IF NOT %errorlevel% == 0 GOTO :PROBLEMZ
GOTO :USUNARCHIWUM

:TWORZKATALOG
@ECHO "Tworze NOWY katalog i WYPAKOWUJE 7z.exe x -y %1 -o%~dpn1"
  MKDIR "%~dpn1"
IF NOT %errorlevel% == 0 GOTO :PROBLEMD 
  7z.exe x -y %1 -o"%~dpn1" 
IF NOT %errorlevel% == 0 GOTO :PROBLEMZ
GOTO :USUNARCHIWUM

REM Usuñ plik po udanej dekompresji jesli parametr %5 = 1 dla plikow xz,gz,7z 
:USUNARCHIWUM
IF NOT %errorlevel% == 0 GOTO :KONIEC
IF NOT %5 == 1 GOTO :KONIEC 
  @ECHO "Usuwam archiwum zrodlowe %~1"
  DEL /F %1
  IF NOT %errorlevel% == 0 GOTO :PROBLEMK
GOTO :KONIEC

:PLIKISTNIEJE
IF %AUTODEBUG%==1 @ECHO ERROR: Katalog docelowy "%~n3" JUZ ISTNIEJE
GOTO :KONIEC

:PROBLEMD
  @ECHO ERROR: Nie mozna utworzyc katalogu "%~n1"
GOTO :KONIEC

:PROBLEMK
  @ECHO ERROR: Nie mozna skasowac archiwum "%~n1"
GOTO :KONIEC

:PROBLEMZ
  @ECHO ERROR: Nie mozna wypakowac "%~n1"
GOTO :KONIEC

:KONIEC
