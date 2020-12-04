</br>

###### Inspect the PX volume created by the StatefulSet and answer the Quiz.

`VOLS=$(kubectl get pvc | grep cassandra | awk '{print $3}');
PX_POD=$(kubectl get pods -l name=portworx -n kube-system -o jsonpath='{.items[0].metadata.name}');
kubectl exec -it $PX_POD -n kube-system -- /opt/pwx/bin/pxctl volume inspect $VOLS`{{execute}}


>> How many nodes are the replica set set-0 created on? <<
() 3
() 1
(*) 2
() None

>> Inspect the volume labels and determine the name of the PVC?<<
=== cassandra-data-cassandra-0

>> What is the size of this volume?<<
() 2 Gi
(*) 1 Gi
() 500 Mi
() 5 GB


