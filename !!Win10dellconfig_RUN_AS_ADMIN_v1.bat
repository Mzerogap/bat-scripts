@echo OFF
setlocal
::==========================================================================
:: AUTHOR		: Victor Tancredi-Ballugera 
:: DATE			: 1-01-2018
:: Purpose		: Batch file to install apps for new machine
::			:
:: Usage		: run manually as admin
::			: 
:: Notes		: 1-29-2019 - Changed refrences for sfo-fs to sfohyp with full UNC path - Speers
::			: 
@echo.
echo set date to auto time zone
echo .
::pause
echo change to Win10 Enterprise MAK
::slmgr /ipk BBD6N-GKCDB-6V388-K4R8J-78RCF
cscript %windir%\system32\slmgr.vbs /ipk BBD6N-GKCDB-6V388-K4R8J-78RCF
::pause
echo activate
cscript %windir%\system32\slmgr.vbs /ato
@echo.
::dell support assistant
::start "" "C:\Program Files\Dell\SupportAssist\uninstaller.exe /arp"
::pause
echo dell or lenovo driver update
::article on how to find the app ID and other stuff https://www.tenforums.com/software-apps/57000-method-open-any-windows-10-apps-command-line.html. appsfolder is located here: https://www.thewindowsclub.com/windows-8-metro-apps-folder-location

set /p manufacturer=Dell machine (Y/N)?
if /i "%manufacturer%" EQU "Y" (
echo.
echo Suspending Bitlocker on local drives for Dell Command update.
powershell -executionpolicy remotesigned Suspend-Bitlocker -MountPoint "C:"
powershell -executionpolicy remotesigned Suspend-Bitlocker -MountPoint "D:"
if exist "C:\Program Files (x86)\Dell\CommandUpdate\DellCommandUpdate.exe" (start "" "C:\Program Files (x86)\Dell\CommandUpdate\DellCommandUpdate.exe") else (start "" "\\sfo-fs-01.jointjuice.local\public\software\dell\Systems-Management_Application_X79N4_WN32_2.3.1_A00_01.EXE" /s /f) & pause & (start "" "C:\Program Files (x86)\Dell\CommandUpdate\DellCommandUpdate.exe")
)
::invoke lenovo driver updater
explorer.exe shell:appsFolder\E046963F.LenovoCompanion_k1h2ywk1493x8!App
::pause
echo logitech unifying software
start "" \\sfo-fs-01.jointjuice.local\public\software\logitech\unifying250.exe /S
::pause
echo install chrome
start "" "\\sfo-fs-01.jointjuice.local\public\software\chrome\ChromeSetup.exe"
::pause
echo cisco VPN
start "" /wait /b "\\sfo-fs-01.jointjuice.local\public\software\Cisco\anyconnect-win-4.4.03034-core-vpn-predeploy-k9.msi" /qb
pause
echo Box Edit
start "" /wait /b "\\sfohyp01.jointjuice.local\itsoftware\box\Box Edit\BoxToolsInstaller-AdminInstall.msi" /qb
pause
echo box drive install
ping localhost -n 20
start "" /wait /b "\\sfohyp01.jointjuice.local\itsoftware\box\Box_drive\Box-x64.msi" /qb
pause
::echo box sync
::ping localhost -n 20
::start "" /wait /b "\\sfohyp01.jointjuice.local\itsoftware\box\Box Sync\BoxSyncSetupLTS.msi" /qb 
::pause
echo edi notepad. make sure to install express not professional version
start "" /wait /b \\sfo-fs-01.jointjuice.local\public\software\EDI\EDINotepad8_Setup.exe
pause
::echo solarwinds
::start "" /wait /b \\sfo-fs-01.jointjuice.local\public\software\GFI\AGENT_PREMIER_NUTRITION_EMERYVILLE_SEP_V10_5_12_RW\AGENT_390616_V10_5_12_RW.EXE
::pause
echo netsuite odbc drivers do not press 'skip' about 4 steps in, hit next instead of that to copy the proper settings.
start "" /wait /b \\sfo-fs-01.jointjuice.local\public\software\ODBC\NetSuiteODBCDrivers_Windows\NetSuiteODBCDrivers_Windows32bit.exe
::start "" /wait /b "\\sfo-fs-01.jointjuice.local\public\software\intel\SSD drive optimizer\Intel SSD Toolbox - v3.4.0.exe" /S
::pause
::start "" /wait /b \\sfo-fs-01.jointjuice.local\public\software\7Zip\7z1604-x64.msi /qb
pause
echo LAPS client
start "" /wait /b \\sfohyp01.jointjuice.local\itsoftware\LAPS\LAPS.x64.msi /qb
pause
echo tableau reader
::start "" /wait /b \\sfo-fs-01.jointjuice.local\public\software\Tableau\TableauReader-64bit.exe /q:a /c:"setup /qr"
start "" /wait /b \\sfo-fs-01.jointjuice.local\public\software\Tableau\TableauReader-64bit.exe /passive /norestart ACCEPTEULA=1 
pause
cls
echo uninstall Microsoft Office Desktop Apps if present
pause
echo office 2016
::start "" /wait /b \\sfohyp01.jointjuice.local\itsoftware\Non_MS_DHCP_Hotfix\InstallHotfix.bat
::start "" \\sfohyp01.jointjuice.local\itsoftware\Office2016\Office_migration.bat
\\sfohyp01.jointjuice.local\itsoftware\Office2016\O365\setup.exe /configure \\sfohyp01.jointjuice.local\itsoftware\Office2016\O365\configuration.xml
::pause
::start "" /wait /b "\\sfohyp01.jointjuice.local\itsoftware\box\Box for Office\Visual Studio 2010 Tools for Office Runtime.exe"
::pause
::start "" /wait /b "\\sfohyp01.jointjuice.local\itsoftware\box\Box for Office\BoxForOffice.msi" /qb 
::pause
echo webex desktop app
start "" /wait /b "\\sfo-fs-01.jointjuice.local\public\software\webex\webexmc - WebEx Meeting Center Desktop App.msi" /qb
pause
echo bigfix client
start "" /wait \\sfohyp01.jointjuice.local\itsoftware\BigFix\BigFixAgent.msi /qb
pause
echo webex productivity tools
ping localhost -n 10
start "" /wait /b "\\sfo-fs-01.jointjuice.local\public\software\webex\WebEx Productivity Tools - ptools.msi" /qb
pause
echo spark
start "" /wait /b "\\sfo-fs-01.jointjuice.local\public\software\Cisco\CiscoSpark_x86.msi" /qb
pause
echo solarwinds
start "" /b "\\sfohyp01.jointjuice.local\public\software\SLW\AGENT_PREMIER_NUTRITION_TEAM_VIEWER_CLIENTS_V10_7_10_RW\AGENT_568636_V10_7_10_RW.EXE"
pause
echo symantec
start "" /b "\\sfohyp01.jointjuice.local\itsoftware\PNCSEPInstall\symantec_install.bat"
pause
echo clean up old install files
echo disk cleanup will spawn 2 instances.
pause
::start /w cleanmgr /sageset:1
::start cleanmgr /sagerun:1
echo Config cleanmgr flag 100. this sets and runs the hidden features of the Disk Cleanup wizard.
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Active Setup Temp Folders" /v StateFlags0100 /d 2 /t REG_DWORD /f
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\BranchCache" /v StateFlags0100 /d 2 /t REG_DWORD /f
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Downloaded Program Files" /v StateFlags0100 /d 2 /t REG_DWORD /f
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\D3D Shader Cache" /v StateFlags0100 /d 2 /t REG_DWORD /f
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\GameNewsFiles" /v StateFlags0100 /d 2 /t REG_DWORD /f
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\GameStatisticsFiles" /v StateFlags0100 /d 2 /t REG_DWORD /f
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\GameUpdateFiles" /v StateFlags0100 /d 2 /t REG_DWORD /f
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Internet Cache Files" /v StateFlags0100 /d 2 /t REG_DWORD /f
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Memory Dump Files" /v StateFlags0100 /d 2 /t REG_DWORD /f
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Offline Pages Files" /v StateFlags0100 /d 2 /t REG_DWORD /f
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Old ChkDsk Files" /v StateFlags0100 /d 2 /t REG_DWORD /f
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Previous Installations" /v StateFlags0100 /d 2 /t REG_DWORD /f
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Recycle Bin" /v StateFlags0100 /d 2 /t REG_DWORD /f
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\RetailDemo Offline Content" /v StateFlags0100 /d 2 /t REG_DWORD /f
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Service Pack Cleanup" /v StateFlags0100 /d 2 /t REG_DWORD /f
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Setup Log Files" /v StateFlags0100 /d 2 /t REG_DWORD /f
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\System error memory dump files" /v StateFlags0100 /d 2 /t REG_DWORD /f
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\System error minidump files" /v StateFlags0100 /d 2 /t REG_DWORD /f
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Temporary Files" /v StateFlags0100 /d 2 /t REG_DWORD /f
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Temporary Setup Files" /v StateFlags0100 /d 2 /t REG_DWORD /f
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Temporary Sync Files" /V StateFlags0100 /d 2 /t REG_DWORD /f
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Thumbnail Cache" /v StateFlags0100 /d 2 /t REG_DWORD /f
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Update Cleanup" /v StateFlags0100 /d 2 /t REG_DWORD /f
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Upgrade Discarded Files" /v StateFlags0100 /d 2 /t REG_DWORD /f
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\User file versions" /v StateFlags0100 /d 2 /t REG_DWORD /f
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Windows Defender" /v StateFlags0100 /d 2 /t REG_DWORD /f
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Windows Error Reporting Archive Files" /v StateFlags0100 /d 2 /t REG_DWORD /f
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Windows Error Reporting Files" /v StateFlags0100 /d 2 /t REG_DWORD /f
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Windows Error Reporting Queue Files" /v StateFlags0100 /d 2 /t REG_DWORD /f
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Windows Error Reporting System Archive Files" /v StateFlags0100 /d 2 /t REG_DWORD /f
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Windows Error Reporting System Queue Files" /v StateFlags0100 /d 2 /t REG_DWORD /f
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Windows ESD installation files" /v StateFlags0100 /d 2 /t REG_DWORD /f
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Windows Upgrade Log Files" /v StateFlags0100 /d 2 /t REG_DWORD /f
 
start "" %systemroot%\System32\cleanmgr.exe /sagerun:100
cls
echo.
::echo install printers
echo later, once ready to deploy to a user and you have their credentials,
echo as the user, run
echo : "\\sfohyp01.jointjuice.local\public\software\!new_machine_deploy\!!Onedrive_Box_drive_Mig_RUN_AS_USER.bat"
echo :chrome - default browser
echo :outlook - default email handler -outlook
echo :chrome - homepage okta, add to favorite
pause
start \\sfohyp01
echo y|chkdsk /f
exit
