::__________________________________________________________
::algoritmo para jogo da velha
::_________________________________________________________

@echo off
title JOGO DA VELHA
color 70

set A01= 
set A02= 
set A03= 
set B01= 
set B02= 
set B03= 
set C01= 
set C02= 
set C03= 
set X= 

set JOGADOR=X

:LOOP

cls

  setlocal enabledelayedexpansion

  set  arrayline[0]=       A     B     C
  set  arrayline[1]=    1  %A01%  I  %B01%  I  %C01%  I
  set  arrayline[2]=    -------------------
  set  arrayline[3]=    2  %A02%  I  %B02%  I  %C02%  I
  set  arrayline[4]=    -------------------
  set  arrayline[5]=    3  %A03%  I  %B03%  I  %C03%  I %X%

  ::read it using a FOR /L statement
  for /l %%n in (0,1,5) do ( echo !arrayline[%%n]! )
  echo.

  echo SUA VEZ %JOGADOR%
  set /p X=

if "%JOGADOR%"==X (set JOGADOR=O) else (set JOGADOR=X)

  if %X% == a1 set A01=X; GOTO TESTE

     GOTO PO
  ) 
  if %X% == a2 (
     set A02=X
     GOTO PO
  ) 
  if %X% == a3 (
     set A03=X
     GOTO PO
  )

  if %X% == b1 (
     set B01=X
     GOTO PO
  ) 
  if %X% == b2 (
     set B02=X
     GOTO PO
  ) 
  if %X% == b3 (
     set B03=X
     GOTO PO
  )

  if %X% == c1 (
     set C01=X
     GOTO PO
  ) 
  if %X% == c2 (
     set C02=X
     GOTO PO
  ) 
  if %X% == c3 (
     set C03=X
     GOTO PO
  ) else (
     echo opcao invalida tente novamente
     pause 
     GOTO LOOP
  )
  

:PO
set JOGADOR=O
cls

  setlocal enabledelayedexpansion

  set  arrayline[0]=       A     B     C
  set  arrayline[1]=    1  %A01%  I  %B01%  I  %C01%  I
  set  arrayline[2]=    -------------------
  set  arrayline[3]=    2  %A02%  I  %B02%  I  %C02%  I
  set  arrayline[4]=    -------------------
  set  arrayline[5]=    3  %A03%  I  %B03%  I  %C03%  I %X%

  ::read it using a FOR /L statement
  for /l %%n in (0,1,5) do ( echo !arrayline[%%n]! )
  echo.

  echo SUA VEZ %JOGADOR%
  set /p X=

  if %X% == a1 (
    set A01=O
    GOTO LOOP
  ) 
  if %X% == a2 (
    set A02=O
    GOTO LOOP
  ) 
  if %X% == a3 (
    set A03=O
    GOTO LOOP
  )

  if %X% == b1 (
    set B01=O
    GOTO LOOP
  ) 
  if %X% == b2 (
    set B02=O
    GOTO LOOP
  ) 
  if %X% == b3 (
    set B03=O
    GOTO LOOP
  )

  if %X% == c1 (
    set C01=O
    GOTO LOOP
  ) 
  if %X% == c2 (
    set C02=O
    GOTO LOOP
  ) 
  if %X% == c3 (
    set C03=O
    GOTO LOOP
  ) else ( 
    echo opcao invalida tente novamente 
    pause
    GOTO PO
    )

:TESTE
pause
  if "!A01!" == "!A02!" if "!A02!" == "!A03!" GOTO FIM
  if "!B01!" == "!B02!" if "!B02!" == "!B03!" GOTO FIM
  if "!C01!" == "!C02!" if "!C02!" == "!C03!" GOTO FIM

  if "!A01!" == "!B01!" if "!B01!" == "!C01!" GOTO FIM
  if "!A02!" == "!B02!" if "!B02!" == "!C02!" GOTO FIM
  if "!A03!" == "!B03!" if "!B03!" == "!C03!" GOTO FIM 

  if "!A01!" == "!B02!" if "!B02!" == "!C03!" GOTO FIM
  if "!A03!" == "!B02!" if "!B02!" == "!C01!" GOTO FIM

GOTO :eof
 
:FIM
echo JOGADOR %P% venceu
pause