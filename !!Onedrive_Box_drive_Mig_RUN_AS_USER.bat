@echo off
setlocal
::==========================================================================
:: AUTHOR		: Victor Tancredi-Ballugera 
:: DATE			: 5-30-2018
:: Purpose		: Batch file to remove box sync, replace with onedrive, install box drive for department shares
::				:
:: Usage		: run manually AS USER, no admin rights needed, AFTER Box has completed synchronizing.
::				: 
:: Notes		: 
::				: dont care if box sync is synced, files should stay 
cls
echo uninstall Box Sync. user files should not be removed.
::start "" /wait /b "MsiExec.exe /X{BFA57077-F78C-4B92-815E-7BCDA6B9686E}"
MsiExec.exe /X{BFA57077-F78C-4B92-815E-7BCDA6B9686E}||MsiExec.exe /X{9F3C7488-1D6C-448F-984D-BE03CC7C907A}||MsiExec.exe /X{1AF1DA55-8AD1-4A8B-AD8A-3B235F389617}
echo.
if not exist "%USERPROFILE%\AppData\Local\Microsoft\OneDrive\OneDrive.exe" (
echo.
echo installing Onedrive
echo.
start /wait "" "\\sfohyp01\itsoftware\microsoft\onedrive\OneDriveSetup.exe" 
)
echo.
echo sign in to Onedrive with with premier account
start odopen://sync?useremail=%username%@premiernutrition.com
pause
echo disable onedrive explorer integration with reg hack, delete box sync from explorer namespace
echo.
:: tried using runas, used psexec instead.
::runas /noprofile /user:jointjuice.local\%adminuser% "reg add HKCR\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6} /v System.IsPinnedToNameSpaceTree /t REG_EXPAND_SZ /d 00000000 /f"

::delete Box Sync and Onedrive personal from explorer namespace
echo trying method 1
echo.
reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\{4A8FCD9F-623C-4283-96F0-10F41846A98A} /f 2>NUL
reg add HKCR\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6} /f
reg add HKCR\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6} /v System.IsPinnedToNameSpaceTree /t REG_EXPAND_SZ /d 00000000 /f
::this section iss for getting using admin priveleges to add registry entry in case the prior attempt fails
::if %errorlevel% NEQ 0 (
::echo trying method 2
::echo.
::set /p adminuser=please enter your ADMIN username to edit the registry: 
::set /p adminpwd=please enter your ADMIN PASSWORD to edit the registry: 
::cls
::pushd \\sfohyp01\Public\software\!new_machine_deploy
::psexec -accepteula -u jointjuice.local\%adminuser% -p %adminpwd% reg add HKCR\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6} /f
::psexec -accepteula -u jointjuice.local\%adminuser% -p %adminpwd% reg add HKCR\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6} /v System.IsPinnedToNameSpaceTree /t REG_EXPAND_SZ /d 00000000 /f || pause
::popd
::)
::pause
echo.
cls
echo redirect windows profile folders to onedrive folders
echo.
:: create folders if new hire
set /p hirestatus=New Hire(Y/N)?
if /i "%hirestatus%" EQU "Y" (
md "%USERPROFILE%\OneDrive - Post Holdings\Desktop" 
md "%USERPROFILE%\OneDrive - Post Holdings\Documents"
md "%USERPROFILE%\OneDrive - Post Holdings\Pictures"
goto skiprobocopy
)
echo.
robocopy /s /z /r:1 /w:1 /MOVE /tee /LOG+:%USERPROFILE%\robolog.txt "%USERPROFILE%\Box Sync\desktop" "%USERPROFILE%\OneDrive - Post Holdings\Desktop" /xd "$RECYCLE.BIN"
robocopy /s /z /r:1 /w:1 /MOVE /tee /LOG+:%USERPROFILE%\robolog.txt "%USERPROFILE%\Box Sync\Documents" "%USERPROFILE%\OneDrive - Post Holdings\Documents" /xd "$RECYCLE.BIN"
robocopy /s /z /r:1 /w:1 /MOVE /tee /LOG+:%USERPROFILE%\robolog.txt "%USERPROFILE%\Box Sync\Pictures" "%USERPROFILE%\OneDrive - Post Holdings\Pictures" /xd "$RECYCLE.BIN"||robocopy /s /z /r:1 /w:1 /MOVE /tee /LOG+:%USERPROFILE%\robolog.txt "%USERPROFILE%\Box Sync\My Pictures" "%USERPROFILE%\OneDrive - Post Holdings\Pictures" /xd "$RECYCLE.BIN"||md "%USERPROFILE%\OneDrive - Post Holdings\Pictures"
pause
:skiprobocopy
echo.
echo setting user profile registry settings.
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v Desktop /t REG_EXPAND_SZ /d "%USERPROFILE%\OneDrive - Post Holdings\Desktop" /f
:: >>%USERPROFILE%\onedrivefolders.txt 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v Personal /t REG_EXPAND_SZ /d "%USERPROFILE%\OneDrive - Post Holdings\Documents" /f
:: >>%USERPROFILE%\onedrivefolders.txt 2>&1
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "My Pictures" /t REG_EXPAND_SZ /d "%USERPROFILE%\OneDrive - Post Holdings\Pictures" /f
:: >>%USERPROFILE%\onedrivefolders.txt 2>&1
echo.
echo install box drive
echo.
echo Box drive will restart explorer and load the registry settings.
echo.
start "" /wait /b "\\sfohyp01\itsoftware\box\Box_drive\Box-x64.msi" /qb
cls
color c
echo.
echo. please remember to manually map the Pictures folder
echo.
echo complete, close this command window manually if necessary.
echo.
::taskkill /IM explorer.exe /F >NUL 2>&1 & explorer.exe & exit
::set %hirestatus%=
::set %adminuser%=
::set %adminpwd%=
pause
exit

