#!/bin/bash

echo "Cloning all repositories..."
git clone https://github.com/MiNI-UAV/UAV_aggregator.git
git clone https://github.com/MiNI-UAV/UAV_physics_engine.git
git clone https://github.com/MiNI-UAV/UAV_controller.git
git clone https://github.com/MiNI-UAV/UAV_drop_physic.git

echo "Build C++ projects"
for PROJECT_PATH in UAV_physics_engine UAV_controller UAV_drop_physic
do
        cd $PROJECT_PATH
        git lfs fetch --all
        git submodule update --init --recursive
        mkdir build
        cd build
        cmake ..
        if [ $? -ne 0 ]; then
                echo "$PROJECT_PATH : CMake configuration failed. Please check your CMakeLists.txt and try again."
                exit 1
        fi
        make -j$(nproc)
        if [ $? -ne 0 ]; then
                echo "$PROJECT_PATH : Build failed. Please check the error messages above."
                exit 1
        fi
        cd ../..
done

cd UAV_aggregator
cargo build
cd ..
