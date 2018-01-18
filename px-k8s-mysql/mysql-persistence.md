In this step, we will simulate failure of an application by deleting the mysql pod.

### Step: Delete the mysql pod

Below commands get the name of the running mysql pod and delete it.
```
POD_TO_DELETE=`kubectl get pods -l app=mysql -o wide | grep -v NAME | awk '{print $1}'`

echo "Deleting mysql pod: ${POD_TO_DELETE}"

kubectl delete pod ${POD_TO_DELETE}
```{{execute T1}}

Once the mysql pod gets deleted, Kubernetes will start to create a new mysql pod on another node.

### Step: Verify replacement pod starts running

Below commands wait till the new mysql pod is ready.
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
```{{execute T1}}

Now that we have the new mysql pod running, let's check if the database we previously created is still intact.