In this step, we will observe High-Availability

### Step: Identify SQL Server Node

First, find out which node is running SQL Server
```
NODE=`kubectl get pods -o wide | grep mssql | awk '{ print $7 }'`
kubectl get pods -o wide | grep mssql
```{{execute T1}}

Then kill the node running SQL Server.

```
ssh $NODE halt
```{{execute T1}}

And verify it's dead.
```
ping -c 15 $NODE
```{{execute T1}}

Verify the database is inaccessible: https://[[HOST_SUBDOMAIN]]-30300-[[KATACODA_HOST]].environments.katacoda.com<br/>
Click the `Run` button and observe that the server is unreachable.
If needed, retype `select count(*) from Employee` in the workspace and Click `Run`.

### Step:  Watch H/A Failover

NOW:  watch how Kubernetes automatically detects the node is down, and then reschedules SQL Server on to another node.
With Stork, this recovery takes no more than 2 minutes, so please be patient to observe in real-time.
```
watch kubectl get pods -o wide
```{{execute T1}}


You will observe the state go from `ContainerCreating` to `Running`
After you observe SQL Server rescheduled and `Running` on another node, go back and rerun the query.
https://[[HOST_SUBDOMAIN]]-30300-[[KATACODA_HOST]].environments.katacoda.com<br/>
Click the `Run` button and observe that the server is reachable and the expected number of rows are returned.

### Step:  Conclusion

You have just observed a real-time failover of SQL Server running not as a cluster with HA-groups, but rather as a single instance.
Note that the same SQL Server instance was available with no reconfiguration of the SQL Server connection.

Configuring multi-server application level clustering is inherently complex.  In this scenario, Kubernetes acts as a load-balancer, and also virtualizes the service port.  

And Portworx provides the high-availability at the data layer.  All data is automatically sync'd by Portworx.  
When Kubernetes detects the failed node and reschedules the SQL Server pod onto another node, all the data is already there, 
by virtue of Portworx multi-node replication.
