#!/bin/bash

#snapcraft --debug snap gadget 

sudo -v

pushd gadget 
snapcraft
popd

pushd kernel
snapcraft --target-arch armhf --debug
popd

ubuntu-image -c stable -i 512M \
    --extra-snaps gadget/orangepi-one-gadget_16-0.1_armhf.snap \
    --extra-snaps kernel/orangepi-one-kernel_4.13_armhf.snap \
    -O build_img orangepi-one.model --debug

