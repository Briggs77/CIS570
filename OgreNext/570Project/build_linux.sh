# This script is modified from https://www.ogre3d.org/download/sdk/sdk-ogre-next
# and has been modified as of 8-4-24.


#!/bin/bash

prompt_user() {
    while true; do
        read -p "$1 (y/n): " yn
        case $yn in
            [Yy]* ) return 0;;
            [Nn]* ) return 1;;
            * ) echo "Please answer yes or no.";;
        esac
    done
}

if [ ! -d "Dependencies" ]; then
    echo "Dependencies folder not found. Running setup_dependencies.sh..."
    ./shellscripts/setup_dependencies.sh
fi

if [ -d "build" ]; then
    echo "Build folder exists."

    if prompt_user "Do you want to proceed and delete the build and bin folders?"; then
        if [ -d "bin" ]; then
            echo "Deleting bin folder..."
            rm -rf bin
        fi

        echo "Deleting build folder..."
        rm -rf build
    else
        echo "Aborting."
        exit 1
    fi
fi

echo "Creating build folder..."
mkdir build

cd build

echo "Running cmake .."
cmake .. -DCMAKE_BUILD_TYPE=Debug

# Run make
echo "Running make"
make

echo "Build process complete."
