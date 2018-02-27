#!/bin/bash -e

while true; do
    if kubectl get pods | grep sqlpad | grep Running > /dev/null  
    then
        echo SQL Pad is Ready
        break
    else
        echo Waiting for SQL Pad to be Ready ...
        sleep 5
    fi
done
