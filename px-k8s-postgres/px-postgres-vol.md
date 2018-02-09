In this step, we will create a Portworx volume (PVC) for postgres.

### Step: Create StorageClass and PersistentVolumeClaim

Create the storage class using:
```
kubectl create -f px-repl3-sc.yaml
```{{execute T1}}

Create the PersistentVolumeClaim using:
```
kubectl create -f px-postgres-pvc.yaml
```{{execute T1}}

Now that we have the volumes created, let's deploy postgres !
