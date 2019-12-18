Now that we are familiar with the environment, lets install portworx! The first step is to deploy a dedicated KVDB in this environment. 

The KVDB can be built-in / portworx managed for small clusters OR we can set up our own.  For this lab, lets set up a single node ETCD Cluster in this k8s environment.

Note: A sample etcd pod definition file called px-etcd.yaml is created for you in the root home directory on the master node. 

Update the YAML file with the ip address of node03 and create the deployment.

Once done, run the below command to install etcd.

`kubectl create -f px-etcd.yaml`{{execute}}

**Warning:** Do not change anything else in the px-etcd.yaml file provided other than what has been mentioned below.

# Name: px-etcd
# Status: Running
# Node: node03

`kubectl -n kube-system get pods px-etcd -o wide`{{execute}}
