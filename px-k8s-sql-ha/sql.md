In this step, we will deploy SQL Server. 

### Step: Make sure Portworx is up
Portworx doesn't run on the K8s master, so we'll check from one of the minions.

```
PX_POD=$(kubectl get pods -l name=portworx -n kube-system -o jsonpath='{.items[0].metadata.name}')
kubectl exec -it $PX_POD -n kube-system -- /opt/pwx/bin/pxctl status
```{{execute T1}}

### Step: Deploy SQL Server with Storage on-demand

Let's create SQL Server and wait for it to be ready
```
kubectl create -f sqlserver-all.yaml
./wait4-mssql.sh
kubectl get pods
```{{execute T1}}

### Step:  Observe the Portworx Volume

```
kubectl get pvc
```{{execute T1}}

Note that the `HA` for the volume is `3`, meaning that the volume is replicated 
on all 3 nodes in the cluster.

Now let's dig into the Kubernetes details
```
kubectl describe storageclass px-mssql-sc
kubectl describe pvc mssql-data
```{{execute T1}}

Look carefully and you can see how the Portworx volume name cross references with the PVC name.

### Step: Load SQL Server with Sample Data
This loads the some sample data into SQL Server.

First let's get the sample data from S3 and copy 
the sample data into the container.
```
wget https://s3.us-east-2.amazonaws.com/px-mssql-adventureworks/IndexInternals2008.bak
POD=`kubectl get pods | grep mssql | awk '{print $1}'`
kubectl cp IndexInternals2008.bak $POD:/root/IndexInternals2008.bak
```{{execute T1}}

Then, let's import the data into the database

```
kubectl exec -it $POD -- '/opt/mssql-tools/bin/sqlcmd' -S localhost -U SA -P "P@ssw0rd" -Q "RESTORE DATABASE [IndexInternals2008] FROM DISK = '/root/IndexInternals2008.bak' WITH Move 'IndexInternalsData' to '/var/opt/mssql/data/IndexInternalsData.mdf', move 'IndexInternalsLog' to '/var/opt/mssql/data/IndexInternalsLog.ldf'"
```{{execute T1}}

It takes a minute or so to load, so please be patient ...
