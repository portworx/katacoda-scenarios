#!/bin/bash -xe
docker pull portworx/px-enterprise:1.2.11-rc8  &
mknod -m660 /dev/loop18 b 7 18
touch /var/loop_device_file
truncate -s 64G /var/loop_device_file
losetup /dev/loop18 /var/loop_device_file
clear
