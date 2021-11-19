@echo off

cd %~dp0

::print time to _ipconfig.txt
echo %time:~0,2%%time:~2,3% >> _ipconfig.txt

:: runs ipconfig and outputs to _ipconfig.txt
ipconfig /all >> _ipconfig.txt