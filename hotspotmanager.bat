:menu
@echo off
cls
for /f "tokens=4*" %%A in ('ver') do set ver=%%A
IF "%ver%" LSS "10.0.14393*]" (echo 需要Win10 1607及以上操作系统才能使用此脚本！&& exit)
title 热点管理器 By 2096779623
echo =====================
echo 1.开启/关闭热点
echo 2.修改热点设置
echo 3.查看已连接设备
echo 4.修改设备连接数量(默认修改成最大值：32)
echo 5.关于
echo =====================
set /p input=请输入你要执行的操作：
if %input% equ 1 goto enaordishotspot
if %input% equ 2 goto changehotspotsettings
if %input% equ 3 goto showdevice
if %input% equ 4 reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\icssvc\Settings /v WifiMaxPeers /t REG_DWORD /d 32 /f
if %input% equ 5 goto about
pause
goto menu

:enaordishotspot
cls
echo =====================
echo 1.开启
echo 2.关闭
echo =====================
set /p input=请输入你要执行的操作：
if %input% equ 1 powershell.exe -executionpolicy remotesigned -File "%cd%\start.ps1"
if %input% equ 2 powershell.exe -executionpolicy remotesigned -File "%cd%\stop.ps1"
pause
goto menu

:changehotspotsettings
cls
IF "%ver%" LSS "10.0.19041*]" (echo 需要Win10 2004及以上操作系统才能使用此功能！&& pause && goto menu)
set /p name=请输入热点名称：
set /p pass=请输入热点密码：
echo 1. 2.4Ghz
echo 2. 5Ghz
echo 3.自动
set /p band=请选择热点频段：
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
IF "%status%" EQU "Off" (echo "热点已经关闭，无法查看！" && pause && goto menu)
powershell.exe -executionpolicy remotesigned -File "%cd%\ClientCount.ps1">nul
powershell.exe -executionpolicy remotesigned -File "%cd%\MaxClientCount.ps1">nul
for /f %%I in ('type ClientCount.txt') do (set Client=%%I)
for /f %%I in ('type MaxClientCount.txt') do (set MaxClient=%%I)
echo =====================
echo 当前已连接的设备数：%Client%
echo 最大支持连接设备数：%MaxClient%
powershell.exe -executionpolicy remotesigned -File "%cd%\device.ps1"
echo =====================
pause
goto menu

:about
cls
echo 源代码地址：https://github.com/2096779623/hotspotmanager
echo.
type LICENSE
pause
goto menu
