:menu
@echo off
cls
for /f "tokens=4*" %%A in ('ver') do set ver=%%A
IF "%ver%" LSS "10.0.14393*]" (echo ��ҪWin10 1607�����ϲ���ϵͳ����ʹ�ô˽ű���&& exit)
title �ȵ���� By 2096779623
echo =====================
echo 1.����/�ر��ȵ�
echo 2.�޸��ȵ�����
echo 3.�鿴�������豸
echo =====================
set /p input=��������Ҫִ�еĲ�����
if %input% equ 1 goto enaordishotspot
if %input% equ 2 goto changehotspotsettings
if %input% equ 3 goto showdevice
pause
goto menu

:enaordishotspot
cls
echo =====================
echo 1.����
echo 2.�ر�
echo =====================
set /p input=��������Ҫִ�еĲ�����
if %input% equ 1 powershell.exe -executionpolicy remotesigned -File "%cd%\start.ps1"
if %input% equ 2 powershell.exe -executionpolicy remotesigned -File "%cd%\stop.ps1"
pause
goto menu

:changehotspotsettings
cls
IF "%ver%" LSS "10.0.19041*]" (echo ��ҪWin10 2004�����ϲ���ϵͳ����ʹ�ô˹��ܣ�&& pause && goto menu)
set /p name=�������ȵ����ƣ�
set /p pass=�������ȵ����룺
echo 1. 2.4Ghz
echo 2. 5Ghz
echo 3.�Զ�
set /p band=��ѡ���ȵ�Ƶ�Σ�
if %band% equ 1 set band=TwoPointFourGigahertz
if %band% equ 2 set band=FiveGigahertz
if %band% equ 3 set band=Auto
if %input% equ 2 powershell.exe -executionpolicy remotesigned -File "%cd%\settings.ps1" -name %name% -pass %pass% -band %band%

pause
goto menu

:showdevice
cls
powershell.exe -executionpolicy remotesigned -File "%cd%\status.ps1">nul
for /f %%I in ('type status.txt') do (set status=%%I)
IF "%status%" EQU "Off" (echo "�ȵ��Ѿ��رգ��޷��鿴��" && pause && goto menu)
powershell.exe -executionpolicy remotesigned -File "%cd%\ClientCount.ps1">nul
powershell.exe -executionpolicy remotesigned -File "%cd%\MaxClientCount.ps1">nul
for /f %%I in ('type ClientCount.txt') do (set Client=%%I)
for /f %%I in ('type MaxClientCount.txt') do (set MaxClient=%%I)
echo =====================
echo ��ǰ�����ӵ��豸����%Client%
echo ���֧�������豸����%MaxClient%
powershell.exe -executionpolicy remotesigned -File "%cd%\device.ps1"
echo =====================
pause
goto menu
