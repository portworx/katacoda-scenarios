[Portworx](https://portworx.com/) is a software defined persistent storage solution designed and purpose built for applications deployed as containers, via container orchestrators such as Kubernetes, Marathon and Swarm. It is a clustered block storage solution and provides a Cloud-Native layer from which containerized stateful applications programmatically consume block, file and object storage services directly through the scheduler.

In this tutorial, you will learn how to deploy Redis to Kubernetes using Helm and Portworx:

### Step: Deploy Helm to our Kubernetes cluster

In this step we will show you how to deploy Helm to your Kubernetes cluster. [Helm](https://helm.sh/) helps you manage Kubernetes applications — Helm Charts helps you define, install, and upgrade even the most complex Kubernetes application. Charts are easy to create, version, share, and publish — so start using Helm and stop the copy-and-paste madness.

### Step: Deploy Redis using Helm with the Portworx Storage Class

Once Helm is deployed we will use it to deploy the [Redis chart](https://github.com/kubernetes/charts/tree/master/stable/redis). In order to provide for a highly available Redis instance, we will configure the chart to use a Portworx volume that we will create to ensure 3 replicas of the data. Portworx will perform synchronous replication of the volume so that the Redis data is well protected. Once Redis is deployed we will use the Redis client to create some data.

This diagram illustrates the configuration:

<img src="https://docs.google.com/a/portworx.com/drawings/d/e/2PACX-1vSBoUJVXg1Nxl2ortJOt2Y1vv7hmtkCghsEGmY13VtQarH8esyYhjxkORsROl6FqUYk5gflqsdAJpUa/pub?w=574&h=316" alt="Redis using PX Volume" style="width: 600px;"/>

### Step: Perform a failover test

In this step we will simulate a node failure to show how Kubernetes can reschedule your Redis pod to run on another node in your cluster. Portworx is able to ensure that the rescheduled pod connects to it data from anywhere in the cluster but goes a step further by ensuring that the pod will be scheduled on a node which has a local copy of the data so that you get the best level of performance. This advanced orchestration of stateful workloads is handled by the [STorage ORchestrator for Kubernetes (STORK)](https://github.com/libopenstorage/stork/).

This diagram illustrates the failover scenario:

<img src="https://docs.google.com/a/portworx.com/drawings/d/e/2PACX-1vT9vMg0J6GF_SNa7Z2IL-GhgVVMwzUlmsyH117vYJKRPtFWI9VQ0IT5rmvqKw57NhMFhL1CiL8cvp7t/pub?w=574&h=316" alt="Redis failover test" style="width: 600px;"/>

### Step: Expand the volume used by Redis

In this step we will show how Portworx volumes can be dynamically expanded with zero downtime. Portworx are thinly provisioned and the size of the PVC is used as a maximum size. Once you reach this upper limit on the size of your Redis database you can easily perform this operation to add more capacity to your volume.

This diagram illustrates the expansion of your volume:

<img src="https://docs.google.com/a/portworx.com/drawings/d/e/2PACX-1vRRMNJaUHTpGCcWbBeXDfD6SiEuzZvH5SAIY0EUBF07LH3rzLUXfARt9Rscv5u08zGl1eTD6VP40NRf/pub?w=574&h=316" alt="Expanding volumes" style="width: 600px;"/>


### Step: Take a snapshot and restore it

In this final step we will show how snapshots can be used with Redis volumes. Snapshots are efficient point-in-time copies of volumes that can be either read-write or read-only. Each snapshot is a volume in its own right and can be used freely by applications. They are implemented using a copy-on-write technique, so that they only use space in places where they differ from their parent volume.

This diagram illustrates the expansion of your volume:

<img src="https://docs.google.com/a/portworx.com/drawings/d/e/2PACX-1vQt97zPhrl50bkgOc9aAPVv6M8sweahrnwNgHfpNkMA5X3YjSVZN9Xr4ShCm55nNZvitprzOviIpy3c/pub?w=574&h=316" alt="Expanding volumes" style="width: 600px;"/>

### Other things you should know

To learn more about how why running Mongo on Portworx is a great idea take a look at the following links:
* [Introduction to Portworx](https://portworx.com/products/introduction/)
* [Customer Stories](https://portworx.com/customers/)


This scenario assumes you have already covered the following scenarios:
* [How to install Portworx on Kubernetes](https://www.katacoda.com/portworx/scenarios/deploy-px-k8s)
* [How to create Portworx volumes on Kubernetes](https://www.katacoda.com/portworx/scenarios/px-k8s-vol-basic)
