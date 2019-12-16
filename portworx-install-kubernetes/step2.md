Now that we are familiar with the environment, lets install portworx! The first step is to deploy a dedicated KVDB in this environment. 

The KVDB can be built-in / portworx managed for small clusters OR we can set up our own.  For this lab, lets set up a single node ETCD Cluster in this k8s environment.

Note: A sample etcd deployment manifest file is already provided in the default directory on the master. 

Update the YAML file with the ip address of node03 and create the deployment.

# Name: px-etcd
# Status: Running
# Node: node03

`kubectl -n kube-system get pods px-etcd -o wide`{{execute}}
