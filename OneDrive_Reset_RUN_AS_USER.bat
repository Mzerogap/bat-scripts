#start odopen://sync?useremail=%username%@premiernutrition.com

reg add "HKCU\Software\Policies\Microsoft\OneDrive\TenantAutoMount" /v LibraryName /t REG_SZ /d "tenantId=67fa1239%2D84f7%2D4124%2Db0aa%2D72e3b5dda92c&siteId=%7B435eb7cb%2Db673%2D4914%2D9eee%2D979fc5d01515%7D&webId=%7B8636514f%2Def6d%2D47fc%2D8155%2Dba11a31cbda6%7D&listId=%7BE9319D64%2D26DA%2D4173%2DB250%2DE65908C87875%7D&folderId=fa73a209%2Da249%2D4bbc%2D946b%2D6154eaa69dac&webUrl=https%3A%2F%2Fpostholdings%2Esharepoint%2Ecom%2Fsites%2FPNC%2DIT%2DTEAM&version=1" /f

pause
::reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\{4A8FCD9F-623C-4283-96F0-10F41846A98A} /f 2>NUL
::{018D5C66-4533-4307-9B53-224DE2ED1FE6}
:: create new one!!!