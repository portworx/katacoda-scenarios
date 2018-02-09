In this step, we will initialize a sample database in our postgres instance.

### Step: Open a shell inside the postgres container

Below commands exec into the postgres pod:

```
POD=`kubectl get pods -l app=postgres | grep Running | grep 1/1 | awk '{print $1}'`
kubectl exec -it $POD bash
```{{execute T1}}

Next we can launch the psql utility and create a database
```
psql
create database pxdemo;
\l
\q
```{{execute T1}}

### Step: Run pgbench init to create some tables

Run pgbench 
```
pgbench -i -s 50 pxdemo;
```{{execute T1}}

Take a look at the tables and exit out of the container.
```
psql
\c pxdemo
\dt
\q
exit
```{{execute T1}}
