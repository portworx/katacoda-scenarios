[Portworx](https://portworx.com/) is the [cloud native storage](https://portworx.com/cloud-native-storage/) company that enterprises depend on to reduce the cost and complexity of rapidly deploying containerized applications across multiple clouds and on-prem environments. With Portworx, you can manage any database or stateful service on any infrastructure using any container scheduler. You get a single data management layer for all of your stateful services, no matter where they run. 

A popular [Kubernetes storage](https://portworx.com/use-case/kubernetes-storage/) and [persistent storage for Docker](https://portworx.com/use-case/docker-persistent-storage/) solution, Portworx is a clustered block storage solution and provides a Cloud-Native layer from which containerized stateful applications programmatically consume block, file and object storage services directly through the scheduler.

In this tutorial, you will learn how to deploy MariaDB to Kubernetes and use Portworx Volumes to provide HA capability:
* Use the Portworx Storage Class to create a PVC with 3 replicas of the data
* Use a simple YAML file to deploy MariaDB using this storage class
* How to validate data persistence by deleting the MariaDB pod
* How to dynamically expand storage volumes
* How to take snapshots and restore them

### Step: Deploy MariaDB and perform failover test

First we will deploy MariaDB with replication factor of 3 and with io_profile=db. To learn more about io_profile settings please visit our [docs page](https://docs.portworx.com/maintain/performance/tuning.html#volume-granular-performance-tuning).

Then we're going run a benchmark using [mariadbslap](https://dev.mariadb.com/doc/refman/8.0/en/mariadbslap.html) and simulate a server failure by deleting the pod running MariaDB. When the pod come back up Portworx works with the Kubernetes scheduler to make sure it gets scheduled where the data is available.

### Step: Dynamic expansion of volume size

In this step we will inspect and expand the volume used by MariaDB and show that this operation requires no downtime.

### Step: Take a snapshot of the databases

In this step we will create a snapshot of the database, drop all of our tables, and show how the snapshot can be used to create a new instance of MariaDB with the recovered data.

### Other things you should know

To learn more about how why running Mongo on Portworx is a great idea take a look at the following links:
* [Kubernetes MariaDB](https://portworx.com/mariadb-kubernetes/) tutorial
* [HA MariaDB on GKE](https://portworx.com/run-ha-mariadb-google-kubernetes-engine/)
* [HA MariaDB on EKS](https://portworx.com/ha-mariadb-amazon-eks/)
* [HA MariaDB on AKS](https://portworx.com/run-ha-mariadb-azure-kubernetes-service/)
* [HA MariaDB on OpenShift](https://portworx.com/ha-mariadb-openshift/)
* [How to backup and restore MariaDB on Red Hat OpenShift](https://portworx.com/backup-restore-mariadb-red-hat-openshift/)
* [Introduction to Portworx](https://portworx.com/products/introduction/)
* [Customer Stories](https://portworx.com/customers/)
* [STORK open source project](https://portworx.com/stork-storage-orchestration-kubernetes/).


This scenario assumes you have already covered the following scenarios:
* [How to install Portworx on Kubernetes](https://www.katacoda.com/portworx/scenarios/deploy-px-k8s)
* [How to create Portworx volumes on Kubernetes](https://www.katacoda.com/portworx/scenarios/px-k8s-vol-basic)
