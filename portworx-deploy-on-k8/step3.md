</br>

###### Create Cassandra StatefulSet


`kubectl apply -f /tmp/cassandra-sts.yaml`{{execute}}


This configuration creates a Statefulset for Cassandra with three replicas. It uses the Stork scheduler to enable pods to be placed closer to where their data is located.


Wait for the pod `cassandra-0` to be `Ready` before proceeding to the next question.
