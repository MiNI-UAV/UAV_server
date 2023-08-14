#!/bin/bash

docker build --progress=plain --tag=xevi8x/uav_server:latest .
docker push xevi8x/uav_server:latest