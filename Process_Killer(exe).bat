@echo off


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
echo �B�z�{�������...
echo �]�\�B�z�{�ǭ쥻�N���s�b? �άO�ڨS����t�κ޲z�v��?
) else (
echo �B�z�{�Ǥ���\...
)
goto 3

:2_zhtw
cls
set /p processname=��J�A�Q�n�פ�B�z�{�ǦW��(���]�t������.exe):
taskkill /im %processname%.exe /f >nul 2>&1
if errorlevel 1 (
echo �B�z�{�������...
echo �]�\�B�z�{�ǭ쥻�N���s�b? �άO�ڨS����t�κ޲z�v��?
) else (
echo �B�z�{�Ǥ���\...
)
goto 3

:3_zhtw
echo �����N����������...
pause >nul
exit

:1_en
cls
taskkill /im StudentMain.exe /f >nul 2>&1
if errorlevel 1 (
echo Failed to terminate process... 
echo Maybe the process doesn't even exist? or i didn't get admin privileges?
) else (
echo Process terminated sucessfully...
)
goto 3

:2_en
cls
set /p processname=The process name you want to terminate(don't enter .exe):
taskkill /im %processname%.exe /f >nul 2>&1
if errorlevel 1 (
echo Failed to terminate process... 
echo Maybe the process doesn't even exist? or i didn't get admin privileges?
) else (
echo Process terminated sucessfully...
)
goto 3

:3_en
echo Press any botton to close this window....
pause >nul
exit