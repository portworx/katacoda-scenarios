#!/bin/bash
for j in `kubectl get pvc | grep cassandra | awk '{print $3}'`; do pvc=`kubectl get pvc | grep $j | awk '{print $1}'`;echo "$pvc volume placed on `ssh -o strictHostKeyChecking=no node01 pxctl volume inspect $j | grep "Running on" | awk '{print $NF}'`"; done | sort -nr -k 5 > /tmp/volume_placement

for nodes in cassandra-0 cassandra-1 cassandra-2; do grep $nodes /tmp/volume_placement ; echo; done
