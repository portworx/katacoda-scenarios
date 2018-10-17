We have an encrypted PVC, which is great, but let's validate that we cannot access this encrypted volume directly.

### Step: Validating a secure PVC
We're going to see if we can access the secure PVC directly from the host. We'll mount the Portworx volume directly on the host so we can see if it's possible access the data.

Start by setting the PVC name in an environment variable.

```
PX_VOL=$(kubectl get pvc -o jsonpath='{.items[1].spec.volumeName}')

```{{execute T1}}

The Portworx CLI gives us the ability to attach and mount a Portworx volume directly on the host. Let's see if we can do this with our encrypted volume.

```
ssh -o "StrictHostKeyChecking no" node01 pxctl host attach $PX_VOL
```{{execute T1}}

You will get the following error message.

`attach: crypt_activate returned error with code -1`

The volume cannot be attached as it is encrypted preventing access to the data.