In this step, we will deploy the postgres application using the `PersistentVolumeClaim` created before.

### Step: Create secret for postgres

Below we are creating a Secret to store the postgres password.
```
echo postgres123 > password.txt
tr --delete '\n' <password.txt >.strippedpassword.txt && mv .strippedpassword.txt password.txt
kubectl create secret generic postgres-pass --from-file=password.txt
```{{execute T1}}

### Step: Create secret for postgres
Below we will create a postgres [Deployment](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/) that uses a Portworx PVC.
```
kubectl create -f postgres-app.yaml
```{{execute T1}}

Feel free to ```cat postgres-app.yaml```{{execute T1}} and observe the `volumeMounts` and `volumes` sections where we mount the PVC.

### Step: Verify postgres pod is ready

Below commands wait till the postgres pods are in ready state.
```
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
