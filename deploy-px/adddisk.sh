#!/bin/bash -xe
mknod -m660 /dev/loop18 b 7 18
touch /var/loop_device_file
truncate -s 64G /var/loop_device_file
losetup /dev/loop18 /var/loop_device_file
