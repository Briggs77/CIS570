# This script is originally sourced from https://www.ogre3d.org/download/sdk/sdk-ogre-next
# and has been modified as of 8-4-24.


#!/bin/bash

# Function to prompt user for yes/no input
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

# Check if Dependencies folder exists
if [ ! -d "Dependencies" ]; then
    echo "Dependencies folder not found. Running setup_dependencies.sh..."
    ./shellscrips/setup_dependencies.sh
fi

# Check if build folder exists
if [ -d "build" ]; then
    echo "Build folder exists."

    # Prompt user to abort or proceed
    if prompt_user "Do you want to proceed and delete the build and bin folders?"; then
        # Check if bin folder exists
        if [ -d "bin" ]; then
            echo "Deleting bin folder..."
            rm -rf bin
        fi

        # Delete build folder
        echo "Deleting build folder..."
        rm -rf build
    else
        echo "Aborting."
        exit 1
    fi
fi

# Create new build folder
echo "Creating build folder..."
mkdir build

# Enter the build folder
cd build

# Run cmake ..
echo "Running cmake .."
cmake .. -DCMAKE_BUILD_TYPE=Debug

# Run make
echo "Running make"
make

echo "Build process complete."
