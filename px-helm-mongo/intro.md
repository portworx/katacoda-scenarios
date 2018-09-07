[Portworx](https://portworx.com/) is the [cloud native storage](https://portworx.com/cloud-native-storage/) company that enterprises depend on to reduce the cost and complexity of rapidly deploying containerized applications across multiple clouds and on-prem environments. With Portworx, you can manage any database or stateful service on any infrastructure using any container scheduler. You get a single data management layer for all of your stateful services, no matter where they run. 

A popular [Kubernetes storage](https://portworx.com/use-case/kubernetes-storage/) and [persistent storage for Docker](https://portworx.com/use-case/docker-persistent-storage/) solution, Portworx is a clustered block storage solution and provides a Cloud-Native layer from which containerized stateful applications programmatically consume block, file and object storage services directly through the scheduler.

In this tutorial, you will learn how to deploy MongoDB to Kubernetes using Helm and Portworx:

### Step: Deploy Helm to our Kubernetes cluster

In this step we will show you how to deploy Helm to your Kubernetes cluster. [Helm](https://helm.sh/) helps you manage Kubernetes applications — Helm Charts helps you define, install, and upgrade even the most complex Kubernetes application. Charts are easy to create, version, share, and publish — so start using Helm and stop the copy-and-paste madness.

### Step: Deploy MongoDB using Helm with the Portworx Storage Class

Once Helm is deployed we will use it to deploy the [MongoDB chart](https://github.com/kubernetes/charts/tree/master/stable/mongodb). In order to provide for a highly available MongoDB instance, we will configure the chart to use a Portworx volume that we will create to ensure 3 replicas of the data. Portworx will perform synchronous replication of the volume so that the MongoDB data is well protected. Once MongoDB is deployed we will use the MongoDB client to create some data.

This diagram illustrates the configuration:

<img src="https://docs.google.com/a/portworx.com/drawings/d/e/2PACX-1vSvx983Y0q1B6gZY-4BzFNKQ_u7hdIAw25hDDQpbVaobR9ny17ZsbWgsGFTsMehrKXVxFSqaSTfzpvv/pub?w=574&h=316" alt="MongoDB using PX Volume" style="width: 600px;"/>

### Step: Perform a failover test

In this step we will simulate a node failure to show how Kubernetes can reschedule your MongoDB pod to run on another node in your cluster. Portworx is able to ensure that the rescheduled pod connects to it data from anywhere in the cluster but goes a step further by ensuring that the pod will be scheduled on a node which has a local copy of the data so that you get the best level of performance. This advanced orchestration of stateful workloads is handled by the [STorage ORchestrator for Kubernetes (STORK)](https://github.com/libopenstorage/stork/).

This diagram illustrates the failover scenario:

<img src="https://docs.google.com/a/portworx.com/drawings/d/e/2PACX-1vR-5wReBuEcREJSqx56YPljRMcfcrh9DVmKf-au5O8nxMo8gTTD9r7kDrT7H8fJdzIWmaLMYdo4yv_f/pub?w=574&h=316" alt="MongoDB failover test" style="width: 600px;"/>

### Step: Expand the volume used by MongoDB

In this step we will show how Portworx volumes can be dynamically expanded with zero downtime. Portworx are thinly provisioned and the size of the PVC is used as a maximum size. Once you reach this upper limit on the size of your MongoDB database you can easily perform this operation to add more capacity to your volume.

This diagram illustrates the expansion of your volume:

<img src="https://docs.google.com/a/portworx.com/drawings/d/e/2PACX-1vRj5Zem3GryHT4CaNTSygPXzGxiSF8I3zXwA_FMIsQqKMV_urgGmbiq0rTCLU3zR32fnrWTz15dXClg/pub?w=574&h=316" alt="Expanding volumes" style="width: 600px;"/>


### Step: Take a snapshot and restore it

In this final step we will show how snapshots can be used with MongoDB volumes. Snapshots are efficient point-in-time copies of volumes that can be either read-write or read-only. Each snapshot is a volume in its own right and can be used freely by applications. They are implemented using a copy-on-write technique, so that they only use space in places where they differ from their parent volume.

This diagram illustrates the expansion of your volume:

<img src="https://docs.google.com/a/portworx.com/drawings/d/e/2PACX-1vTkypXWifFiO8ToBpNardHsM5W-qrVbMJ4XFlSPbdUId6eg8NzjWlOO9DM0M6O1myk1DA7I2VoPj785/pub?w=574&h=316" alt="Expanding volumes" style="width: 600px;"/>

### Other things you should know

To learn more about how why running Mongo on Portworx is a great idea take a look at the following links:
* [Kubernetes MongoDB](https://portworx.com/ha-mongodb-kubernetes/) tutorial
* [HA MongoDB on GKE](https://portworx.com/run-ha-mongodb-gke/)
* [HA MongoDB on EKS](https://portworx.com/run-ha-mongodb-amazon-eks/)
* [HA MongoDB on AKS](https://portworx.com/run-ha-mongodb-aks/)
* [HA MongoDB on OpenShift](https://portworx.com/run-ha-mongodb-red-hat-openshift/)
* [Introduction to Portworx](https://portworx.com/products/introduction/)
* [Customer Stories](https://portworx.com/customers/)


This scenario assumes you have already covered the following scenarios:
* [How to install Portworx on Kubernetes](https://www.katacoda.com/portworx/scenarios/deploy-px-k8s)
* [How to create Portworx volumes on Kubernetes](https://www.katacoda.com/portworx/scenarios/px-k8s-vol-basic)
