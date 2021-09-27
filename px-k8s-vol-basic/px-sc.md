In this step, we will create a StorageClass for Portworx volumes.

### Step: Understand StorageClass

A [StorageClass](https://kubernetes.io/docs/concepts/storage/storage-classes/) provides a way for administrators to describe the “classes” of storage on their Kubernetes cluster. Before we create a volume in Kubernetes, we have to create a StorageClass.

For example, the following is a Portworx StorageClass whose volumes have replication factor of 3 and high IO priority.
* Replication factor of 3 means the data for the volume is replicated on 3 different nodes in the cluster
* High IO priority means Portworx will use storage devices that are classified into the high IO profile (for e.g SSDs).

```yaml
kind: StorageClass
apiVersion: storage.k8s.io/v1
metadata:
    name: px-repl3-sc
provisioner: kubernetes.io/portworx-volume
parameters:
   repl: "3"
   priority_io: "high"
```

### Step: Create StorageClass
Let's create the above storage class.
```
kubectl create -f px-repl3-sc.yaml
```{{execute T1}}

Let's proceed to creating volumes that use this storage class.



