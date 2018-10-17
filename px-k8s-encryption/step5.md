Now we can create our PVC.

### Step: Creating a secure PVC
Take a look at the PVC spec.

```
echo "$(cat px-secure-pvc2.yaml)"
```{{execute T1}}

You'll notice a set of new parameters.

```
    px/secret-name: volume-secrets
    px/secret-namespace: portworx
    px/secret-key: mysql-pvc
```

Here we are specifying the secret name, the namespace the secret lives in (useful for multiple cluster tenants), and the secret key. These are the values we used in the previous step to create the secret.

You can apply the spec now to provision an encrypted volume.

```
kubectl apply -f px-secure-pvc2.yaml
```{{execute T1}}

If you take a look at the Portworx volume list you'll the new encrypted PVC.

```
PX_POD=$(kubectl get pods -l name=portworx -n kube-system -o jsonpath='{.items[0].metadata.name}')
kubectl exec $PX_POD -n kube-system -- /opt/pwx/bin/pxctl volume list
```{{execute T1}}
