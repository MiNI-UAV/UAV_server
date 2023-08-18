# UAV_server
Run UAV server in Docker!

### Image
https://hub.docker.com/repository/docker/xevi8x/uav_server

### How to run?
0.   Install Docker and Docker Compose
  https://docs.docker.com/engine/install/
1.   Clone repository and enter repository folder
```git clone https://github.com/MiNI-UAV/UAV_server && cd UAV_server```

2. Prepare data folder containing assets and configs
   
    Linux: ```./prepareVolume.sh```, Windows: ```prepareVolume.bat```

    You may want to edit some params in ```./data``` folder

4.   Run command in folder containing docker-compose.yml

     In terminal: ```docker compose up``` and exit with SIGINT

     Or in background: ```docker compose up -d```
     and stop with command: ```docker compose stop```
