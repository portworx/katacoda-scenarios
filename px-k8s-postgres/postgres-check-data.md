In this step, we will check the state of our sample postgres database.

### Step: Verify data

Below commands exec into the running postgres pod and dump our sample database.

```
POD=`kubectl get pods -l app=postgres | grep Running | grep 1/1 | awk '{print $1}'`
kubectl exec -it $POD bash

postgres --user=root --password=postgres123
show databases;
use pxdemo;
show tables;
quit;

```{{execute T1}}

Observe that the database table is persisted !
