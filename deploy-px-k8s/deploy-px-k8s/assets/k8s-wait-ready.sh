#!/bin/bash -e

while true; do
    NUM_READY=`kubectl get nodes 2> /dev/null | grep -v NAME | awk '{print $2}' | grep -e ^Ready | wc -l`
    if [ "${NUM_READY}" == "2" ]; then
        echo "${NUM_READY} Kubernetes nodes are ready !"
        break
    else
        echo "Waiting for all Kubernetes nodes to be ready. Current: ${NUM_READY}."
    fi
    sleep 5
done