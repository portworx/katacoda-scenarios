In this step, we will deploy a `PersistentVolumeClaim` which will be used by mysql to storage it's persistent database.

### Step: Deploy StorageClass

```
kubectl create -f mysql-sc.yaml
```{{execute HOST1}}

### Step: Deploy PersistentVolumeClaim

```
kubectl create -f mysql-pvc.yaml

echo "Checking if the PersistentVolumeClaim was created successfully..."

while true; do
    PVC_STATUS=`kubectl get pvc px-mysql-pvc | grep -v NAME | awk '{print $2}'`
    if [ "${PVC_STATUS}" == "Bound" ]; then
        echo "px-mysql-pvc is ${PVC_STATUS} !"
        kubectl get pvc px-mysql-pvc
        break
    else
        echo "Waiting for px-mysql-pvc to be Bound..."
    fi
    sleep 2
done
```{{interrupt execute}}


### Step: Inspect the portworx volume

```
VOL=`kubectl get pvc | grep px-mysql-pvc | awk '{print $3}'`
PX_POD=$(kubectl get pods -l name=portworx -n kube-system -o jsonpath='{.items[0].metadata.name}')
kubectl exec $PX_POD -n kube-system -- /opt/pwx/bin/pxctl inspect ${VOL}
```{{execute}}

