@echo off
::==========================================================================
:: AUTHOR		: Victor Tancredi-Ballugera 
:: DATE			: 6-4-2018
:: Purpose		: Batch file to set folder redirection on user login
::				:
:: Usage		: run manually AS USER, no admin rights needed, AFTER Onedrive has completed synchronizing.
::				: 
:: Notes		: 


cls
@echo Usage: run manually AS USER, no admin rights needed, AFTER Onedrive has completed synchronizing. log is at %USERPROFILE%\OneDrive - Post Holdingsfolders.txt
start odopen://sync?useremail=%username%@premiernutrition.com
echo.
set /p hirestatus=New Hire(Y/N)?
if /i "%hirestatus%" EQU "Y" (
:: create folders
md "%USERPROFILE%\OneDrive - Post Holdings\Desktop" 
md "%USERPROFILE%\OneDrive - Post Holdings\Documents"
md "%USERPROFILE%\OneDrive - Post Holdings\Pictures"
)

:: set registry settings
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v Desktop /t REG_EXPAND_SZ /d "%USERPROFILE%\OneDrive - Post Holdings\Desktop" /f 
::>>%USERPROFILE%\OneDrive - Post Holdingsfolders.txt 2>&1

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v Personal /t REG_EXPAND_SZ /d "%USERPROFILE%\OneDrive - Post Holdings\Documents" /f 
::>>%USERPROFILE%\OneDrive - Post Holdingsfolders.txt 2>&1

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "My Pictures" /t REG_EXPAND_SZ /d "%USERPROFILE%\OneDrive - Post Holdings\Pictures" /f 
::>>%USERPROFILE%\OneDrive - Post Holdingsfolders.txt 2>&1

::cls
color c
echo.
echo.
echo close this command window manually if necessary.
pause
taskkill /IM explorer.exe /F >NUL 2>&1 & explorer.exe & exit


