@echo off
set name=%~1
set num=-1
:loop1
set /a num+=1
call set "name2=%%name:~%num%,1%%"
if defined name2 goto :loop1
set %~2=%num%

