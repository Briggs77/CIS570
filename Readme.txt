First, Open a Linux terminal or windows command prompt as administator 
and do not powershell. Then CD into the directory of this readme.txt. 


Linux:

Build Ogre Library for Linux

            cd ./OgreNext/Dependencies
            chmod +x build_ogre_linux_c++latest.sh
            ./build_ogre_linux_c++latest.sh

Build Main Project for Linux

            cd ./OgreNext/570Project
            chmod +x build_linux.sh
            cd ./shellscripts
            chmod +x setup_dependencies.
            cd ..
            ./build_linux.sh

            

Windows:

Use Command Prompt NOT Powershell to cd into ./Dependencies folder
then run:

Build Ogre Library for Windows
                       
            cd ./OgreNext/570Project
            Dependencies/build_ogre_Visual_Studio_17_2022_x64 from the 

Build Main Project for Windows

            cd ./OgreNext/570Project
            ./build_windows.bat

Then To Rebuild the Project for Either Linux or Windows without rebuilding the whole Library
            ./build_linux.sh
		or 
	    ./build_windows.bat


