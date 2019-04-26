@echo off
::==========================================================================
:: AUTHOR		: Victor Tancredi-Ballugera 
:: DATE			: 8-23-2018
:: Purpose		: reset onedrive if experiencing “Onedrive is processing changes”. Onedrive should come back after a couple minutes, otherwise run it.
::				:
:: Usage		: run manually as user
::				: 
:: Notes		: https://support.office.com/en-us/article/onedrive-is-stuck-on-processing-changes-b386b813-9b66-4e47-8c4c-2b45533edccd

cls
echo resetting OneDrive
%localappdata%\Microsoft\OneDrive\onedrive.exe /reset
echo.
echo waiting.
ping localhost -n 20
echo.
echo restarting onedrive
start "" %localappdata%\Microsoft\OneDrive\onedrive.exe
exit
