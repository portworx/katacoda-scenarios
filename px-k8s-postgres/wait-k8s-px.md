Let's first wait for Kubernetes and Portworx to be ready.

### Step: Wait for Kubernetes to be ready

Click the below section which waits for all Kubernetes nodes to be ready.
```
./k8s-wait-ready.sh
```{{execute T1}}

### Step: Wait for Portworx to be ready

Watch the Portworx pods and wait for them to be ready on all the nodes. This can take a few minutes since it involves pulling multiple docker images. 

```
watch kubectl get pods -n kube-system -l name=portworx -o wide
```{{execute T1}}

When all the pods show status Running then you can ```crtl-c```{{execute interrupt}} out of the watch.

Now that we have the Portworx cluster up, let's proceed to the next step !
