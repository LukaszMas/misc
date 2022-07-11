#How-To Explore Docker container's file system (cmd):

Ref guide: [stackoverflow][1]

1. Use docker exec (easiest):
    - `docker exec -it <container_name> /bin/bash`

2. Use Snapshotting:
    - Find ID of your running container:
        - `docker ps`
    - Create image (a snapshot) from the container's filesystem:
        - `docker commit <id> <snapshot_name>`
    - Explore this filesystem using ex. bash:
        - `docker run -it <snapshot_name> /bin/bash`
    - (opt) Delete the snapshot image:
        - `docker rmi <snapshot_name>

3. Use the ssh:
    - Install the sshd to your container and run the sshd daemon:
        - `docker run -d -p 22 <conainer_name> /usr/sbin/sshd -D`
    - Find which port to connect to:
        - `docker ps`
    - Run your app then connect and execute commands via ssh

3. Use `nsenter`:
    - With `nsenter` you can get a shell into an existing container, even if  
      that container is not running ssh or any kind of special-purpose dameon
    - Ref: [No need sshd in docker container][2]

[1]: <https://stackoverflow.com/questions/20813486/exploring-docker-containers-file-system> "explore docker container's file system"
[2]: <http://blog.docker.com/2014/06/why-you-dont-need-to-run-sshd-in-docker/> "nsenter for docker"
