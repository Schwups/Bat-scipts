@echo off
set /p Drive=Please enter USB Letter:
For /f "tokens=1-4 delims=/ " %%a in ('date /t') do (set date=%%c-%%a-%%b)
7z a USB-Backup-%date%.7z %Drive%
pause
