@ECHO OFF
REM BFCPEOPTIONSTART
REM Advanced BAT to EXE Converter www.BatToExeConverter.com
REM BFCPEEXE=
REM BFCPEICON=
REM BFCPEICONINDEX=-1
REM BFCPEEMBEDDISPLAY=0
REM BFCPEEMBEDDELETE=1
REM BFCPEADMINEXE=0
REM BFCPEINVISEXE=0
REM BFCPEVERINCLUDE=0
REM BFCPEVERVERSION=1.0.0.0
REM BFCPEVERPRODUCT=Product Name
REM BFCPEVERDESC=Product Description
REM BFCPEVERCOMPANY=Your Company
REM BFCPEVERCOPYRIGHT=Copyright Info
REM BFCPEWINDOWCENTER=1
REM BFCPEDISABLEQE=0
REM BFCPEWINDOWHEIGHT=30
REM BFCPEWINDOWWIDTH=120
REM BFCPEWTITLE=Window Title
REM BFCPEOPTIONEND
@echo off
title Advanced System Information
color 0A

:: Get system information
set "OS=%OS%"
set "HOSTNAME=%COMPUTERNAME%"
set "USER=%USERNAME%"
for /f "tokens=2 delims==" %%i in ('wmic cpu get name /format:list ^| find "="') do set "CPU=%%i"
for /f "tokens=2 delims==" %%i in ('wmic path win32_videocontroller get name /format:list ^| find "="') do set "GPU=%%i"
for /f "tokens=2 delims==" %%i in ('wmic memorychip get capacity /format:list ^| find "="') do set /a "RAM+=%%i"
set /a "RAM=RAM/1024/1024"  :: Convert bytes to MB
for /f "tokens=3" %%i in ('wmic logicaldisk get size,freespace,caption ^| findstr /C:"C:"') do set "DISK_SIZE=%%i"
for /f "tokens=3" %%i in ('wmic logicaldisk get freespace,caption ^| findstr /C:"C:"') do set "DISK_FREE=%%i"
set /a "DISK_USED=DISK_SIZE-DISK_FREE"
set /a "DISK_USED_MB=DISK_USED/1024/1024"
set /a "DISK_SIZE_MB=DISK_SIZE/1024/1024"
set /a "DISK_FREE_MB=DISK_FREE/1024/1024"

:: Get current date and time
for /f "tokens=1-2 delims= " %%a in ('echo %date% %time%') do (
    set "CURRENT_DATE=%%a"
    set "CURRENT_TIME=%%b"
)

:: Display the information
echo.
echo  ███████╗███╗   ██╗██████╗ ███████╗██████╗ ██╗  ██╗
echo  ██╔════╝████╗  ██║██╔══██╗██╔════╝██╔══██╗██║  ██║
echo  █████╗  ██╔██╗ ██║██████╔╝█████╗  ██████╔╝███████║
echo  ██╔══╝  ██║╚██╗██║██╔═══╝ ██╔══╝  ██╔══██╗██╔══██║
echo  ███████╗██║ ╚████║██║     ███████╗██║  ██║██║  ██║
echo  ╚══════╝╚═╝  ╚═══╝╚═╝     ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝
echo.
echo  ███╗   ██╗██╗   ██╗██╗     ██╗███╗   ██╗██╗  ██╗
echo  ████╗  ██║██║   ██║██║     ██║████╗  ██║██║  ██║
echo  ██╔██╗ ██║██║   ██║██║     ██║██╔██╗ ██║██║  ██║
echo  ██║╚██╗██║██║   ██║██║     ██║██║╚██╗██║██║  ██║
echo  ██║ ╚████║╚██████╔╝███████╗██║██║ ╚████║███████║
echo  ╚═╝  ╚═══╝ ╚═════╝ ╚══════╝╚═╝╚═╝  ╚═══╝╚══════╝
echo.
echo  OS: %OS%
echo  Hostname: %HOSTNAME%
echo  User: %USER%
echo  CPU: %CPU%
echo  GPU: %GPU%
echo  RAM: %RAM% MB
echo  Disk Usage: %DISK_USED_MB% MB / %DISK_SIZE_MB% MB (%DISK_FREE_MB% MB free)
echo  Current Date: %CURRENT_DATE%
echo  Current Time: %CURRENT_TIME%
echo.

pause
