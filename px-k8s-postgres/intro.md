[Portworx](https://portworx.com/) is a software defined persistent storage solution designed and purpose built for applications deployed as containers, via container orchestrators such as Kubernetes, Marathon and Swarm. It is a clustered block storage solution and provides a Cloud-Native layer from which containerized stateful applications programmatically consume block, file and object storage services directly through the scheduler.

In this tutorial, you will learn how to deploy PostgreSQL to Kubernetes and use Portworx Volumes to provide HA capability:
* Use the Portworx Storage Class to create a PVC with 3 replicas of the data
* Use a simple YAML file to deploy PostgreSQL using this storage class
* How to validate data persistence by deleting the PostgreSQL pod

### High Level Overview

First we will deploy PostgreSQL with replication factor of 3 and with io_profile=db. To learn more about io_profile settings please visit our [docs page](https://docs.portworx.com/maintain/performance/tuning.html#volume-granular-performance-tuning).

![alt text](https://github.com/fmrtl73/katacoda-scenarios-1/blob/master/px-k8s-postgres/images/postgres-image1.png?raw=true "PostgreSQL using PX Volume")

Then we're going run a benchmark to create 5,000,000 rows in the database. Before simulating a server failure by deleting the pod running PostgreSQL.

![alt text](https://github.com/fmrtl73/katacoda-scenarios-1/blob/master/px-k8s-postgres/images/simulate-server-failure.png?raw=true "Simulate Server Failure")

Finally, when the pod come back up Portworx works with the Kubernetes scheduler to make sure it gets scheduled where the data is available.

![alt text](https://github.com/fmrtl73/katacoda-scenarios-1/blob/master/px-k8s-postgres/images/end-state.png?raw=true "Postgres Pod is reattached to it's data")


To learn more about how to drive hyper-convergence please take a look at our Intelligent Storage Orchestration for Kubernetes: [STORK open source project](https://portworx.com/stork-storage-orchestration-kubernetes/).

This scenario assumes you have already covered the following scenarios:
* [How to install Portworx on Kubernetes](https://www.katacoda.com/portworx/scenarios/deploy-px-k8s)
* [How to create Portworx volumes on Kubernetes](https://www.katacoda.com/portworx/scenarios/px-k8s-vol-basic)
