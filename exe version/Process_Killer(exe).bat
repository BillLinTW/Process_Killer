@echo off

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
