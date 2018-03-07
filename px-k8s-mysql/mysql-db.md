In this step, we will initialize a sample database in our mysql instance.

### Step: Initialize a sample db

Below commands exec into the mysql pod and create a sample database.

```
POD=`kubectl get pods -l app=mysql | grep Running | grep 1/1 | awk '{print $1}'`
kubectl exec -it $POD bash

mysql --user=root --password=mysql123
create database pxdemo;
use pxdemo;
create table grapevine (counter int unsigned);
show tables;
quit;

```{{execute T1}}
