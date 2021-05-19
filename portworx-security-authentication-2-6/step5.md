</br>

##### Validate that the Pods of the `portworx` DaemonSet are RUNNING.

`watch kubectl -n kube-system get pods -l name=portworx`{{execute}}


To get back to the terminal:
```clear```{{execute interrupt}}

Note: Wait for all pods to be in a RUNNING state before proceed to the next step.

Next, Disable guest role access. This will ensure only authorized users can create volumes.

Create an admin contenxt
```TOKEN=$(ssh -o strictHostKeyChecking=no node01 pxctl auth token generate --auth-config=/tmp/admin-authconfig.yaml --issuer=example-domain.com  --shared-secret=$PORTWORX_AUTH_SHARED_SECRET --token-duration=1y)```{{execute}}

```ssh -o strictHostKeyChecking=no node01 -- pxctl context create admin --token $TOKEN```{{execute}}

```ssh -o strictHostKeyChecking=no node01 -- pxctl context set admin```{{execute}}

Disable the Guest role
```ssh -o StrictHostKeyChecking=no node01 -- pxctl role update --role-config /tmp/role.json```{{execute}}
