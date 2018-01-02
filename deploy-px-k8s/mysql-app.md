In this step, we will deploy the mysql application using the `PersistentVolumeClaim` created before.

### Step: Deploy mysql

```
echo mysql123 > password.txt
tr --delete '\n' <password.txt >.strippedpassword.txt && mv .strippedpassword.txt password.txt
kubectl create secret generic mysql-pass --from-file=password.txt

kubectl create -f mysql-app.yaml
```{{execute T1}}


### Step: Verify mysql pod is ready

```
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
```{{execute T1}}

### Step: Initialize a sample db

```
POD=`kubectl get pods -l app=mysql | grep Running | grep 1/1 | awk '{print $1}'`
kubectl exec -it $POD bash

mysql --user=root --password=mysql123
create database pxdemo;
use pxdemo;
create table grapevine (counter int unsigned);
show tables;
quit;

exit
```{{execute T1}}
