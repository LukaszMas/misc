#How-To How to install CMake (bootstrap) (cmd):

Ref guide at: [Installing CMake][1]

1. Install CMake of desired version:
    - `sudo apt-get remove cmake`
    - `sudo apt-get install libssl-dev`
    - `wget https://cmake.org/files/v<version>/cmake-<version>.<patch>.tar.gz`
        - `<version>` ex: 3.16
        - `<patch>` ex: 5
    - `tar -xvf cmake-<version>.<patch>.tar.g`
    - `cd cmake-<version>.<patch>.tar.gz && ./bootstrap`
    - `sudo make -j$<nproc> && sudo make install`
    - (confirm) `cmake --version`


2. (opt) Installing cmake 3.16:
    - `sudo apt-get remove cmake`
    - `sudo apt-get install libssl-dev`
    - `wget https://cmake.org/files/v3.16/cmake-3.16.5.tar.gz`
    - `tar -xvf cmake-3.16.5.tar.gz && cd cmake-3.16.5 && ./bootstrap`
    - `sudo make -j6 && sudo make install`
    - `cmake --version`

[1]: <https://cmake.org/install/> "installing CMake"
