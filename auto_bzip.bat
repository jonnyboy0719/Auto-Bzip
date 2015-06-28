@echo off
setlocal


:# Select the folder
SET FOLDER=A:\Projects\gmod\z_survival\fastdl\content


call :Echo.Color.Init

goto main

:Echo.Color %1=Color %2=Str [%3=/n]
setlocal enableDelayedExpansion
set "str=%~2"
:Echo.Color.2
:# Replace path separators in the string, so that the final path still refers to the current path.
set "str=a%ECHO.DEL%!str:\=a%ECHO.DEL%\..\%ECHO.DEL%%ECHO.DEL%%ECHO.DEL%!"
set "str=!str:/=a%ECHO.DEL%/..\%ECHO.DEL%%ECHO.DEL%%ECHO.DEL%!"
set "str=!str:"=\"!"
:# Go to the script directory and search for the trailing -
pushd "%ECHO.DIR%"
findstr /p /r /a:%~1 "^^-" "!str!\..\!ECHO.FILE!" nul
popd
:# Remove the name of this script from the output. (Dependant on its length.)
for /l %%n in (1,1,12) do if not "!ECHO.FILE:~%%n!"=="" <nul set /p "=%ECHO.DEL%"
:# Remove the other unwanted characters "\..\: -"
<nul set /p "=%ECHO.DEL%%ECHO.DEL%%ECHO.DEL%%ECHO.DEL%%ECHO.DEL%%ECHO.DEL%%ECHO.DEL%"
:# Append the optional CRLF
if not "%~3"=="" echo.
endlocal & goto :eof

:Echo.Color.Var %1=Color %2=StrVar [%3=/n]
if not defined %~2 goto :eof
setlocal enableDelayedExpansion
set "str=!%~2!"
goto :Echo.Color.2

:Echo.Color.Init
set "ECHO.COLOR=call :Echo.Color"
set "ECHO.DIR=%~dp0"
set "ECHO.FILE=%~nx0"
set "ECHO.FULL=%ECHO.DIR%%ECHO.FILE%"
:# Use prompt to store a backspace into a variable. (Actually backspace+space+backspace)
for /F "tokens=1 delims=#" %%a in ('"prompt #$H# & echo on & for %%b in (1) do rem"') do set "ECHO.DEL=%%a"
goto :eof

:main

:# Materials
color 04
for /R "%FOLDER%\materials" %%G in (*.*) do (
	bzip2 -z "%%G" -q
	if "%%~xG" == ".bz2" (
		call :Echo.Color 0B "Skipped "
	)
	call :Echo.Color 0f "Compressed "
	call :Echo.Color 06 "Material "
	call :Echo.Color 0f "File: "
	call :Echo.Color 0a "%%~nxG" \n
)
ECHO.
call :Echo.Color 0E "Materials 2 bzip is done!" \n
ECHO.
TIMEOUT 5

:# Models
for /R "%FOLDER%\models" %%G in (*.*) do (
	bzip2 -z "%%G" -q
	if "%%~xG" == ".bz2" (
		call :Echo.Color 0B "Skipped "
	)
	call :Echo.Color 0f "Compressed "
	call :Echo.Color 06 "Model "
	call :Echo.Color 0f "File: "
	call :Echo.Color 0a "%%~nxG" \n
)
ECHO.
call :Echo.Color 0E "Models 2 bzip is done!" \n
ECHO.
TIMEOUT 5

:# Sounds
for /R "%FOLDER%\sound" %%G in (*.*) do (
	bzip2 -z "%%G" -q
	if "%%~xG" == ".bz2" (
		call :Echo.Color 0B "Skipped "
	)
	call :Echo.Color 0f "Compressed "
	call :Echo.Color 06 "Sound "
	call :Echo.Color 0f "File: "
	call :Echo.Color 0a "%%~nxG" \n
)
ECHO.
call :Echo.Color 0E "Sounds 2 bzip is done!" \n
ECHO.
TIMEOUT 5

:# Resources
for /R "%FOLDER%\resources" %%G in (*.*) do (
	bzip2 -z "%%G" -q
	if "%%~xG" == ".bz2" (
		call :Echo.Color 0B "Skipped "
	)
	call :Echo.Color 0f "Compressed "
	call :Echo.Color 06 "Resource "
	call :Echo.Color 0f "File: "
	call :Echo.Color 0a "%%~nxG" \n
)
ECHO.
call :Echo.Color 0E "Resources 2 bzip is done!" \n
ECHO.
TIMEOUT 5

:# Maps
for /R "%FOLDER%\maps" %%G in (*.*) do (
	bzip2 -z "%%G" -q
	if "%%~xG" == ".bz2" (
		call :Echo.Color 0B "Skipped "
	)
	call :Echo.Color 0f "Compressed "
	call :Echo.Color 06 "Map "
	call :Echo.Color 0f "File: "
	call :Echo.Color 0a "%%~nxG" \n
)
ECHO.
call :Echo.Color 0E "Maps 2 bzip is done!" \n
ECHO.
TIMEOUT 5

ECHO.
call :Echo.Color 0E "Auto Bzip is now complete!" \n
ECHO.
pause

exit /b

:# The following line must be last and not end by a CRLF.
-