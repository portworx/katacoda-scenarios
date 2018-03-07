In this step, we will use pxctl to inspect the volume

Portworx ships with a [pxctl](https://docs.portworx.com/control/status.html) command line that can be used to manage Portworx.

### Step: List Portworx volumes

Below we will use pxctl to list all Portworx volumes.
```
PX_POD=$(kubectl get pods -l name=portworx -n kube-system -o jsonpath='{.items[0].metadata.name}')
kubectl exec -it $PX_POD -n kube-system -- /opt/pwx/bin/pxctl volume list
```{{execute T1}}

### Step: Inspect the Portworx volume

Below we will use pxctl to inspect the volume that we created.
```
VOL=`kubectl get pvc | grep px-pvc | awk '{print $3}'`
PX_POD=$(kubectl get pods -l name=portworx -n kube-system -o jsonpath='{.items[0].metadata.name}')
kubectl exec -it $PX_POD -n kube-system -- /opt/pwx/bin/pxctl volume inspect ${VOL}
```{{execute T1}}


Make the following observations in the inspect output
* `HA` shows the number of configured replcas for this volume
* `Labels` show the name of the PVC for this volume
* `Replica sets on nodes` shows the px nodes on which volume is replicated
* `State` indicates the volume is detached which means no applications are using the volume yet
