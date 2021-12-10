@echo off

:menu
cls
color 1b
:: SEQUESTRO DOS DADOS DO ID DO WINDOWS E USER LOGADO
@echo Computador: %computername%         Usuario: %username%
echo Data e Hora da inicializacao do Script: %date%-%time%

:: #REGION MENU DE INICIALIZAÇÃO
echo.
echo Aguia Script 2013-2020
echo.
echo Entre com a opcao desejada.
echo ***********************************************
echo 1. Gerenciamento do Computador (Confirm. ADM) *
echo 2. Criar inventario de Rede e Sistema         *
echo 3. Painel de controle do Windows              *
echo 4. Controle de redes do Windows               * 
echo 5. Editor de politica local (Confirm. ADM)    *
echo 6. Voltar para Windows                        *
echo ***********************************************
echo.
:: #ENDREGION

:: PARAMETROS "GerComputer", "InventRedeCPU", "CtrolPainel", 
:: "CtrolRedes", "CtrolPolices", "CloseScript", "ExceptionErrorMenu"

:: #REGION MENU DE ESCOLHA DO SCRIPT
set /p opcao= Escolha a opcao: 
if %opcao% equ 1 goto GerComputer
if %opcao% equ 2 goto InventRedeCPU
if %opcao% equ 3 goto CtrolPainel
if %opcao% equ 4 goto CtrolRedes
if %opcao% equ 5 goto CtrolPolices
if %opcao% equ 6 goto CloseScript
if %opcao% geq 7 goto ExceptionErrorMenu
:: #ENDREGION

:: #REGION ESTRUTURA IF
:GerComputer
Start compmgmt.msc
Goto menu

:InventRedeCPU
@Echo off
cd\
c:
MD Inventario
CD Inventario
cls
ipconfig /all >> c:\Inventario\Rede.txt
systeminfo >> c:\Inventario\CPUinfo.txt
cls
echo.
echo Inventario coletado com sucesso.
echo.
echo Os Arquivos do inventario foram
echo gravados no caminho "C:\inventario"
echo Pressione ENTER para retornar ao menu do script.
echo.
pause >NUL
Goto menu

:CtrolPainel
start control
Goto menu

:CtrolRedes
start ncpa.cpl
Goto menu

:CtrolPolices
start gpedit.msc
Goto menu

:CloseScript
cls
exit
:: #ENDREGION

:: #REGION TRATAMENTO DA EXCEPÇÃO DO MENU.
:ExceptionErrorMenu
echo Opcao invalida Entre com opcoes de (1 a 6)
echo Pressione ENTER para retornar ao menu do script.
echo.
pause >NUL
Goto menu
:: #ENDREGION
