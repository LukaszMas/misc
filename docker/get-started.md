#How-To Install and get started with docker on linux:

1. Get docker engine (free community version):
    - Go to `docs.docker.com`
    - Click on `Get Docker` [installation][1]
    - Pick your operating system (*ubuntu*)
    - Read through prerequisites and OS requirements
    - To confirm your system version you can type in the cmd:
        - `cat /etc/*release*`
    - Make sure that there are no older version of docker on your system:
        - `sudo apt-get remove docker docker-engine docker.io containerd runc`
    - Install docker following the rest of the guide on the website

2. (recap) On Ubuntu just run command:
    - `sudo apt-get install docker.io`
    - Verify installation:
        - `sudo docker version`
    - You might need to add adjust access level to `/var/run/docker.sock`:
        - `sudo usermod -aG docker $USER`
        - or `sudo chmod +600 /var/run/docker.sock`

3. Run simple container to ensure all works fine
    - Go to the website: [docker.com][2] (most popular images)
    - Search for `whalesay` or directly at: [whalesay][3]
    - Or just simply call this in your cmd line:
        - `sudo docker pull docker/whalesay`
        - It will use dfault release tag: (latest)
    - Run the pulled docker image with:
        - `sudo docker run docker/whalesay cowsay Hello-World!`
        - You should see a whale saying "Hello-World!"

[1]: <docs.docker.com/desktop/linux/install/> "docker linux install"
[2]: <hub.docker.com> "dcoker images"
[3]: <https://hub.docker.com/r/docker/whalesay> "docker whalesay image"
