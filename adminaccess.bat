@echo ON
set uaccheck=0
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
    goto UACAccess
) else (goto Done)
: UACAccess
pause
echo Set UAC = CreateObject ^ ("Shell.Application"^) > "%temp%\uac_get_admin.vbs"
set params = %*:"="
echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\uac_get_admin.vbs"
"%temp%\uac_get_admin.vbs"
del "%temp%\uac_get_admin.vbs"
exit /b
:Done
cd "%~dp0"
for /f "tokens=* usebackq" %%a in (`^WHERE /R C:\\"Program Files" R.exe`) do set b=%%a
"%b%" --slave --vanilla --file=data.R --args C:/Users/padam/Desktop/123.csv C:/Users/padam/Desktop
explorer.exe "C:\Users\padam\Desktop\pdf.pdf"
pause
exit
