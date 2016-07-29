@echo off

setlocal enableextensions enabledelayedexpansion

if exist "%~dp0..\version.mk" goto :getversion

echo version.mk cannot be found. Generating unknown version.

set version=unknown

goto :gotversion

:getversion

for /f "delims== tokens=2" %%v in (%~dps0..\version.mk) do set version=%%v

set version=!version:^"=!
set version=!version: =!

:gotversion

set version_out=#define %~2 "%version%"
set version_mk=%~2 = "%version%"

echo %version_out%> "%~1_temp"

if %version%==unknown goto :skipgenerate

echo # static version string; update manually every release.> "%~dp0..\version.mk"
echo %version_mk%>> "%~dp0..\version.mk"

:skipgenerate

echo n | comp "%~1_temp" "%~1" > NUL 2> NUL

if not errorlevel 1 goto exit

copy /y "%~1_temp" "%~1"

:exit

del "%~1_temp"
