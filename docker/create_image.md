#ow-To Create docker image on linux (cmd):

1. Dockerizing for the ease of shipping and deployment:
    - Understand what you are containerizing (write down manual steps) ex.:
        1. Pick the OS (Ubuntu)
        2. Uppdate apt repo
        3. Install dependencies using apt
        4. Install Python dependencies using pip
        5. Copy source code to /opt folder
        6. Run the web-server using ex. `flask` command

2. To create your own image run:
    - `docker build Dockerfile -t <path>/<app_name>`
    - This will make an image available to you locally

3. Make your image available on the public Docker Hub registry:
    - `docker push <path>/<app_name>`
    - This will push the image as private to the Docker Hub registry

4. Every Docker image must be based off of another image:
    - Either an OS or another image that was create before based on the OS
    - Every docker file must start with the `FROM` instruction

5. NOTES: What is a Dockerfile?:
    - The docker file is in `<INSTRUCTION> <ARGUMENT>` format
        - ex. `FROM`, `RUN`, `COPY` or `ENTRYPOINT` are instructions
        - `Ubuntu` or `apt-get install <program>` are `ARGUMENT`
    - The `ENTRYPOINT` instruction allows to specify a command that will be  
      run when the image is run as a container
    - Docker creates image by creating "layers structure"
    - You can see the history of layers creation:
        - `docker history <path>/<app_name>`

6. Docker `build` command:
    - `docker build .`
    - You will see all the various steps involved and the result of each task  
    - All the layers build are cached so the build of the layered architecture  
      can be restarted at last succeded or particular step (the same is true
      if you are just adding additional steps in the Dockerfile.

7. What can be containerized;
    - Anything you can imagine!
