@echo off
cd %~dp0Files_to_be_documented
break > %~dp0File_documenter_output.txt
dir /b >> %~dp0File_documenter_output.txt