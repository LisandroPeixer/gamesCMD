@echo off

:comeco
setlocal enabledelayedexpansion
title Jogo da Velha - BATCH
:: Inicializar Tabuleiro
for /l %%i in (1,1,9) do set p%%i=%%i
set turn=X

:loop
cls

echo. JOGO DA VELHA
echo.
echo.  %p1% ^| %p2% ^| %p3%
echo. ---+---+---
echo.  %p4% ^| %p5% ^| %p6%
echo. ---+---+---
echo.  %p7% ^| %p8% ^| %p9%
echo.
echo. Vez do jogador: %turn%
if "%turn%"=="X" set /p "move=Escolha um numero (1-9): "
if "%turn%"=="O" set /a move=(%RANDOM%* 10 /32768)+1
::pause >nul


:: Validar movimento
if !p%move%! == X goto loop
if !p%move%! == O goto loop
if "%move%" GTR "9" goto loop
if "%move%" LSS "1" goto loop

set p%move%=%turn%

:: Checar Vitoria
call :checkwin
if "%winner%"=="1" goto end

:: Alternar turno
if "%turn%"=="X" (set turn=O) else (set turn=X)


goto loop

:checkwin
set winner=0
:: Linhas
if "!p1!"=="!p2!" if "!p2!"=="!p3!" set winner=1
if "!p4!"=="!p5!" if "!p5!"=="!p6!" set winner=1
if "!p7!"=="!p8!" if "!p8!"=="!p9!" set winner=1
:: Colunas
if "!p1!"=="!p4!" if "!p4!"=="!p7!" set winner=1
if "!p2!"=="!p5!" if "!p5!"=="!p8!" set winner=1
if "!p3!"=="!p6!" if "!p6!"=="!p9!" set winner=1
:: Diagonais
if "!p1!"=="!p5!" if "!p5!"=="!p9!" set winner=1
if "!p3!"=="!p5!" if "!p5!"=="!p7!" set winner=1
goto :eof

:end
cls
echo. JOGO DA VELHA
echo.
echo.  %p1% ^| %p2% ^| %p3%
echo. ---+---+---
echo.  %p4% ^| %p5% ^| %p6%
echo. ---+---+---
echo.  %p7% ^| %p8% ^| %p9%
echo.
echo. JOGADOR %turn% VENCEU!
pause >nul
goto comeco