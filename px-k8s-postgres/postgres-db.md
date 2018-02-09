In this step, we will initialize a sample database in our postgres instance.

### Step: Initialize a sample db

Below commands exec into the postgres pod and create a sample database.

```
POD=`kubectl get pods -l app=postgres | grep Running | grep 1/1 | awk '{print $1}'`
kubectl exec -it $POD bash

postgres --user=root --password=postgres123
create database pxdemo;
use pxdemo;
create table grapevine (counter int unsigned);
show tables;
quit;

```{{execute T1}}
