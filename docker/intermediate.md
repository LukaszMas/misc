#How-To Install and get started with docker on linux:

1. Docker `run` command (start a container):
    - `docker run nginx`
    - This command runs an instance of the nginx application from the Docker

2. Docker `ps` command (list all containers):
    - `sudo docker ps`
    - This command lists basic information about all running containers
    - Each container automatically gets a random ID and Name created by Docker
    - Run with -a opt:
        - `sudo docker ps -a`
        - This opt will list also previously stopped or exited containers

3. Docker `stop` command (stop a container):
    - While invoking this command you must provide either ID or the Name
    - `sudo docker stop <container_name>"`
    - On success you will see the container_name printed out

4. Docker `rm` command (remove container to free up resources):
    - `sudo docker rm <container_name>"`
    - Again on success you will see the container_name printed out

5. Docker `images` (list available images and their sizes):
    - `sudo docker images`
    - You will see the all available images on your host

6. Docker `rmi` (remove image):
    - `sudo docker rmi <image_name>`

TODO finish this document
