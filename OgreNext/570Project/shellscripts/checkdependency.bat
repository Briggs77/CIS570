@echo off
setlocal EnableDelayedExpansion


if not exist Dependencies (
    echo Dependencies folder not found. Creating Dependencies folder...
    mkdir Dependencies
) else (
    echo Dependencies folder already exists.
)

if not exist ..\Dependencies\Ogre\ogre-next (
    echo Error: ogre-next not found in ../Dependencies/Ogre/.
) else (
    echo ogre-next found in ../Dependencies/Ogre.
    :: Create symbolic link to ../Dependencies/Ogre/ogre-next in Dependencies <--Super Absolutly Necessary
    if not exist Dependencies\Ogre (
        mklink /D Dependencies\Ogre ..\..\Dependencies\Ogre\ogre-next
        echo Symbolic link created for ogre-next in Dependencies.
    ) else (
        echo Symbolic link already exists in Dependencies.
    )
)

echo Dependency check completed.
