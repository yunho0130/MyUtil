@echo off

echo /* Developer Yunho Maeng */ 
echo /* Ver 1.5 for Windows 7 (32/64bit) */
echo /* Release Date: 2014-09-17 */
echo /* 유선랜 와이파이 핫스팟(AP) 변환기 */
echo /* Wired LAN Wifi Hotspot Enabler */
echo ============================================
setlocal


::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:LOOP
echo 원하는 기능 번호를 선택해주세요. 
echo [0.AP실행 / 1.AP설정 / 2.AP정지 / 3.AP삭제 / 4.종료]
echo Select an option number
set /p YN=[0. Run AP / 1. Set AP / 2. Pause AP / 3. Delete AP / 4. EXIT] :

if /i "%YN%" == "0" goto YES
if /i "%YN%" == "1" goto OPT
if /i "%YN%" == "2" goto SEC
if /i "%YN%" == "3" goto THIRD
if /i "%YN%" == "4" goto NO
if /i "%YN%" == "" echo 잘못입력하셨습니다. You got a wrong number
goto LOOP
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


:YES
echo 0.AP실행(Run AP)
 

C:\windows\system32\netsh wlan set hostednetwork mode=allow "ssid=helloWifi" "key=yunho0130" keyUsage=persistent
C:\windows\system32\netsh wlan start hostednetwork

echo /* Wifi Name: helloWifi / PassWord: yunho0130 */
echo /* 실행이 완료되었습니다 */
pause
echo =============================
goto LOOP

:OPT
echo 1.AP설정(Set AP)

C:\windows\system32\netsh wlan stop hostednetwork

set /p WN=와이파이 이름 입력(Set Wifi Name):
set /p PW=와이파이 이름 입력(Set Wifi Password):
C:\windows\system32\netsh wlan set hostednetwork mode=allow "ssid=%WN%" "key=%PW%" keyUsage=persistent
C:\windows\system32\netsh wlan start hostednetwork

echo /* Wifi Name: %WN% / PassWord: %PW% */
echo /* 설정이 완료되었습니다 */
pause
echo =============================
goto LOOP

:SEC
echo 2.AP정지(Pause AP)
C:\windows\system32\netsh wlan stop hostednetwork
echo /* 정지가 완료되었습니다 */
echo =============================
goto LOOP

:THIRD
echo 3.AP삭제(Delete AP)
C:\windows\system32\netsh wlan set hostednetwork mode=disallow
echo =============================
goto LOOP

:NO
echo 4.종료(EXIT)
echo /* 프로그램을 종료합니다 */

pause
