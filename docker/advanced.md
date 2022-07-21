#How-To Run advanced commands with docker on linux (cmd):

1. Persist data from docker containers (external mounted volume):
    - `docker run mysql`
    - `docker run -v /opt/datadir:/var/lib/mysql mysql`
    - The docker container will implicitly mount the external directory to a  
      folder inside the Docker container. In this way all of the data will be  
      now stored in the external volume

2. Docker container inspection (JSON format):
    - `docker inspect <container_name>`
    - This option is used to find details about a container

3. See logs of a Docker container that runs in the background:
    - `docker logs <container_name>`

4. ENV Variables in Docker:
    - `docker run -e <ENV_VAR>=<value> <container_name>`

5. Find ENV Variables that are set in the running Docker container:
    - `docker inspect <container_name>`
    - Under `Env` key you will find all of the used ENV Vars in the container

6. Docker networks:
    - To list all the Docker networks run:
        - `docker network ls`
    - By default docker creates Bridge network (172.17.0.2) for the containers
    - To run containers in none network:
        - `docker run Ubuntu --network=none`
    - To map containers to the host network:
        - `docker run Ubuntu --network=host`

7. Custom network:
    - `docker network create --driver bridge --subnet 182.18.0.0/16\
      custom-siolated-network`

8. Inspect docker network:
    - `docker inspect <network_id>`
    - This will display network settings that the container is attached to

9. Embedded DNS (use the container name), ex:
    - `docker.connect(myql)`

10. Docker file system, under `/var/lib/docker`:
    - `aufs`
    - `containers`
    - `image`
    - `volumes`

11. Docker layered architecture will reuse cached built layers that way it  
    perserves memory and saves time
    - Image layers are read only
    - Container Layer are writable
    - You can apply feature modifications but its done on copy version of the  
      modified file (copy on write mechanism)
    - All of the changes get deleted along with the termination of the container

12. Creating persistent volumes (Two types: volume and bind mounts):
    - `docker volume create data_volume`
    - `docker run -v data_volume:/var/lib/mysql mysql`
    - NOTE: Docker will automatically create volumes if they don't exist
    - Other option is to use bind mounting (specify absolute path):
        - `docker run -v /data/mysql:/var/lib/mysql mysql`
            - `/data/mysql` - is the absolute path on the docker host
            - `/var/lib/mysql` - is the default location for mysql database
            - `mysql` - is the container name
    - NOTE: `-v` is the old way to mount volumes, the new preferred way is to  
      use `--mount` as it is more verbose, specify each parameter in a  
      key=value pair, ex:
          - `docker run --mount type=bind, source=/data/mysql,
            target=var/lib/mysql mysql`

13. Docker uses storage drivers to enable layered architecture, some of the  
    common used drivers are:
    - `AUFS`, `ZFS`, `BTRFS`, `Device Mapper`, `Overlay`, `Overlay2`
    - The selection of the underlying storage driver depends on the OS, Docker  
      will try to pick the best driver and that relates to peformance and  
      stability (Not all storage drivers are available across different OSes

14. Docker `compose` command (using docker-compose.yml config file):
    - After creating a yml config file run:
    - `docker-compose up`
        - This is only applicable to running docker containers on a single
          Docker host.
