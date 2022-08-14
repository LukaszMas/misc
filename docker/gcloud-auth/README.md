#How-To Authenticate docker through gcloud:

1. Make sure your user has the right docker permissions:
    - `sudo usermod -aG docker $USER`
    - After running this command remember to close the ssh session/re-log for  
      the group permissions to take effect

2. Install and init gcloud:
    - `sudo apt-get install curl`
    - `curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-<version>-<platform>.tar.gz`
    - `tar -xf google-cloud-cli-<version>-<platform>.tar.gz`
    - `./google-cloud-sdk/install.sh`
    - Restart your terminal or ssh session
    - Now run:
        - `gcloud init`
    - Or for console-only:
        - `gcloud init --console-only`
    - Ref guide can be found at [cloud.google.com][1]

3. Authenticate:
    - `gcloud auth configure-docker us-central1-docker.pkg.dev`

4. Additional resources:
    - [Artifact Registry][2]

[1]: <https://cloud.google.com/sdk/gcloud/reference/init> "cloud.google.com/sdk/docs/"
[2]: <https://medium.com/google-cloud/artifact-registry-the-new-way-to-keep-your-app-artifacts-and-docker-images-on-gcp-d1a72da09ff9> "medium"
