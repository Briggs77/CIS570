@echo off
setlocal EnableDelayedExpansion

:: Define the project name here
set ProjectName=EmptyProject

if not exist Dependencies (
    call shellscripts/checkdependency.bat
)

if exist build (
    echo Build directory already exists.
    set /p choice="Do you want to delete and rebuild (Y/N)? "
    if /i "!choice!"=="Y" (
        rd /s /q build
        echo Build directory deleted.
    ) else (
        echo Aborting build process.
        exit /b 0
    )
)

if exist bin (
    echo Bin directory already exists.
    rd /s /q bin
    echo Bin directory deleted.
)

mkdir build
cd build
cmake ..
if errorlevel 1 (
    echo Failed to generate Visual Studio solution with CMake.
    exit /b 1
)

:: Modifying .vcxproj working directory to fix debugging with Visual Studio.
for %%F in (*.vcxproj) do (
    echo Modifying %%F to set debugging working directory...
    powershell -Command "(Get-Content %%F) -replace '<LocalDebuggerWorkingDirectory>.*</LocalDebuggerWorkingDirectory>', '<LocalDebuggerWorkingDirectory>$(ProjectDir)../bin/DEBUG</LocalDebuggerWorkingDirectory>' | Set-Content %%F"
    powershell -Command "(Get-Content %%F) -replace '</PropertyGroup>', '<LocalDebuggerWorkingDirectory>$(ProjectDir)../bin/DEBUG</LocalDebuggerWorkingDirectory></PropertyGroup>' | Set-Content %%F"
)

:: Build Debug configuration
"C:\Program Files\Microsoft Visual Studio\2022\Community\MSBuild\Current\Bin\MSBuild.exe" /p:Configuration=Debug %ProjectName%.sln
if errorlevel 1 (
    echo Failed to build Debug configuration.
    exit /b 1
)

:: Build Release configuration
"C:\Program Files\Microsoft Visual Studio\2022\Community\MSBuild\Current\Bin\MSBuild.exe" /p:Configuration=Release %ProjectName%.sln
if errorlevel 1 (
    echo Failed to build Release configuration.
    exit /b 1
)

cd ..

call ./shellscripts/run.bat

echo Build process completed.
