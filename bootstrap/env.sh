#!/bin/bash

# Copyright 2020 Amazon.com, Inc. or its affiliates. All Rights Reserved.
# SPDX-License-Identifier: Apache-2.0

if [ -z ${NITRO_CLI_INSTALL_DIR} ];
then
    echo "INSTALLDIR variable not set, please set the variable to the location where nitro-cli is installed"
    return -1
fi

lsmod | grep -q nitro_enclaves || \
    sudo insmod ${NITRO_CLI_INSTALL_DIR}/lib/modules/$(uname -r)/extra/nitro_enclaves/nitro_enclaves.ko

export PATH=${PATH}:${NITRO_CLI_INSTALL_DIR}/usr/bin/:${NITRO_CLI_INSTALL_DIR}/etc/profile.d/
export NITRO_CLI_BLOBS=${NITRO_CLI_INSTALL_DIR}/usr/share/nitro_enclaves/blobs
