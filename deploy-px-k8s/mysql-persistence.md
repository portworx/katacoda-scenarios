In this step, we will simulate failure of an application by deleting the mysql pod.

### Delete the mysql pod
```
POD_TO_DELETE=`kubectl get pods -l app=mysql -o wide | grep -v NAME | awk '{print $1}'`

echo "Deleting mysql pod: ${POD_TO_DELETE}"

kubectl delete pod ${POD_TO_DELETE}
```{{execute HOST1}}

### Verify replacement pod starts running

```
kubectl get pods -l app=mysql -o wide
```{{execute HOST1}}

### Verify data

```
POD=`kubectl get pods -l app=mysql | grep -v Running | awk '{print $1}'`
sleep 2
kubectl exec -it $POD bash

mysql --user=root --password=mysql123
show databases;
use pxdemo;
show tables;
quit;
exit
```{{execute HOST1}}

Observe that the database tables is persisted !