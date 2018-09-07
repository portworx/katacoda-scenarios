[Portworx](https://portworx.com/) is the [cloud native storage](https://portworx.com/cloud-native-storage/) company that enterprises depend on to reduce the cost and complexity of rapidly deploying containerized applications across multiple clouds and on-prem environments. With Portworx, you can manage any database or stateful service on any infrastructure using any container scheduler. You get a single data management layer for all of your stateful services, no matter where they run. 

A popular [Kubernetes persistent storage](https://portworx.com/use-case/kubernetes-storage/) and [Docker storage](https://portworx.com/use-case/docker-persistent-storage/) solution, Portworx is a clustered block storage solution and provides a Cloud-Native layer from which containerized stateful applications programmatically consume block, file and object storage services directly through the scheduler.


In this tutorial, you will learn how to deploy Cassandra to Kubernetes and use Portworx Volumes to provide HA capability:
* Use the Portworx Storage Class to create a PVC with 3 replicas of the data
* Use a simple YAML file to deploy Cassandra using this storage class
* How to validate data persistence by deleting the Cassandra pod

### High Level Overview

First we will deploy Cassandra in a stateful set with only a single node (replicas=1) to show the basics of node failover. We will create some data, force Cassandra to flush the data to disk, and then failover the Cassandra pod and show how it comes back up with it's data intact.

Then, we're going to show how we can scale the cluster to 3 nodes and dynamically create volumes for each.


### Other things you should know

To learn more about how why running Redis on Portworx is a great idea take a look at the following links:
* Guide to run [Cassandra in Docker] containers(https://portworx.com/use-case/cassandra-docker-container/)
* Guide to [Kubernetes and Cassandra](https://docs.portworx.com/applications/cassandra.html)
* [Introduction to Portworx](https://portworx.com/products/introduction/)
* [Customer Stories](https://portworx.com/customers/)
* [STORK open source project](https://portworx.com/stork-storage-orchestration-kubernetes/).


This scenario assumes you have already covered the following scenarios:
* [How to install Portworx on Kubernetes](https://www.katacoda.com/portworx/scenarios/deploy-px-k8s)
* [How to create Portworx volumes on Kubernetes](https://www.katacoda.com/portworx/scenarios/px-k8s-vol-basic)
