#How-To Docker Engine on linux:

1. Installing Docker Engine means(three components):
    - Docker CLI
    - REST API
    - Docker Daemon

2. Your Docker CLI may be on a Laptop:
    - `docker -H=remote-docker-engine:2375`
    - `docker -H=10.123.2.1:2375 run nginx`

3. Containerizing:
    - Docker uses namespace to isolate workspaces:
        - `Network`, `Unix Timesharing`, `Network`, `InterProcess`, `Mount`
        - All of these workspaces are createn within their own namespace to  
          provide isolation within containers
    - Name space isolation by PID
        - Container is a Child System in the Host (ex. Linux System)
        - That means the same process will have differen PIDs on the Host  
          System and inside the Container (separated by Namespaces)

4. Resources sharing (cgroups):
    - By default a container may end up using all available resources
    - To specify % of host cpu usage you will set:
        - `docker run --cpus=.5 ubuntu`
        - `docker run --memory=100m ubuntu`
