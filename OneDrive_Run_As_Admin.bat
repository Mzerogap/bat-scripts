
:: untested
::echo force known folder redirect
::reg add "HKLM\SOFTWARE\Policies\Microsoft\OneDrive" /v KFMBlockOptOut /t REG_DWORD /d "00000001" /f

:: errors when tested
::echo force company OneDrive
::reg add "HKLM\SOFTWARE\Policies\Microsoft\OneDrive\AllowTenantList" /v 2df9eafc-f3fa-4742-86d9-bb9b9a72a334 /t REG_SZ /d "bae02888-0334-4699-acbb-fc4dddc5046c" /f

::tested and works
::Silently move Windows known folders to OneDrive
reg add "HKLM\SOFTWARE\Policies\Microsoft\OneDrive" /v KFMSilentOptIn /t REG_SZ /d "bae02888-0334-4699-acbb-fc4dddc5046c" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\OneDrive" /v KFMSilentOptInWithNotification /t REG_DWORD /d "1" /f

::tested and works
::Files On Demand 
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\OneDrive" /v FilesOnDemandEnabled /t REG_DWORD /d "1" /f

::tested and works
:: disable tutorial 
::reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\OneDrive" /v DisableTutorial /t REG_DWORD /d "1" /f

::tested and works
:: disabe Personal OneDrive
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\OneDrive" /v DisablePersonalSync /t REG_DWORD /d "1" /f

::tested and works!!!
::Silently sign in users to the OneDrive
reg add "HKLM\SOFTWARE\Policies\Microsoft\OneDrive" /v SilentAccountConfig /t REG_DWORD /d "1" /f

::untested
::change default location
::[HKCU\SOFTWARE\Policies\Microsoft\OneDrive\DefaultRootDir] "1111-2222-3333-4444"="{User path}" 
:: better to use with %username%

::untested
::teamsite library 
::[HKCU\Software\Policies\Microsoft\OneDrive\TenantAutoMount]"LibraryName"="LibraryID"
::reg add "HKCU\Software\Policies\Microsoft\OneDrive\TenantAutoMount" /v LibraryName /t REG_SZ /d "tenantId=tenantId=67fa1239%2D84f7%2D4124%2Db0aa%2D72e3b5dda92c&siteId=%7B435eb7cb%2Db673%2D4914%2D9eee%2D979fc5d01515%7D&webId=%7B8636514f%2Def6d%2D47fc%2D8155%2Dba11a31cbda6%7D&listId=%7BE9319D64%2D26DA%2D4173%2DB250%2DE65908C87875%7D&folderId=66e89d66%2D4561%2D4f6b%2Db364%2D719455452ccc&webUrl=https%3A%2F%2Fpostholdings%2Esharepoint%2Ecom%2Fsites%2FPNC%2DIT%2DTEAM&version=1" /f
::reg add "HKCU\Software\Policies\Microsoft\OneDrive\TenantAutoMount" /v LibraryName /t REG_DWORD /d "tenantId=tenantId=67fa1239%2D84f7%2D4124%2Db0aa%2D72e3b5dda92c&siteId=%7B435eb7cb%2Db673%2D4914%2D9eee%2D979fc5d01515%7D&webId=%7B8636514f%2Def6d%2D47fc%2D8155%2Dba11a31cbda6%7D&listId=%7BE9319D64%2D26DA%2D4173%2DB250%2DE65908C87875%7D&folderId=66e89d66%2D4561%2D4f6b%2Db364%2D719455452ccc&webUrl=https%3A%2F%2Fpostholdings%2Esharepoint%2Ecom%2Fsites%2FPNC%2DIT%2DTEAM&version=1" /f
::reg add "HKEY_USERS\S-1-5-21-341536205-593477472-1287307213-8608\Software\Policies\Microsoft\OneDrive\TenantAutoMount" /v LibraryName /t REG_SZ /d "tenantId=67fa1239%2D84f7%2D4124%2Db0aa%2D72e3b5dda92c&siteId=%7B435eb7cb%2Db673%2D4914%2D9eee%2D979fc5d01515%7D&webId=%7B8636514f%2Def6d%2D47fc%2D8155%2Dba11a31cbda6%7D&listId=%7BE9319D64%2D26DA%2D4173%2DB250%2DE65908C87875%7D&folderId=fa73a209%2Da249%2D4bbc%2D946b%2D6154eaa69dac&webUrl=https%3A%2F%2Fpostholdings%2Esharepoint%2Ecom%2Fsites%2FPNC%2DIT%2DTEAM&version=1" /f
reg add "HKLM\Software\Policies\Microsoft\OneDrive\TenantAutoMount" /v "AN-IT-TEAM" /t REG_SZ /d "tenantId=67fa1239%2D84f7%2D4124%2Db0aa%2D72e3b5dda92c&siteId=%7B435eb7cb%2Db673%2D4914%2D9eee%2D979fc5d01515%7D&webId=%7B8636514f%2Def6d%2D47fc%2D8155%2Dba11a31cbda6%7D&listId=%7BE9319D64%2D26DA%2D4173%2DB250%2DE65908C87875%7D&webUrl=https%3A%2F%2Fpostholdings%2Esharepoint%2Ecom%2Fsites%2FPNC%2DIT%2DTEAM&version=1" /f


pause