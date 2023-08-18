#!/bin/bash

docker compose pull
docker compose -f docker-compose-volume-prepare.yml run  --entrypoint cp  uav_server -rv assets logs configs /mount
