
First, we need to wait for Kubernetes and Portworx to be ready. Be patient, this is not a very high performance environment, just a place to learn something.

### Step: Wait for Kubernetes to be ready

Click the below section which waits for all Kubernetes nodes to be ready.
```
watch kubectl get nodes
```{{execute T1}}

When all 4 nodes show status Running then hit ```clear```{{execute interrupt}} to ctrl-c and clear the screen.

### Step: Wait for Portworx to be ready

Watch the Portworx pods and wait for them to be ready on all the nodes. All nodes in the below command output should show `1/1`.

```
watch kubectl get pods -n kube-system -l name=portworx -o wide
```{{execute T1}}

When all the pods show STATUS Running and READY 1/1 then hit ```clear```{{execute interrupt}} to ctrl-c and clear the screen.
