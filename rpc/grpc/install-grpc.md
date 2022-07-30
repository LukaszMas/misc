#How-To Install grpc on your Linux computer (cmd):

GitHub: [grpc repo][1]

1. Build grpc inside `/usr/local/src` directory:
      - `cd /usr/local/src`
      - `sudo git clone --recurse-submodules --depth 1 --shallow-submodules https://github.com/grpc/grpc`
          - You can optionally point at the branch instead of the remote's  
            HEAD, ex: <-b v1.40.0>
      - `cd grpc`
      - `sudo mkdir -p cmake/build`
      - `pushd cmake/build`
      - `sudo cmake -DgRPC_INSTALL=ON -DgRPC_BUILD_TEST=OFF
        -DCMAKE_INSTALL_PREFIX=/opt/grpc ../..`
      - `sudo make -j<nproc>`
      - `sudo make install`
      - `popd`
      - Now add `/opt/grpc/bin` to your $PATH env variable
      - Check protoc version:
          `protoc --version`

[1]: <https://github.com/grpc/grpc> "github grpc repo"
