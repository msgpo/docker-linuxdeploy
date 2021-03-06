#!/usr/bin/env bash

set -ex

source /entrypoint.sh

git clone https://github.com/linuxdeploy/linuxdeploy.git --depth=1 /tmp/linuxdeploy
pushd /tmp/linuxdeploy

git submodule update --init --recursive
cmake . -DCMAKE_INSTALL_PREFIX=/usr/local -DCMAKE_BUILD_TYPE=Release -DUSE_SYSTEM_CIMG=Off -DUSE_CCACHE=Off
make -j`nproc`

mv bin/linuxdeploy /usr/local/bin/linuxdeploy
popd

rm -rf /tmp/linuxdeploy