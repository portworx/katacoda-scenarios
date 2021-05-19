Inspect the deployment cloned in the `clone-mysql` namespace.

`kubectl -n clone-mysql get pods`{{execute}}

If the pod is failing, you can try to restart it by deleting the current one.

```kubectl delete po -n clone-mysql -l app=mysql```{{execute}}
