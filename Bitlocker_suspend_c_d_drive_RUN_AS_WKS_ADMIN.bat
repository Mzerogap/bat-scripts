@echo off
::==========================================================================
:: AUTHOR		: Victor Tancredi-Ballugera 
:: DATE			: 2-15-2019
:: Purpose		: Batch file to temporarily disable bitlocker
::				:
:: Usage		: run manually as workstation admin
::				: 
:: Notes		: 

pushd %~dp0
powershell -executionpolicy remotesigned -file Bitlocker_suspend_c_d_drive.ps1
popd
