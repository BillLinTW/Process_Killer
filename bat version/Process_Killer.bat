@echo off
@setlocal enableextensions enabledelayedexpansion
:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params=%*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    goto OScheck

:OScheck
	cls
	SET count=1
	FOR /F "tokens=* USEBACKQ" %%F IN (`wmic os get Caption /value`) DO (
	 SET var!count!=%%F
	 SET /a count=!count!+1
     )
	if "Caption=Microsoft Windows 10" GEQ %var3%
		echo �ثe���䴩Windows UAC�۰ʨ��o�޲z���v���I�I�I
		echo �Ф�ʨϥκ޲z�������Ұʦ��{���I�I�I
		goto 3
	)	else ( exit /b )
:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------
echo �w��ϥΥ��{���I
echo ���{�� 20 ���N�۰ʲפ�ǥͺݳB�z�{��
echo 1. �פ�ǥͺݳB�z�{��
echo 2. �ۦ��J�n�פ�B�z�{��
echo 3. ���}
choice /T 20 /C 123 /D 1 /M "�п�J�ﶵ"
if errorlevel 3 goto 3
if errorlevel 2 goto 2 
if errorlevel 1 goto 1
cls

:1
cls
taskkill /im StudentMain.exe /f >nul 2>&1
if errorlevel 1 (echo �B�z�{�������...) else (echo �B�z�{�Ǥ���\...)
goto 3

:2
cls
set /p processname=�B�z�{�ǦW��:
taskkill /im %processname% /f >nul 2>&1
if errorlevel 1 (echo �B�z�{�������...) else (echo �B�z�{�Ǥ���\...)
goto 3

:3
echo �����N����������
pause >nul
exit
