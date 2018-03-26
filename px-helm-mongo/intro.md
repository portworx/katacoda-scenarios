[Portworx](https://portworx.com/) is a software defined persistent storage solution designed and purpose built for applications deployed as containers, via container orchestrators such as Kubernetes, Marathon and Swarm. It is a clustered block storage solution and provides a Cloud-Native layer from which containerized stateful applications programmatically consume block, file and object storage services directly through the scheduler.

In this tutorial, you will learn how to deploy MongoDB to Kubernetes using Helm and Portworx:

### Step: Deploy Helm to our Kubernetes cluster

In this step we will show you how to deploy Helm to your Kubernetes cluster. [Helm](https://helm.sh/) helps you manage Kubernetes applications — Helm Charts helps you define, install, and upgrade even the most complex Kubernetes application. Charts are easy to create, version, share, and publish — so start using Helm and stop the copy-and-paste madness.

### Step: Deploy MongoDB using Helm with the Portworx Storage Class

Once Helm is deployed we will use it to deploy the [MongoDB chart](https://github.com/kubernetes/charts/tree/master/stable/mongodb). In order to provide for a highly available MongoDB instance, we will configure the chart to use a Portworx volume that we will create to ensure 3 replicas of the data. Portworx will perform synchronous replication of the volume so that the MongoDB data is well protected. Once MongoDB is deployed we will use the MongoDB client to create some data.

This diagram illustrates the configuration:

<img src="https://docs.google.com/a/portworx.com/drawings/d/e/2PACX-1vRZSNHELVPsgfYcJvm8rKgfEAM8cdNJt2hT9gkgqRhWbCTjVDcdaUsG4kPokf2rVXOM67Gcp3omlkFz/pub?w=858&h=401" alt="MongoDB using PX Volume" style="width: 600px;"/>

### Step: Perform a failover test

In this step we will simulate a node failure to show how Kubernetes can reschedule your MongoDB pod to run on another node in your cluster. Portworx is able to ensure that the rescheduled pod connects to it data from anywhere in the cluster but goes a step further by ensuring that the pod will be scheduled on a node which has a local copy of the data so that you get the best level of performance. This advanced orchestration of stateful workloads is handled by the [STorage ORchestrator for Kubernetes (STORK)](https://github.com/libopenstorage/stork/).

This diagram illustrates the failover scenario:

<img src="https://docs.google.com/a/portworx.com/drawings/d/e/2PACX-1vRsekufq2iAPuoDuobQmlAJ5MrMMCFgmHo2aL_q_9Ndc0k_W0mnb9UqKUIHAPosBA-ThKdK1UkvkpBJ/pub?w=858&h=401" alt="MongoDB failover test" style="width: 600px;"/>

### Step: Expand the volume used by MongoDB

In this step we will show how Portworx volumes can be dynamically expanded with zero downtime. Portworx are thinly provisioned and the size of the PVC is used as a maximum size. Once you reach this upper limit on the size of your MongoDB database you can easily perform this operation to add more capacity to your volume.

This diagram illustrates the expansion of your volume:

<img src="https://docs.google.com/a/portworx.com/drawings/d/e/2PACX-1vRPO8qz5a9w1dyINm1hOQTuhUg-iBQ-3uXXvAbCURykW8lRsogH1RvUMZwctcGYUAToQmaXIQXjBlR3/pub?w=858&h=401" alt="Expanding volumes" style="width: 600px;"/>


### Step: Take a snapshot and restore it

In this step we will show how snapshots can be used with MongoDB volumes. Snapshots are efficient point-in-time copies of volumes that can be either read-write or read-only. Each snapshot is a volume in its own right and can be used freely by applications. They are implemented using a copy-on-write technique, so that they only use space in places where they differ from their parent volume.

This diagram illustrates the expansion of your volume:

<img src="https://docs.google.com/a/portworx.com/drawings/d/e/2PACX-1vQJvui6RrEAPX8m8aOg99MpFG5kW3RkpInFEA8-X3KBjaun8uAlNG2OSLat0qrUkQyxYMboJAR1pzAJ/pub?w=858&h=401" alt="Expanding volumes" style="width: 600px;"/>


### Step: Deploying MongoDB Replica Set

In this final step we will show how to deploy a MongoDB replica set using Portworx Volumes. Replica Sets are easy to deploy using helm and each member of the cluster will get it's own Portworx volume dynamically created. By using a replication factor of 2 for these Portworx volumes you will get extra data protection and faster recovery of lost nodes as the data will not have to be rehydrated from the other nodes, minimizing network traffic and recovery times.

This diagram illustrates the MongoDB replica set deployed with Portworx volumes:

<img src="https://docs.google.com/a/portworx.com/drawings/d/e/2PACX-1vTZcVad6xT3WPsle1OC1qmRpsIK0qeM5nJnMPMc6l_AzCpo08toUKwGKyOy_1ACgJq7Txl0qjdSXdt2/pub?w=858&h=401" alt="MongoDB Replica Set" style="width: 600px;"/>

### Other things you should know

To learn more about how why running Mongo on Portworx is a great idea take a look at the following links:
* [Introduction to Portworx](https://portworx.com/products/introduction/)
* [Customer Stories](https://portworx.com/customers/)


This scenario assumes you have already covered the following scenarios:
* [How to install Portworx on Kubernetes](https://www.katacoda.com/portworx/scenarios/deploy-px-k8s)
* [How to create Portworx volumes on Kubernetes](https://www.katacoda.com/portworx/scenarios/px-k8s-vol-basic)
