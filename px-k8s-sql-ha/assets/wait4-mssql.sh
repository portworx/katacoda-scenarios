#!/bin/bash -e

while true; do
    if kubectl get pods | grep Running > /dev/null  
    then
        echo SQL Server is Ready
        break
    else
        echo Waiting for SQL Server to be Ready ...
        sleep 5
    fi
done
