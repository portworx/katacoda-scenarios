We've proven out cluster wide encryption applied to volumes via a StorageClass, but what if you have multiple teams, tenants or lines of business? 

Encryption at Storage Class level does not allow using different secret keys for different PVCs. It also does not provide a way to disable encryption for certain PVCs that are using the same secure storage class. Encryption at PVC level will override the encryption options from Storage Class.

Let's take a look at per volume encryption.

### Step: Create a 'normal' StorageClass
We're going to start by creating a StorageClass that does not use encryption.

Take a look at this SC.

```
echo "$(cat px-sc.yaml)"
```{{execute T1}}

You'll notice there is no secure parameter. Apply the spec now.

```
kubectl apply -f px-sc.yaml
```{{execute T1}}

### Step: Create a new secret to be used with our PVC
In the previous section we used a cluster wide secret with the default secret name. Now we're going to create a custom secret.

```
kubectl -n portworx create secret generic volume-secrets \
  --from-literal=secure-pvc=SuperSecur3Key
```{{execute T1}}

Verify the secret exists.

```
kubectl get secrets -n portworx
```{{execute T1}}