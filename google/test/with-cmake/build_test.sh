#!/bin/bash

# Set the script to exit when on failing command
set -e

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
BUILD_DIR=${SCRIPT_DIR}/build

cmake -DCMAKE_BUILD_TYPE=Release\
    -S ${SCRIPT_DIR} -B ${BUILD_DIR} && cmake --build ${BUILD_DIR} -- -j$(nproc --ignore=2)

echo -e "\n** [ Building sample google test completed at: ${SCRIPT_DIR}/${BUILD_DIR} ] **\n"
