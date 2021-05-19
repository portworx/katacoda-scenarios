# Portworx Volumes Lab. Explore existing volumes, create and update new volumes.

In this lab,  we will explore the learn how to show and inspect volumes using pxctl. We will then create new volumes, attach them to a host and copy data in to the volume.

This lab focuses on providing Security Enabled RBAC for Kubernetes namespaces. Each namespace must use a project (namespace) specific key in order to be able to create and manage Portworx volumes.

https://2.6.docs.portworx.com/portworx-install-with-kubernetes/storage-operations/csi/#supported-features

You can apply similar methods for when you want project specific RBAC + PVC-level Encryption Keys.
https://2.6.docs.portworx.com/key-management/kubernetes-secrets/pvc-encryption-using-csi/#encrypt-your-volumes-per-pvc  

