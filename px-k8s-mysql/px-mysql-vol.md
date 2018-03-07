In this step, we will create a Portworx volume (PVC) for mysql.

### Step: Create StorageClass and PersistentVolumeClaim

Create the storage class using:
```
kubectl create -f px-repl3-sc.yaml
```{{execute T1}}

Create the PersistentVolumeClaim using:
```
kubectl create -f px-mysql-pvc.yaml
```{{execute T1}}

Now that we have the volumes created, let's deploy mysql !