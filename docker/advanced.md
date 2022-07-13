#ow-To Run advanced commands with docker on linux (cmd):

1. Persist data from docker containers (external mounted volume):
    - `docker run mysql`
    - `docker run -v /opt/datadir:/var/lib/mysql mysql`
    - The docker container will implicitly mount the external directory to a  
      folder inside the Docker container. In this way all of the data will be  
      now stored in the external volume

2. Docker container inspection (json format):
    - `docker inspect <container_name>`
    - This opetion is used to find details about a container

3. See logs of a Docker container that runs in the background:
    - `docker logs <container_name>`

4. ENV Variables in Docker:
    - `docker run -e <ENV_VAR>=<value> <container_name>`

5. Find ENV Variables that are set in the running Docker container:
    - `docker inspect <container_name>`
    - Under `Env` key you will find all of the used ENV Vars in the container
