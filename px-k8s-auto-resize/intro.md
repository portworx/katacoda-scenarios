[Portworx](https://portworx.com/) is the [cloud native storage](https://portworx.com/cloud-native-storage/) company that enterprises depend on to reduce the cost and complexity of rapidly deploying containerized applications across multiple clouds and on-prem environments. With Portworx, you can manage any database or stateful service on any infrastructure using any container scheduler. You get a single data management layer for all of your stateful services, no matter where they run. 

A popular [Kubernetes storage](https://portworx.com/use-case/kubernetes-storage/) and [Docker persistent storage](https://portworx.com/use-case/docker-persistent-storage/) solution, Portworx is a clustered block storage solution and provides a Cloud-Native layer from which containerized stateful applications programmatically consume block, file and object storage services directly through the scheduler.

## AutoPilot Tutorial

In this tutorial, you will learn how to let Portworx AutoPilot automatically resize PVCs based on Prometheus Metrics
* Use the Portworx Storage Class to create a PVC with 3 replicas of the data
* Use a simple YAML file to deploy PostgreSQL using this storage class
* Create an AutoPilot Rule that will scale the PVC by 200% once a PVC is greater than 20% filled.
* Use pgbench to fill up the volume and watch AutoPilot resize the volume automatically.

### High Level Overview

- Note that this demo is using Prometheus. [AutoPilot](https://2.2.docs.portworx.com/portworx-install-with-kubernetes/autopilot/) and [Prometheus](https://2.2.docs.portworx.com/portworx-install-with-kubernetes/operate-and-maintain-on-kubernetes/monitoring/monitoring-px-prometheusandgrafana.1/) come pre-installed in the environment.

- Then we will deploy PostgreSQL with replication factor of 3 and with io_profile=db. To learn more about io_profile settings please visit our [docs page](https://docs.portworx.com/install-with-other/operate-and-maintain/performance-and-tuning/tuning/#global-performance-tuning).

- Then we're going create an AutoPilot Rule that will scale the PVC by 200% once a PVC is greater than 20% filled.

- Then we're going run a benchmark to fill up the database to more than 20%

- Finally, we verify AutoPilot successfully triggered the automated resize of our PVC from 1GB to 3GB


### Other things you should know

To learn more about how why running PostgreSQL on Portworx is a great idea take a look at the following links:
* [Kubernetes Postgres](https://portworx.com/ha-postgresql-kubernetes/) tutorial
* [HA Postgres on GKE](https://portworx.com/run-ha-postgresql-gke/)
* [HA Postgres on EKS](https://portworx.com/postgresql-amazon-eks/)
* [HA Postgres on AKS](https://portworx.com/ha-postgresql-azure-aks/)
* [HA Postgres on OpenShift](https://portworx.com/run-ha-postgresql-red-hat-openshift/)
* [Introduction to Portworx](https://portworx.com/products/introduction/)
* [Customer Stories](https://portworx.com/customers/)
* [STORK open source project](https://portworx.com/stork-storage-orchestration-kubernetes/)


This scenario assumes you have already covered the following scenarios:
* [How to install Portworx on Kubernetes](https://www.katacoda.com/portworx/scenarios/deploy-px-k8s)
* [How to create Portworx volumes on Kubernetes](https://www.katacoda.com/portworx/scenarios/px-k8s-vol-basic)
