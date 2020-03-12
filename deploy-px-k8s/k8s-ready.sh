#!/bin/bash

while [ ! -f /root/.kube/config ]
  do
    sleep 1
  done

watch kubectl get nodes

