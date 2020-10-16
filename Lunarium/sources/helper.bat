@echo off
:start
echo Choose what do you want to do:
echo 1) Build
echo 2) Download assets
echo 3) Generate sources
echo 4) Generate Eclipse IDE files
echo 5) Generate IDEA files
echo 6) Clean sources
echo.

set choice=
set /p choice=Choice: 
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto 1_build
if '%choice%'=='2' goto 2_assets
if '%choice%'=='3' goto 3_gensources
if '%choice%'=='4' goto 4_eclipse
if '%choice%'=='5' goto 5_idea
if '%choice%'=='6' goto 6_cleanroom
echo "%choice%" is not valid, try again
echo.
goto start

:1_build
echo.
echo Building Lunarium Client...
gradlew build
pause
goto end

:2_assets
echo.
echo Downloading assets...
gradlew downloadAssets
pause
goto end

:3_gensources
echo.
echo Generating sources...
gradlew getSources
pause
goto end

:4_eclipse
echo.
echo Generating Eclipse IDE files...
gradlew eclipse
pause
goto end

:5_idea
echo.
echo Generating IDEA files...
gradlew idea
pause
goto end

:6_cleanroom
echo.
echo Cleaning sources...
gradlew cleanroom
pause
goto end

:end
echo.
echo Task was executed.
pause
