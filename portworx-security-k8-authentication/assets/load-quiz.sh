#!/bin/bash
cd /tmp/

launch.sh

sh /tmp/create-pxkeys.sh

##Create an etcd container
#sh /tmp/install-etcd.sh


##Install Portworx with CSI
cp /tmp/px-spec.yaml /root/px-spec.yaml

kubectl delete ds kube-keepalived-vip -n kube-system

kubectl apply -f /root/px-spec.yaml

kubectl create ns finance

kubectl create ns engineering
