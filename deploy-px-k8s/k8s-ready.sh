#!/bin/bash

echo
echo "Please wait while a script running in the background to setup the lab..."
echco
echo "...You should shortly see Kubernetes nodes before moving on."

# Running script.
while [ ! -f /root/.kube/config ]
  do
    sleep 1
  done

watch kubectl get nodes

