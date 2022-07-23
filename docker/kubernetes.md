#How-To Run Docker with kubernetes on linux:

1. kubernetes (CLI know as kubectl vs docker run):
    - `docker run my-web-server`
    - `kubectl run --replicas=1000 my-web-server`

2. Automatic scaling (base on user load):
    - `kubectl scale --replicas=2000 my-web-server`

3. Upgrade applications in a rolling-update fasion (one at a time):
    - `kubectl rolling-update my-web-server --image=web-server:2`

4. Rollback if something goes wrong:
    - `kubectl rolling-update my-web-server --rollback`

5. Additional supported features:
    - Updating only a % of the containers by the A/B testing methods
    - Support for many different Network and Storage vendors
        - Any network or storage brand nowadays has a plugin for it
    - Support for variety of authentification and authorization
        - All major cloud providers have native support for itvesupport

6. Relation Docker <-> kubernetes:
    - Kubernetes uses Docker host applications in a form of docker containers

7. Kubernetes architecture (a kubernetes cluster consists of nodes):
    - Node (a machine physical or virtual) - is a place where kuberenetes  
      software (set of tools is installed) so it is a worker machine where  
      containers will be launched. We need more than one Node so that if one  
      fails app is still available to the users
    - Cluster (set of Nodes)
    - Master is a Node that watches over the nodes inside the Cluster

8. What is installed with kubernetesi (services):
    - API Server - (front-end for kubernetes, the users etc talk to it to  
      interact with the kubernetes cluster)
    - etcd - (distributed key=value storage to store data about all of the  
      nodes in the cluster in the distributed manner, responsible for  
      implementing all locks so there are no conflicts between the masters)
    - Scheduler - (distributes work or containers across multiple nodes, it
      looks for newly created containers and assigns them to Nodes)
    - Controller - (are the brain behind orchestration, recognizes when a node,
      goes down and when to bring up new containers in such cases)
    - Container Runtime - (Underlying software that is used to run the
      containers that in our case happen to be docker)
    - kubelet - (is the agent that runs on each Node in the cluster, makes  
      sure that the containers are running on the nodes as expected)

8. The `kubectl` command (kubernetes CLI):
    - `kubectl run hello-minikube` (deploy application on the cluster)
    - `kubectl cluster-info <cluster>` (view information about the cluster)
    - `kubectl get nodes <cluster>` (list Nodes that are part of the cluster)


