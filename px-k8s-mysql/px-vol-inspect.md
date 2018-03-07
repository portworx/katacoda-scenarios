In this step, we will use pxctl to inspect the volume

### Step: Inspect the Portworx volume

Portworx ships with a [pxctl](https://docs.portworx.com/control/status.html) command line that can be used to manage Portworx.

Below we will use pxctl to inspect the underlying volume for our PVC.

```
VOL=`kubectl get pvc | grep px-mysql-pvc | awk '{print $3}'`
PX_POD=$(kubectl get pods -l name=portworx -n kube-system -o jsonpath='{.items[0].metadata.name}')
kubectl exec -it $PX_POD -n kube-system -- /opt/pwx/bin/pxctl volume inspect ${VOL}
```{{execute T1}}

Make the following observations in the inspect output
* `State` indicates the volume is attached and shows the node on which it is attached. This is the node where the Kubernetes pod is running.
* `HA` shows the number of configured replcas for this volume
* `Labels` show the name of the PVC for this volume
* `Replica sets on nodes` shows the px nodes on which volume is replicated

Now that we have mysql up, let's proceed to creating a sample database!
