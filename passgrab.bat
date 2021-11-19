@echo off
cd %~dp0

::print time to passgrab_output.txt
echo %time:~0,2%%time:~2,3%  >> passgrab_output.txt

:: runs NETSH and outputs the result to passgrab_output.txt and then runs NETSH again and outputs to console
echo ##################################################
echo.
NETSH WLAN SHOW PROFILE >> passgrab_output.txt
NETSH WLAN SHOW PROFILE

:: Takes user input for which network to scan (inputing nothing skips this) and then outputs the result to passgrab_output.txt
::  and then asks for user input for wether to repeat and scan another network [y] sends the loop back to the start flag and
::   [n] or anything other than [y] sends the loop to the end flag
:start
set choice=
echo.
set /p Network_Name=Please input Network to scan (or type [none] to cancel)
if '%Network_Name%'=='' goto end
NETSH WLAN SHOW PROFILE %Network_Name% KEY=CLEAR >> passgrab_output.txt
set Network_Name=
set /p choice=Do you want to scan another network [y/n]?
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='y' goto start
:end

::decorative padding and notice to tell the user the program has finished
echo.
echo ##################################################
echo.
echo passgrab complete
echo.
echo ##################################################
pause