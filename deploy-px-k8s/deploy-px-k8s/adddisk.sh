#!/bin/bash -xe
mknod -m660 /dev/loop18 b 7 18
touch /var/loop_device_file
truncate -s 64G /var/loop_device_file
losetup /dev/loop18 /var/loop_device_file

(docker rm -f etcd &> /dev/null &)
(rm -rf /etc/pwx &> /dev/null &)
(docker pull `curl -s http://install.portworx.com/ | grep image: | awk  '{print $2}' | tr -d "\r"` &> /dev/null &)
(docker pull quay.io/coreos/etcd:latest &> /dev/null &)
(docker pull mysql:5.6 &> /dev/null &)

clear
