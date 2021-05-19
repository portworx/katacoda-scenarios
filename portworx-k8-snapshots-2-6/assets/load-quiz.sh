#!/bin/bash
cd /tmp/

launch.sh


STORK_POD=$(kubectl get pods -n kube-system -l name=stork -o jsonpath='{.items[0].metadata.name}') &&
kubectl cp -n kube-system $STORK_POD:/storkctl/linux/storkctl ./storkctl
sudo mv storkctl /usr/local/bin &&
sudo chmod +x /usr/local/bin/storkctl

kubectl delete ds kube-keepalived-vip -n kube-system

kubectl create -f /tmp/create-mysql.yaml


kubectl create -f /tmp/create-nginx-sts.yaml
