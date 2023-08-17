#!/bin/bash

mkdir -p data
cd data
git clone https://github.com/MiNI-UAV/UAV_aggregator
git lfs fetch --all
cp -r UAV_aggregator/assets .
cp -r UAV_aggregator/configs .
mkdir -p logs
echo "1" > logs/last_log
rm -rf UAV_aggregator 
cd ..
echo "Data prepared!"