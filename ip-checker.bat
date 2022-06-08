@echo off
setlocal enabledelayedexpansion

set OUTPUT_FILE=ip_checker.txt
>nul copy nul %OUTPUT_FILE%
for /f %%i in (ip.txt) do (
    set SERVER_ADDRESS=ADDRESS N/A
    for /f "tokens=1,2,3" %%x in ('ping -n 1 %%i ^&^& echo SERVER_IS_UP') do (
        if %%x==Pinging set SERVER_ADDRESS=%%y
        if %%x==Reply set SERVER_ADDRESS=%%z
        if %%x==SERVER_IS_UP (set SERVER_STATE=Valide) else (set SERVER_STATE=Faux)
    )
    echo %%i [!SERVER_ADDRESS::=!] est !SERVER_STATE! >>%OUTPUT_FILE%
)

start trieur.bat



