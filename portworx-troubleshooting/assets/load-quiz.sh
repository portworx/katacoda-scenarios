#!/bin/bash
cd /tmp/

launch.sh

sh /tmp/create-pxkeys.sh

cp /tmp/px-spec.yaml /root/px-spec.yaml

kubectl delete ds kube-keepalived-vip -n kube-system

kubectl apply -f /root/px-spec.yaml

