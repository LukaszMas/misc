#How-To Docker Orchestration on Windows:

1. Why Docker Orchestrate?
    - When number of users increase and the instance is no longer able to  
      handle the load, then we deploy additional instance of the application  
      by running `docker run <app>` multiple times
          - You have to do that yourself
          - You also have to monitor the health of the application and if it  
            fails you should be able to deploy another intance of that
    - Build your own scripts to orchestrate hosting of containers in the  
      production enviornment 
    - Typically a container orchestration solution consists of multiple docker  
      hosts that can host containers - in that way even if one container fails  
      it is still available/accessible through the others
    - This easily allows to deploy hundreds/thousands of instances of your  
      application with a single command (docker swarm), ex:
          - `docker services create --replicas=100 nodejs`
2. What is supported by orchestration:
    - Advanced networking between these containers across different hosts
    - Load balances of user requests across different hosts
    - Sharing the storage between the hosts
    - Support for configuration management
    - Security management within the cluster

3. Orchestration solutions:
    - Docker Swarm - easy to setup and get-started but lacks advanced  
      auto-scaling features required by complex production ready apps
    - MESOS - hard to setup and start with but supports advanced features
    - kubernetes - most popular a bit difficult to setup and get started but  
      is very flexible, provides a lot of options to customize deployment  
      It is now supported on all public cloud service providers like gcp,  
      azure, aws and kuberentes projects is one of the top brand project on  
      the github.

