@echo off
:menu

set /p opcao= Escolha a opcao:

if %opcao% equ 1 goto opcao1
if %opcao% equ 2 goto opcao2
if %opcao%

:opcao1
Start calc.exe
pause
Goto menu

:opcao2
cls
exit

:error
@echo Não selecionado