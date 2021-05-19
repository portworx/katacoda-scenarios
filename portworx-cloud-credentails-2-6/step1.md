In this lab, we will make use of Minio object store.

[Minio](https://min.io/) is a distributed object storage server built for cloud applications and devops.

Portworx perfectly compliments Minio object storage by providing an elastic, scalable, container-granular data services fabric underneath the Minio object storage server.

Minio object storage perfectly compliments Portworx by providing a simple object storage service layer on top of Portworx data services.
</br>

**Important Note:** Please wait while we deploy and configure Minio on this Kubernetes cluster. Please be patient. This can take up to 5 minutes.

Once the set-up is complete, you can run the following command to make sure the minio servers are up:

`mc admin info px`{{execute}}
