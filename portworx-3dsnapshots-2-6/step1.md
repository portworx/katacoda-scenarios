</br>

##### We are deploying a couple of Databases. Once ready, inspect them. In the upcoming steps, we will set up 3D snapshots for the Portworx volumes consumed by these deployment and StatefulSets.


`kubectl get deployment`{{execute}}

Wait until all Mongo nodes are `Ready 3/3`

`kubectl get sts`{{execute}}
