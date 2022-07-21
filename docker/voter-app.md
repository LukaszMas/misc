#How-To Run example voting app in docker (linked) on linux (cmd):

1. Run all of the separate containers in detached mode (`-d`):
    - `docker run -d --name=redis redis`
    - `docker run -d --name=db postgres:9.4 result-app`
    - `docker run -d --name=vote -p 5000:80 voting-app`
    - `docker run -d --name=result -p 5001:80`
    - `docker run -d --name=worker worker`

2. We need to tell the docker how to link the containers together:
    - `docker run -d --name=vote -p 5000:80 --link redis:redis voting-app`
        - we can use `redis` because we named it in the first place
    - `docker run -d --name=db postgres:9.4 --link db:db result-app`
    - NOTE: link is depreciated we should use a `docker-compose.yml` file

3. After creating a proper `docker-compose.yml` we can just bing up the entire
   application stack with just: `docker-compose up`
    - ```
      redis:
        image: redis
      db:
        image: postgres:9.4
      vote:
        image: voting-app
        ports:
            - 5000:80
        links:
            - redis
      result:
        image: result-app
        ports:
            - 5001:80
        links:
            - db
      worker:
        image: worker
        links:
            - redis
            - db
      ```
4. Docker compose - `build` command:
    - Replace `image` with `build` and docker compose will build the images  
      instead of trying to download them.
    - Also specify the directory that all of the build files are stored, ex:
        - `build: ./vote`
    - This time when we run `docker compose up` docker will first build the  
      containers give it a temporary name for it and then it will use the  
      containers to run the your apps

5. Docker `compose` (version) evolved over time:
    - Version one was limited
    - Version two got upgraded with `services:` section
    - How docker compose recognizes  the v1 / v2?
        - You have to specify for the versions 2+ in the `docker-compose.yml` ex:
            - `version: 2`
    - With version 2:
        - we can specify `depens_on: - redis`

6. Creating networks:
    - ```
      networks:
          front-end:
          back-end:
      ```
