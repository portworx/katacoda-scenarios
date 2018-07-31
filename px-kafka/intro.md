[Portworx](https://portworx.com/) is a software defined persistent storage solution designed and purpose built for applications deployed as containers, via container orchestrators such as Kubernetes, Marathon and Swarm. It is a clustered block storage solution and provides a Cloud-Native layer from which containerized stateful applications programmatically consume block, file and object storage services directly through the scheduler.

In this tutorial, you will learn how to deploy kafkaDB to Kubernetes using Helm and Portworx:

### Step: Deploy Zookeeper and Kafka

As of v0.8 Kafka uses zookeeper for storing variety of configurations as K,V in the ZK data tree and use them across the cluster in a distributed fashion. So our first task will be deploy a 3 node ZK cluster using a StatefulSet and have each node use a Portworx volume to ensure high availability. We will then deploy a Kafka StatefulSet which uses our ZK cluster and also has Portworx volumes, this time with 2 replicas so we can have fast failover of the Kafka nodes.


### Step: Perform a failover test

In this step we will simulate a node failure to show how Kubernetes can reschedule your Kafka pod to run on another node in your cluster. Portworx is able to ensure that the rescheduled pod connects to it data from anywhere in the cluster but goes a step further by ensuring that the pod will be scheduled on a node which has a local copy of the data so that you get the best level of performance. This advanced orchestration of stateful workloads is handled by the [STorage ORchestrator for Kubernetes (STORK)](https://github.com/libopenstorage/stork/).


### Step: Expand the volume and Kafka cluster

In this step we will show how Portworx volumes can be dynamically expanded with zero downtime. Portworx are thinly provisioned and the size of the PVC is used as a maximum size. Once you reach this upper limit on the size of your Kafka database you can easily perform this operation to add more capacity to your volume. We will also expand our Kafka cluster from one to three nodes so that we can show how to snapshot entire clusters in the next and final step.


### Other things you should know

To learn more about how why running kafka on Portworx is a great idea take a look at the following links:
* [Introduction to Portworx](https://portworx.com/products/introduction/)
* [Customer Stories](https://portworx.com/customers/)


This scenario assumes you have already covered the following scenarios:
* [How to install Portworx on Kubernetes](https://www.katacoda.com/portworx/scenarios/deploy-px-k8s)
* [How to create Portworx volumes on Kubernetes](https://www.katacoda.com/portworx/scenarios/px-k8s-vol-basic)
