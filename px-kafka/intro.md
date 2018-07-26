[Portworx](https://portworx.com/) is a software defined persistent storage solution designed and purpose built for applications deployed as containers, via container orchestrators such as Kubernetes, Marathon and Swarm. It is a clustered block storage solution and provides a Cloud-Native layer from which containerized stateful applications programmatically consume block, file and object storage services directly through the scheduler.

In this tutorial, you will learn how to deploy kafkaDB to Kubernetes using Helm and Portworx:

### Step: Deploy Helm to our Kubernetes cluster

In this step we will show you how to deploy Helm to your Kubernetes cluster. [Helm](https://helm.sh/) helps you manage Kubernetes applications — Helm Charts helps you define, install, and upgrade even the most complex Kubernetes application. Charts are easy to create, version, share, and publish — so start using Helm and stop the copy-and-paste madness.

### Step: Deploy kafka using Helm with the Portworx Storage Class

Once Helm is deployed we will use it to deploy the [kafkaDB chart](https://github.com/kubernetes/charts/tree/master/stable/kafkadb). In order to provide for a highly available kafkaDB instance, we will configure the chart to use a Portworx volume that we will create to ensure 3 replicas of the data. Portworx will perform synchronous replication of the volume so that the kafkaDB data is well protected. Once kafkaDB is deployed we will use the kafkaDB client to create some data.


### Step: Perform a failover test

In this step we will simulate a node failure to show how Kubernetes can reschedule your kafkaDB pod to run on another node in your cluster. Portworx is able to ensure that the rescheduled pod connects to it data from anywhere in the cluster but goes a step further by ensuring that the pod will be scheduled on a node which has a local copy of the data so that you get the best level of performance. This advanced orchestration of stateful workloads is handled by the [STorage ORchestrator for Kubernetes (STORK)](https://github.com/libopenstorage/stork/).


### Step: Expand the volume used by kafkaDB

In this step we will show how Portworx volumes can be dynamically expanded with zero downtime. Portworx are thinly provisioned and the size of the PVC is used as a maximum size. Once you reach this upper limit on the size of your kafkaDB database you can easily perform this operation to add more capacity to your volume.


### Step: Take a snapshot and restore it

In this final step we will show how snapshots can be used with kafkaDB volumes. Snapshots are efficient point-in-time copies of volumes that can be either read-write or read-only. Each snapshot is a volume in its own right and can be used freely by applications. They are implemented using a copy-on-write technique, so that they only use space in places where they differ from their parent volume.


### Other things you should know

To learn more about how why running kafka on Portworx is a great idea take a look at the following links:
* [Introduction to Portworx](https://portworx.com/products/introduction/)
* [Customer Stories](https://portworx.com/customers/)


This scenario assumes you have already covered the following scenarios:
* [How to install Portworx on Kubernetes](https://www.katacoda.com/portworx/scenarios/deploy-px-k8s)
* [How to create Portworx volumes on Kubernetes](https://www.katacoda.com/portworx/scenarios/px-k8s-vol-basic)
