In this lab, we have a kubernetes cluster running Portworx with PX-Security enabled. 

This lab focuses on providing Security Enabled RBAC for Kubernetes namespaces. Each namespace must use a project (namespace) specific key in order to be able to create and manage Portworx volumes.

https://2.6.docs.portworx.com/portworx-install-with-kubernetes/storage-operations/csi/#supported-features

You can apply similar methods for when you want project specific RBAC + PVC-level Encryption Keys.
https://2.6.docs.portworx.com/key-management/kubernetes-secrets/pvc-encryption-using-csi/#encrypt-your-volumes-per-pvc  

We will make use of the concepts that we learned in the previous lectures and labs to secure a storage class by making use of a JWT token.

Note: This is a CSI Enabled Portworx cluster.
</br>
##### Portworx is currently being re-installed with CSI and Security enabled. Please wait for all pods to be updated. To check the status, click on the below command and wait for all Pods to have "2/2" ready containers:

`watch kubectl -n kube-system get pods -l name=portworx`{{execute}}


To get back to the terminal:
```clear```{{execute interrupt}}

Note: You cannot proceed to the next question until Portworx is Ready!
