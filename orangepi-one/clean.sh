#!/bin/bash


sudo -v

pushd gadget 
snapcraft clean
popd

pushd kernel
snapcraft --target-arch armhf --debug clean
popd

rm -rf build_img

