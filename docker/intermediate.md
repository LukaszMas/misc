#ow-To Run intermediate commands with docker on linux:
:wqa!

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
    - (opt) Delete all docker containers at once:
        - `docker rm -f $(docker ps -a -q)`

5. Docker `images` (list available images and their sizes):
    - `sudo docker images`
    - You will see all the available images on your host

6. Docker `rmi` (remove image):
    - First you have to make sure that:
        - No containers are running off the image before removing
        - There are no dependent containers on the image
    - `sudo docker rmi <image_name>`
    - To remove all images with single command:
        - `docker rmi $(docker images -a -q)`

7. Docker  `pull` (pull the image and store on the host machine):
    -  `sudo docker pull <image_name>`

8. Docker `run` with command:
    - `sudo docker run ubuntu sleep 5`

9. Docker execute command on running container:
    - `sudo docker exec <container_name> cat /etc/hosts`

10. Docker run in (attached/detached mode) with simple web-app (port 8080):
    - First, lets run the app in the attached mode:
        - `docker run kodekloud/simple-webapp`
        - To stop the container before it fnishes you have to press CTRL+C
    - Second, lets run the app in the detached mode:
        - `docker run -d kodekloud/simple-webapp`
        - This will run the container in the background
        - You can name the container with:
            -`docker run -d --name webapp kodecloud/simple-webapp`
    - Now run the `docker ps` command to view the running containers
    - If you want to attach back to the running container, run:
    - `docker attach <container_id>`
        - NOTE: You can specify just first few characters of the container id

11. Docker run in interactive mode:
    - `docker run -i kodekloud/simple-prompt-docker`
    - To attach to the terminal add the `t` flag:
        - `docker run -it kodekloud/simple-prompt-docker`

12. Docker run web-app and port access:
    - `docker run kodekloud/webapp`
    - The app will be running on given port (def. 0.0.0.0:5000)

13. Docker run web-app and port access:
    - `docker run -p 80:5000 kodekloud/webapp`
    - The web-app becomes accessible inside the docker host via port 80
