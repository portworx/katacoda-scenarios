</br>

##### Create a new Cassandra StatefulSet, using a template YAML file.


Use the YAML file below to create the StatefulSet.

`kubectl apply -f /tmp/cassandra-sts.yaml`{{execute}}

Make sure that all pods are up and ready before proceeding. This can take a few minutes.

`watch kubectl get pods -l app=cassandra`{{execute}}

To get back to the terminal:
```clear```{{execute interrupt}}
