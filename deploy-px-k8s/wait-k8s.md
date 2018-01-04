Before installing Portworx, let's ensure Kubernetes is setup.

### Step: Wait till nodes are ready

Click the below section which waits for all Kubernetes nodes to be ready.
```
./k8s-wait-ready.sh
```{{execute T1}}

### Step: List Kubernetes nodes

To list nodes, click: `kubectl get nodes`{{execute T1}}

Let's proceed to the next step !