[Portworx](https://portworx.com/) is a software defined persistent storage solution designed and purpose built for applications deployed as containers, via container orchestrators such as Kubernetes, Marathon and Swarm. It is a clustered block storage solution and provides a Cloud-Native layer from which containerized stateful applications programmatically consume block, file and object storage services directly through the scheduler.

In this tutorial, you will learn how to create encrypted volumes using Portworx.
* How to set a cluster wide secret key
* Use the Portworx Storage Class encrypt all volumes created from this SC
* Use the Portworx PVC for per-volume encryption
* How to validate data is encrypted

### High Level Overview

First we will validate that we can use Kubernetes secrets to store our keys. Then we will create a cluster wide secret key. Next we will deploy Postgres to validate our encrypted volumes are being created. Finally we will do the same but with per volume encryption.

You can read about secure StorageClasses here: [Encryption using StorageClass](https://docs.portworx.com/scheduler/kubernetes/storage-class-encryption.html)
You can read about secure PVCs here: [Encryption using PVC](https://docs.portworx.com/scheduler/kubernetes/pvc-encryption.html)


### Other things you should know

To learn more about Portworx:
* [Introduction to Portworx](https://portworx.com/products/introduction/)
* [Customer Stories](https://portworx.com/customers/)
* [STORK open source project](https://portworx.com/stork-storage-orchestration-kubernetes/).


This scenario assumes you have already covered the following scenarios:
* [How to install Portworx on Kubernetes](https://www.katacoda.com/portworx/scenarios/deploy-px-k8s)
* [How to create Portworx volumes on Kubernetes](https://www.katacoda.com/portworx/scenarios/px-k8s-vol-basic)