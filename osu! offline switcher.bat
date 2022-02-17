@echo off
color E
:start
@echo off
cls
title osu! forced offline mode switcher
color 3
cls
echo.
echo.osu! forced offline mode switcher
echo.
echo Status:
echo.
echo 1. Allow osu! Connection to Official Server
echo.
echo 2. Don't allow osu! Connection to Official Server (Forced Offline Mode)
echo.
echo.
echo Type "exit" or "quit" to exit
echo.
SET /P ANSWER=Enter Answer: 
if /i {%ANSWER%}=={1} (goto :Enable)
if /i {%ANSWER%}=={2} (goto :Disable)
if /i {%ANSWER%}=={quit} (goto :exit)
if /i {%ANSWER%}=={exit} (goto :exit)
goto invalid
:invalid
echo Invalid choice. Wait for 2 seconds to go back.
ping -n 3 127.0.0.1 > nul
goto start

:Disable
netsh advfirewall firewall set rule name="osuoffline" new enable=yes >nul
set status=osu! is now on Offline Mode
goto :Firewall
exit

:Enable
netsh advfirewall firewall set rule name="osuoffline" new enable=no >nul
set status=osu! is now on Online Mode
goto :Firewall
exit

:Firewall
cls
echo.
echo.osu! forced offline mode switcher
echo.
echo Status: %status%
echo.
echo 1. Allow osu! Connection to Official Server
echo.
echo 2. Don't allow osu! Connection to Official Server (Forced Offline Mode)
echo.
echo.
echo Type "exit" or "quit" to exit
echo.
SET /P ANSWER=Enter Answer: 
if /i {%ANSWER%}=={1} (goto :Enable)
if /i {%ANSWER%}=={2} (goto :Disable)
if /i {%ANSWER%}=={quit} (goto :exit)
if /i {%ANSWER%}=={exit} (goto :exit)
goto invalid
:invalid
echo Invalid choice. Wait for 2 seconds or press any key
ping -n 3 127.0.0.1 > nul
goto :Firewall

:exit
exit /b
