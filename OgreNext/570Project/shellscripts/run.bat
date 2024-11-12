@echo off

:: Define the project name here
set "ProjectName=EmptyProject"

set "currentDir=%~dp0"
set "sourceDir=%~dp0.."
set "targetDir=%sourceDir%\bin\Debug"

if not exist "%targetDir%" (
    echo Target directory %targetDir% does not exist. Creating it now...
    mkdir "%targetDir%"
)

echo Copying SDL2.dll from %sourceDir% to %targetDir%...
copy "%sourceDir%\Dependencies\Ogre\build\bin\release\SDL2.dll" "%targetDir%\SDL2.dll"
if errorlevel 1 (
    echo Failed to copy SDL2.dll.
    exit /b 1
) else (
    echo SDL2.dll successfully copied.
)

::set "assimpSourceDir=%sourceDir%\Dependencies\assimp\build\bin\Release"

::echo Copying assimp-vc142-mt.dll from %assimpSourceDir% to %targetDir%...
::copy "%assimpSourceDir%\assimp-vc142-mt.dll" "%targetDir%\assimp-vc142-mt.dll"
::if errorlevel 1 (
::    echo Failed to copy assimp-vc142-mt.dll.
::    exit /b 1
::) else (
::    echo assimp-vc142-mt.dll successfully copied.
::)

cd "%targetDir%"

echo Running %ProjectName%.exe...
%ProjectName%.exe
if errorlevel 1 (
    echo Failed to run %ProjectName%.exe.
    exit /b 1
) else (
    echo %ProjectName%.exe ran successfully.
)

exit /b 0
