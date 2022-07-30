# How-To Install gRPC on your Linux computer (cmd):

Ref Guide: [quick start][1]  
GitHub: [grpc repo][2]

1. Install pre-requisites:
    - `sudo apt-get install -y build-essential autoconf libtool pkg-config`

2. Build grpc inside `/usr/local/src` directory:
    - `cd /usr/local/src`
    - `sudo git clone --recurse-submodules --depth 1 --shallow-submodules https://github.com/grpc/grpc`
        - You can optionally point at the branch instead of the remote's  
          HEAD, ex: <-b v1.40.0>
    - `cd grpc`
    - `sudo mkdir -p cmake/build && cd cmake/build`
    - `sudo cmake -DgRPC_INSTALL=ON -DgRPC_BUILD_TEST=OFF
      -DCMAKE_INSTALL_PREFIX=/opt/grpc ../..`
    - `sudo make -j<nproc>`
    - `sudo make install`
    - Now add `/opt/grpc/bin` to your $PATH env variable

3. Check gRPC version:
    - `protoc --version`

[1]: <https://grpc.io/docs/languages/cpp/quickstart/> "quick start"
[2]: <https://github.com/grpc/grpc> "github grpc repo"
