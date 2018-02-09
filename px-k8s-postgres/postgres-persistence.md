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
kubectl get pods -l app=postgres -o wide

while true; do
    NUM_READY=`kubectl get pods -l app=postgres -o wide | grep Running | grep 1/1 | wc -l`
    if [ "${NUM_READY}" == "1" ]; then
        echo "postgres is ready !"
        break
    else
        echo "Waiting for postgres to be ready..."
        kubectl get pods -l app=postgres -o wide
    fi
    sleep 5
done
```{{execute T1}}

Now that we have the new postgres pod running, let's check if the database we previously created is still intact.
