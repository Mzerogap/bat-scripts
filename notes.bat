::reg export "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" test.txt && type test.txt | findstr /i "Desktop" > list.txt | notepad list.txt
::set OLDDIR=%CD%
::echo %OLDDIR%
::echo %USERPROFILE%\Desktop\Send_to_IT.reg
::reg export "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" %USERPROFILE%\Desktop\Send_to_IT.reg | notepad


&    separates commands on a line.

&&    executes this command only if previous command's errorlevel is 0.

||    (not used above) executes this command only if previous command's errorlevel is NOT 0

>    output to a file

>>    append output to a file

<    input from a file

|    output of one command into the input of another command

^    escapes any of the above, including itself, if needed to be passed to a program

"    parameters with spaces must be enclosed in quotes

+ used with copy to concatenate files. E.G. copy file1+file2 newfile

, used with copy to indicate missing parameters. This updates the files modified date. E.G. copy /b file1,,

%variablename% a inbuilt or user set environmental variable

!variablename! a user set environmental variable expanded at execution time, turned with SetLocal EnableDelayedExpansion command

%<number> (%1) the nth command line parameter passed to a batch file. %0 is the batchfile's name.

%* (%*) the entire command line.

%<a letter> or %%<a letter> (%A or %%A) the variable in a for loop. Single % sign at command prompt and double % sign in a batch file.