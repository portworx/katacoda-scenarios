</br>

We will now deploy a 3 node cassandra cluster using the Portworx volumes. To do this, we will make use of the StorageClass `px-sc` that has already been created.

###### Create the StatefulSet. Use the template `/tmp/cassandra-sts.yaml`

`kubectl apply -f /tmp/cassandra-sts.yaml`{{execute}}

