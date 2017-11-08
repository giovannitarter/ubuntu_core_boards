#!/bin/bash

#snapcraft --debug snap gadget 

sudo -v

pushd gadget 
snapcraft
popd

pushd kernel
snapcraft --target-arch armhf --debug
popd

sudo ubuntu-image -c stable -i 512M \
    --extra-snaps gadget/udoo-quad-gadget_16-0.1_armhf.snap  \
    --extra-snaps kernel/udoo-quad-kernel_4.4_armhf.snap \
    -O build_img  udoo-quad.model --debug

