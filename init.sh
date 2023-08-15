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
        git submodule update --init --recursive
        mkdir build
        cd build
        cmake ..
        make
        cd ../..
done

cd UAV_aggregator
cargo build
cd ..
