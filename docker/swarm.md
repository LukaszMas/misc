#How-To Docker Swarm on Windows:

1. Swarm Manager host:
    - `docker swarm init`

2. Docker node hostsi (to deploy on swarm cluster):
    - `docker swarm join --token <token>`

3. Docker service (multimple instances):
    - `docker run my-web-server`
    - Setup docker service to manage 
    - `docker service create --replicas=3 my-web-server`
          - `docker service ...` command has to be run on the manager node
          -  This command is similar to the `docker run` command:
              - can be run with `--network <arg>`, `-p` etc
