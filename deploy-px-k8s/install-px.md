PX can be deployed with a single command in Kubernetes as a DaemonSet.

### Step: Fetch the Portworx spec

```
K8S_VERSION=`kubectl version --short | grep Server | awk '{print $3}'` && 
curl -s -o px-spec.yaml "http://install.portworx.com?c=katacoda-demo&k=etcd://master:4001&kbVer=${K8S_VERSION}&drives=/dev/vdb"
```{{execute}}

### Step: Apply the spec

```
kubectl apply -f px-spec.yaml
```{{execute T1}}

### Step: Wait till PX pods are ready

```
kubectl get pods -n kube-system -l name=portworx -o wide

while true; do
    NUM_READY=`kubectl get pods -n kube-system -l name=portworx -o wide | grep Running | grep 1/1 | wc -l`
    if [ "${NUM_READY}" == "3" ]; then
        echo "All portworx nodes are ready !"
        kubectl get pods -n kube-system -l name=portworx -o wide
        break
    else
        echo "Waiting for portworx nodes to be ready. Current ready nodes: ${NUM_READY}"
    fi
    sleep 5
done
```{{execute T1}}


### Step: Fetch Portworx cluster status

Portworx ships with a fully features `pxctl` command line that you can use for cluster operations.

Below command executes the `pxctl status` command in one of the Portworx pods to fetch the overall cluster status.

```
PX_POD=$(kubectl get pods -l name=portworx -n kube-system -o jsonpath='{.items[0].metadata.name}')
watch kubectl exec $PX_POD -n kube-system -- /opt/pwx/bin/pxctl status
```{{interrupt execute T1}}

*It can take a few seconds for Portworx to complete initialization*