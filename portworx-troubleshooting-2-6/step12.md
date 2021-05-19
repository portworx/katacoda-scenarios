</br>

Now that all 3 PX nodes are online, re-create the `gamma` application. Check the status of the PVC and Pods in the `gamma` namespace. The PVC and Pods should have been created.

`kubectl -n gamma get pvc,pods`{{execute}}

If they are still in error state, try re-creating them.

`kubectl delete -f /tmp/gamma-deployment.yaml ; kubectl create -f /tmp/gamma-deployment.yaml`{{execute}}