#!/bin/bash


if [ ! -d "Dependencies" ]; then
    echo "Dependencies folder not found. Creating Dependencies folder..."
    mkdir Dependencies

    if [ ! -d "../Dependencies/Ogre/ogre-next" ]; then
        echo "Error: ogre-next not found in ../Dependencies/Ogre."
    else
        echo "ogre-next found in ../Dependencies/Ogre."
        if [ ! -d "Dependencies/Ogre" ]; then
            ln -s ../../Dependencies/Ogre/ogre-next Dependencies/Ogre
            echo "Symbolic link created for ogre-next in Dependencies."
        else
            echo "Symbolic link already exists in Dependencies."
        fi
    fi
else
    echo "Dependencies folder already exists. Skipping symbolic link creation."
fi

echo "Dependency check completed."
