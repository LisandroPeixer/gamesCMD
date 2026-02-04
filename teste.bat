@echo off

::set /a ALEATORIO=%random%

Set /a ALEATORIO=(%RANDOM%* 10 /32768)+1
echo %ALEATORIO%
if %ALEATORIO% == 1 set JOGADA=a1
if %ALEATORIO% == 2 set JOGADA=a2
if %ALEATORIO% == 3 set JOGADA=a3
if %ALEATORIO% == 4 set JOGADA=b1
if %ALEATORIO% == 5 set JOGADA=b2
if %ALEATORIO% == 6 set JOGADA=b3
if %ALEATORIO% == 7 set JOGADA=c1
if %ALEATORIO% == 8 set JOGADA=c2
if %ALEATORIO% == 9 set JOGADA=c3

echo %JOGADA%
pause