@echo off
color E
:path
title Firewall Rule Setup
@echo off
cls
echo Please enter your osu!.exe file path here
echo (example: C:\Users\4321\AppData\Local\osu!\osu!.exe)
echo Don't forget the "\osu!.exe!"
echo.
echo If "\osu!.exe" is not included, the switcher will NOT work
echo even if it says it does.
echo.
set /p input= Enter osu!.exe path: 
if exist %input% goto start
if NOT exist %input% goto wrong

:wrong
@echo off
cls
echo Invalid Path. Wait 2 seconds to go back.
ping -n 3 127.0.0.1 > nul
goto path

::CODE BELOW:

:start
@echo off
cls
netsh advfirewall firewall add rule name="osuoffline" dir=out program="%input%" profile=any action=block enable=no
title firewall rule setup
cls
:nice
@echo off
cls
color E
cls
echo.
echo Done!
echo.
echo Please check your firewall if there is an outbound rule named "osuoffline".
echo If there isn't or it isn't working, please read the README on the GitHub page.
echo You may also contact me on discord for questions: aurora.#8612
echo.
echo You may type "quit" or "exit" to exit or simply close this window.
echo.
SET /P ANSWER=Enter Answer: 
if /i {%ANSWER%}=={quit} (goto :exit)
if /i {%ANSWER%}=={exit} (goto :exit)
goto invalid
:invalid
echo Invalid choice. Wait for 2 seconds or press any key
ping -n 3 127.0.0.1 > nul
goto nice

:exit
exit /b
