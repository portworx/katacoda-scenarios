#!/bin/bash

# Please wait until you see Kubernetes nodes before moving on.

# Running script.
while [ ! -f /root/.kube/config ]
  do
    sleep 1
  done

watch kubectl get nodes

