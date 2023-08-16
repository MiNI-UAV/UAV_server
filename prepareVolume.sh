#!/bin/bash

mkdir -p data
cd data
git clone -q https://github.com/MiNI-UAV/UAV_aggregator
cp -r UAV_aggregator/assets .
cp -r UAV_aggregator/configs .
mkdir -p logs
echo "1" > logs/last_log
rm -rf UAV_aggregator 
cd ..
echo "Data prepared!"