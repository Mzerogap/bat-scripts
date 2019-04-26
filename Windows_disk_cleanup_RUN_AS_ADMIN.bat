@echo off
::==========================================================================
:: AUTHOR		: Victor Tancredi-Ballugera 
:: DATE			: 5-9-2018
:: Purpose		: Batch file to run disk cleanup with hidden options including removing old windows backup
::				:
:: Usage		: run manually as admin
::				: 
:: Notes		: 11/28/2018 vtb added clearing temp files

::not enough time to figure out why runas/psexec wont let us run elevated commands - gives 'The system cannot find the file specified.' error. otherwise would build script to run as user and query for admin credentials to run all the rest of this.

::rd %userprofile%\AppData\Local\temp /s /q
::md %userprofile%\AppData\Local\temp /s /q

echo clear windows temp folder
rd %windir%\temp /s /q
md %windir%\temp

echo set up disk check to recover any unmarked space on disk
echo y|chkdsk /f

echo.
echo.
echo.
echo clean up old install files
echo disk cleanup will spawn 2 instances.
::pause
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
