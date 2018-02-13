#!/bin/bash
count=`kubectl get pvc | grep shared  | wc | awk '{print $1}'`
echo $count
if [ $count -eq 1 ]
then
  echo "done"
fi
