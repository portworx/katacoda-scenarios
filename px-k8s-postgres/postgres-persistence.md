In this step, we will simulate failure of an application by deleting the postgres pod.

### Step: Delete the postgres pod

Below commands get the name of the running postgres pod and delete it.
```
POD_TO_DELETE=`kubectl get pods -l app=postgres -o wide | grep -v NAME | awk '{print $1}'`

echo "Deleting postgres pod: ${POD_TO_DELETE}"

kubectl delete pod ${POD_TO_DELETE}
```{{execute T1}}

Once the postgres pod gets deleted, Kubernetes will start to create a new postgres pod on another node.

### Step: Verify replacement pod starts running

Below commands wait till the new postgres pod is ready.
```
watch kubectl get pods -l app=postgres -o wide
```{{execute T1}}

WHen the pod come back up it will be in the Running state. 

Exit the watch command:

```clear```{{interrupt-execute}}
Now that we have the new postgres pod running, let's check if the database we previously created is still intact.
