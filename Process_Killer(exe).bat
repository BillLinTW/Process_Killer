@echo off

echo ĵ�i! ���{���ݭn�t�κ޲z���v��
echo Warning! This program need administrator privileges.
echo �B�ާ@����,�i��ɭP�t���ū̩ξɭP�|���x�s���u�@��
echo And if you do something wrong with it, it may cause BS or lose your unsaved work.
echo �Y�zı�o���{�����w��,�а��W���U�����k�W�����j�e�e
echo if you think this program is not safe, please press the big X botton on the top-right of this window.
echo.
echo ���U���N��H�~��...
echo Press any botton to procced...
pause >nul


call :isAdmin
if %errorLevel% == 0 (
    goto language
) else (
	echo.
	echo ����: ��e�v������
    echo Failure: Current permissions inadequate.
	echo.
	echo �����N����������...
	echo Press any botton to close this window....
)
pause >nul
exit /b
:isAdmin
fsutil dirty query %systemdrive% >nul
exit /b

:language
for /F "tokens=3 delims= " %%G in ('reg query "hklm\system\controlset001\control\nls\language" /v Installlanguage') do (
if [%%G] EQU [0404] (
  goto main_zhtw
) else (
  goto main_en
)
)

:main_zhtw
echo �w��ϥΥ��{���I
echo ���{�� 20 ���N�۰ʲפ�ǥͺݳB�z�{��
echo 1. �פ�ǥͺݳB�z�{��
echo 2. �ۦ��J�n�פ�B�z�{��
echo 3. ���}
choice /T 20 /C 123 /D 1 /M "�п�J�ﶵ"
if errorlevel 3 goto 3_zhtw
if errorlevel 2 goto 2_zhtw
if errorlevel 1 goto 1_zhtw

:main_en
echo Thank you for using this program�I
echo This program will automaticly terminate StudentMain.exe 20 seconds later.
echo 1. Terminate StudentMain.exe.
echo 2. Enter the process name you want to terminate.
echo 3. Leave
choice /T 20 /C 123 /D 1 /M "Please choose an option"
if errorlevel 3 goto 3_en
if errorlevel 2 goto 2_en
if errorlevel 1 goto 1_en

:1_zhtw
cls
taskkill /im StudentMain.exe /f >nul 2>&1
if errorlevel 1 (
echo �B�z�{�������... �]�\�ӳB�z�{�ǭ쥻�N���s�b?
) else (
echo �B�z�{�Ǥ���\...
)
echo �����N����������...
pause >nul
exit

:2_zhtw
cls
set /p processname=��J�A�Q�n�פ�B�z�{�ǦW��(���]�t������.exe):
taskkill /im %processname%.exe /f >nul 2>&1
if errorlevel 1 (
echo �B�z�{�������... �]�\�ӳB�z�{�ǭ쥻�N���s�b?
) else (
echo �B�z�{�Ǥ���\...
)
echo �����N����������...
pause >nul
exit

:3_zhtw
echo �����N����������...
pause >nul
exit

:1_en
cls
taskkill /im StudentMain.exe /f >nul 2>&1
if errorlevel 1 (
echo Failed to terminate process... 
echo Maybe the process doesn't even exist?
) else (
echo Process terminated sucessfully...
)
echo Press any botton to close this window....
pause >nul
exit

:2_en
cls
set /p processname=The process name you want to terminate(don't enter .exe):
taskkill /im %processname%.exe /f >nul 2>&1
if errorlevel 1 (
echo Failed to terminate process... 
echo Maybe the process doesn't even exist?
) else (
echo Process terminated sucessfully...
)
echo Press any botton to close this window....
pause >nul
exit

:3_en
echo Press any botton to close this window....
pause >nul
exit