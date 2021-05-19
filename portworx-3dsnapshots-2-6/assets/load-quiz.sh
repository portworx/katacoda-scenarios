#!/bin/bash
cd /tmp/

launch.sh

sleep 10

kubectl delete ds kube-keepalived-vip -n kube-system

kubectl create -f /tmp/create-mysql.yaml

sleep 5

kubectl create -f /tmp/create-mongo.yaml
