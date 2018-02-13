#!/bin/bash
count=`kubectl get pvc | grep shared  | wc | awk '{print $1}'`
if [ $count -eq 1 ]
then
  echo "done"
fi
