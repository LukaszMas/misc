#ow-To Difference between cmd and entrypoint docker on linux (cmd):

1. When you run command like:
    - `docker run ubuntu`
    - It exits immidiately if you then run:
        - `docker ps`
        - You will see that the docker container is in the `exited` state
        - The container lives only as long as the process inside it is alive
