Now we have a cluster secret set we can use it to secure a StorageClass.

### Step: Create a secure StorageClass
Let's create a new StorageClass. First take a look at the StorageClass yaml.
```
echo "$(cat px-secure-sc.yaml)"
```{{execute T1}}

You'll see we're using the `secure: "true"` parameter. This will ensure that this StorageClass will look for the default secret name `px-vol-encryption` and use this key to encrypt volumes from PVCs that use this StorageClass. 

Now apply the spec to create the StorageClass.

```
kubectl apply -f px-secure-sc.yaml
```{{execute T1}}

### Step: Create a PVC
We can now create a PVC that uses our secure StorageClass. Take a look at the PVC spec.
```
echo "$(cat px-secure-pvc.yaml)"
```{{execute T1}}

You'll notice that we're referencing our previously created secure StorageClass `storageClassName: px-secure-sc`. This ensures any volumes created will be encrypted.

Apply the PVC spec.

```
kubectl apply -f px-secure-pvc.yaml
```{{execute T1}}

Finally check the volume is encrypted.

```
PX_POD=$(kubectl get pods -l name=portworx -n kube-system -o jsonpath='{.items[0].metadata.name}')
kubectl exec $PX_POD -n kube-system -- /opt/pwx/bin/pxctl volume list
```{{execute T1}}