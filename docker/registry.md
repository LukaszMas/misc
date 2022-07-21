#How-To Docker registry on linux (cmd):

1. Look into Docker registry - look at the following command:
    - `docker run nginx`
    - The image follows docker naming convention:
        - `nginx` stands for `nginx/nginx`
    - The images with registry not specified it is assumed that you mean
      `docker.io`
        - A lot of kubernetes related images are stored there as well (ex.
          those used for performing end-to-end testingi on the cluster)
    - gcp, aws and etc storages are by default set private registry

2. Using private registry (remember to always login before pull /push):
    - `docker login private-registry.io`
    - `docker run private-registry.io/apps/internal-app`

3. Deploy Private Registry:
    - `docker run -d -p 5000:5000 --name registry registry:2`
    - `docker image tag my-image localhost:5000/my-image`
    - `docker push localhost:5000/my-image`
    - `docker pull localhost:5000/my-image`
    - `docker pull 192.168.56.100:5000/my-image`
