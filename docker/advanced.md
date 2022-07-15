#ow-To Run advanced commands with docker on linux (cmd):

1. Persist data from docker containers (external mounted volume):
    - `docker run mysql`
    - `docker run -v /opt/datadir:/var/lib/mysql mysql`
    - The docker container will implicitly mount the external directory to a  
      folder inside the Docker container. In this way all of the data will be  
      now stored in the external volume

2. Docker container inspection (json format):
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
