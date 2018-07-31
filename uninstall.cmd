@echo off
set _END_CMD="%~f0"
if not defined _PARSING "%~dp0parse_config.cmd"
if errorlevel 1 goto :EOF

echo Stopping the service...
%_SVCCTL% stop "%CFG_SERVICE_NAME%"
echo Waiting 5 sec...
ping localhost -n 5 > nul
echo Removing the service...
%_SVCCTL% remove "%CFG_SERVICE_NAME%" confirm

