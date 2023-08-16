#!/bin/bash

echo "Update repositories"
for PROJECT_PATH in UAV_aggregator UAV_physics_engine UAV_controller UAV_drop_physic
do
        cd $PROJECT_PATH
        git pull
        cd ..
done

echo "Rebuild C++ projects"
for PROJECT_PATH in UAV_physics_engine UAV_controller UAV_drop_physic
do
        cd $PROJECT_PATH
        rm -r build
        mkdir build
        cd build
        cmake ..
        make
        cd ../..
done

echo "Rebuild Rust projects"
cd UAV_aggregator
cargo build
cd ..
