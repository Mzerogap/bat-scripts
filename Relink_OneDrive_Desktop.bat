::reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v Desktop /t REG_EXPAND_SZ /d "%USERPROFILE%\OneDrive - Post Holdings\Desktop" /f
taskkill /f /im explorer.exe
start explorer.exe