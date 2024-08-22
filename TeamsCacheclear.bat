@echo off
:::start
::echo Status der Serververbindung wird abgerufen
::(nslookup worldaz.tr.teams.microsoft.com & ping worldaz.tr.teams.microsoft.com) | clip
::@REM tracert worldaz.tr.teams.microsoft.com
::echo Das Ergebnis wurde in die Zwischenablage kopiert. Bitte stellen Sie dies dem IT Support zur Verfuegung.
::timeout 3

:Prozess
echo Pruefe, ob Teams ausgefuehrt wird
timeout 3
tasklist | find /i "Teams.exe"
if %errorlevel%==0 (
    taskkill /f /im "Teams.exe"
)
timeout 3

:remove
echo Cache wird geloescht
del /F/Q/S "%APPDATA%\Microsoft\Teams\*"
IF ERRORLEVEL 1 GOTO ERROR


:restart
echo Teams wird neu gestartet!
timeout 5
start C:\Users\%username%\AppData\Local\Microsoft\Teams\current\Teams.exe
IF ERRORLEVEL 1 GOTO ERROR

:end

:ERROR
echo An error has occurred. Please check the script and try again.
