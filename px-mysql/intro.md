[Portworx](https://portworx.com/) is a software defined persistent storage solution designed and purpose built for applications deployed as containers, via container orchestrators such as Kubernetes, Marathon and Swarm. It is a clustered block storage solution and provides a Cloud-Native layer from which containerized stateful applications programmatically consume block, file and object storage services directly through the scheduler.

In this tutorial, you will learn how to deploy MySQL to Kubernetes and use Portworx Volumes to provide HA capability:
* Use the Portworx Storage Class to create a PVC with 3 replicas of the data
* Use a simple YAML file to deploy MySQL using this storage class
* How to validate data persistence by deleting the MySQL pod
* How to dynamically expand storage volumes
* How to take snapshots and restore them

### Step: Deploy MySQL and perform failover test

First we will deploy MySQL with replication factor of 3 and with io_profile=db. To learn more about io_profile settings please visit our [docs page](https://docs.portworx.com/maintain/performance/tuning.html#volume-granular-performance-tuning).

Then we're going run a benchmark using [mysqlslap](https://dev.mysql.com/doc/refman/8.0/en/mysqlslap.html) and simulate a server failure by deleting the pod running MySQL. When the pod come back up Portworx works with the Kubernetes scheduler to make sure it gets scheduled where the data is available.

### Step: Dynamic expansion of volume size

In this step we will inspect and expand the volume used by MySQL and show that this operation requires no downtime.

### Step: Take a snapshot of the databases

In this step we will create a snapshot of the database, drop all of our tables, and show how the snapshot can be used to create a new instance of MySQL with the recovered data.

### Other things you should know

To learn more about how why running MySQL on Portworx is a great idea take a look at the following links:
* [Introduction to Portworx](https://portworx.com/products/introduction/)
* [Customer Stories](https://portworx.com/customers/)
* [STORK open source project](https://portworx.com/stork-storage-orchestration-kubernetes/).


This scenario assumes you have already covered the following scenarios:
* [How to install Portworx on Kubernetes](https://www.katacoda.com/portworx/scenarios/deploy-px-k8s)
* [How to create Portworx volumes on Kubernetes](https://www.katacoda.com/portworx/scenarios/px-k8s-vol-basic)
