@echo off

echo /* Developer Yunho Maeng */ 
echo /* Ver 1.5 for Windows 7 (32/64bit) */
echo /* Release Date: 2014-09-17 */
echo /* ������ �������� �ֽ���(AP) ��ȯ�� */
echo /* Wired LAN Wifi Hotspot Enabler */
echo ============================================
setlocal


::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:LOOP
echo ���ϴ� ��� ��ȣ�� �������ּ���. 
echo [0.AP���� / 1.AP���� / 2.AP���� / 3.AP���� / 4.����]
echo Select an option number
set /p YN=[0. Run AP / 1. Set AP / 2. Pause AP / 3. Delete AP / 4. EXIT] :

if /i "%YN%" == "0" goto YES
if /i "%YN%" == "1" goto OPT
if /i "%YN%" == "2" goto SEC
if /i "%YN%" == "3" goto THIRD
if /i "%YN%" == "4" goto NO
if /i "%YN%" == "" echo �߸��Է��ϼ̽��ϴ�. You got a wrong number
goto LOOP
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


:YES
echo 0.AP����(Run AP)
 

C:\windows\system32\netsh wlan set hostednetwork mode=allow "ssid=helloWifi" "key=yunho0130" keyUsage=persistent
C:\windows\system32\netsh wlan start hostednetwork

echo /* Wifi Name: helloWifi / PassWord: yunho0130 */
echo /* ������ �Ϸ�Ǿ����ϴ� */
pause
echo =============================
goto LOOP

:OPT
echo 1.AP����(Set AP)

C:\windows\system32\netsh wlan stop hostednetwork

set /p WN=�������� �̸� �Է�(Set Wifi Name):
set /p PW=�������� �̸� �Է�(Set Wifi Password):
C:\windows\system32\netsh wlan set hostednetwork mode=allow "ssid=%WN%" "key=%PW%" keyUsage=persistent
C:\windows\system32\netsh wlan start hostednetwork

echo /* Wifi Name: %WN% / PassWord: %PW% */
echo /* ������ �Ϸ�Ǿ����ϴ� */
pause
echo =============================
goto LOOP

:SEC
echo 2.AP����(Pause AP)
C:\windows\system32\netsh wlan stop hostednetwork
echo /* ������ �Ϸ�Ǿ����ϴ� */
echo =============================
goto LOOP

:THIRD
echo 3.AP����(Delete AP)
C:\windows\system32\netsh wlan set hostednetwork mode=disallow
echo =============================
goto LOOP

:NO
echo 4.����(EXIT)
echo /* ���α׷��� �����մϴ� */

pause
