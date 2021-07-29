#!/bin/bash

echo
echo "Please wait while a script sets up the lab..."


# Running script.
while [ ! -f /root/.kube/config ]
  do
    sleep 1
  done

echo
echo "...Please wait until all Kubernetes nodes are 'Ready'"
sleep 5

watch kubectl get nodes

