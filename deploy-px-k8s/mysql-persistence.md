In this step, we will simulate failure of an application by deleting the mysql pod.

### Step: Delete the mysql pod
```
POD_TO_DELETE=`kubectl get pods -l app=mysql -o wide | grep -v NAME | awk '{print $1}'`

echo "Deleting mysql pod: ${POD_TO_DELETE}"

kubectl delete pod ${POD_TO_DELETE}
```{{execute HOST1}}

### Step: Verify replacement pod starts running

```
kubectl get pods -l app=mysql -o wide

while true; do
    NUM_READY=`kubectl get pods -l app=mysql -o wide | grep Running | grep 1/1 | wc -l`
    if [ "${NUM_READY}" == "1" ]; then
        echo "mysql is ready !"
        break
    else
        echo "Waiting for mysql to be ready..."
    fi
    sleep 5
done
```{{execute HOST1}}

### Step: Verify data

```
POD=`kubectl get pods -l app=mysql | grep Running | grep 1/1 | awk '{print $1}'`
kubectl exec -it $POD bash

mysql --user=root --password=mysql123
show databases;
use pxdemo;
show tables;
quit;
exit
```{{execute HOST1}}

Observe that the database tables is persisted !