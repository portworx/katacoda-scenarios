[Portworx](https://portworx.com/) is a software defined persistent storage solution designed and purpose built for applications deployed as containers, via container orchestrators such as Kubernetes, Marathon and Swarm. It is a clustered block storage solution and provides a Cloud-Native layer from which containerized stateful applications programmatically consume block, file and object storage services directly through the scheduler.

In this tutorial, you will learn how to deploy PostgreSQL to Kubernetes and use Portworx Shared Volumes:
* Use the Portworx Storage Class to create a shared volume PVC with 3 replicas of the data
* Use a simple YAML file to deploy Busybox using this storage class
* See how the shared volume allows 3 containers to be mounted at the same time and read/write data to the same file

### Shared Volumes Overview

To learn more about how shared volumes can be useful check out our [docs page](https://docs.portworx.com/manage/shared-volumes.html).

This scenario assumes you have already covered the following scenarios:
* [How to install Portworx on Kubernetes](https://www.katacoda.com/portworx/scenarios/deploy-px-k8s)
* [How to create Portworx volumes on Kubernetes](https://www.katacoda.com/portworx/scenarios/px-k8s-vol-basic)
