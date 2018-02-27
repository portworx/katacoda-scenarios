Let's first wait for Kubernetes and Portworx to be ready.

### Step: Wait for Kubernetes to be ready

Click the below section which waits for all Kubernetes nodes and Portworx to be ready.
```
./wait4-k8s-px.sh
```{{execute T1}}

And let's make sure `Stork` is enabled for scheduler convergence.
Stork ensures that Kubernetes schedules jobs on nodes, such that
local data access can be achieved for high performance.
For more information, please visit [Stork](https://github.com/libopenstorage/stork)
```
kubectl apply -f pxstork.yaml
```{{execute T1}}

Now that we have both Kubernetes and the Portworx cluster up, let's proceed to the next step !
