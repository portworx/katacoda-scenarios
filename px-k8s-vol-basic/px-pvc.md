In this step, we will deploy a `PersistentVolumeClaim` using Portworx.

### Step: Understand PersistentVolumeClaim

A [PersistentVolumeClaim](https://kubernetes.io/docs/concepts/storage/persistent-volumes/#persistentvolumeclaims) can be used to dynamically create a volume using Portworx. 

For example, below is the spec for a 2GB volume that uses the Portworx Storage class we created before this step.
```yaml
kind: PersistentVolumeClaim
apiVersion: v1
metadata:
   name: px-pvc
   annotations:
     volume.beta.kubernetes.io/storage-class: px-repl3-sc
spec:
   accessModes:
     - ReadWriteOnce
   resources:
     requests:
       storage: 2Gi
```

### Step: Create PersistentVolumeClaim
Let's create the above PersistentVolumeClaim.
```
kubectl create -f px-pvc.yaml
```{{execute T1}}

Behind the scenes, Kubernetes talks to the Portworx native driver to create this PVC. Each PVC has a unique one-one mapping to a [PersistentVolume](https://kubernetes.io/docs/concepts/storage/persistent-volumes/) which is the actual volume backing the PVC.

### Step: Validate PersistentVolumeClaim

A PersistentVolumeClaim is successfully provisioned once it gets into "Bound" state. Let's run the below script to check that.

```
echo "Checking if the PersistentVolumeClaim was created successfully..."

while true; do
    PVC_STATUS=`kubectl get pvc px-pvc | grep -v NAME | awk '{print $2}'`
    if [ "${PVC_STATUS}" == "Bound" ]; then
        echo "px-pvc is ${PVC_STATUS} !"
        kubectl get pvc px-pvc
        break
    else
        echo "Waiting for px-pvc to be Bound..."
    fi
    sleep 2
done
```{{interrupt execute T1}}

Let's proceed to the next step to further inspect the volume.