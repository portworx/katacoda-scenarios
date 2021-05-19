


##### Q4: Validate that the Pods of the 'portworx' DaemonSet are RUNNING.

`watch kubectl -n kube-system get pods -l name=portworx`{{execute}}


To get back to the terminal:
```clear```{{execute interrupt}}


Note: Wait for all pods to be in a RUNNING state before proceed to the next step.
