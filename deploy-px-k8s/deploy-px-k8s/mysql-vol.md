In this step, we will deploy a `PersistentVolumeClaim` which will be used by mysql to storage it's persistent database.

### Deploy StorageClass

```
kubectl create -f mysql-sc.yaml
```{{execute HOST1}}

### Deploy PersistentVolumeClaim

```
kubectl create -f mysql-pvc.yaml

sleep 2

kubectl get pvc px-mysql-pvc
```{{execute HOST1}}


### Inspect the portworx volume

```
VOL=`kubectl get pvc | grep px-mysql-pvc | awk '{print $3}'`

/opt/pwx/bin/pxctl volume inspect ${VOL}
```{{execute HOST1}}

