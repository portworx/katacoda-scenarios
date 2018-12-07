PX can be deployed with a single command in Kubernetes as a [DaemonSet](https://kubernetes.io/docs/concepts/workloads/controllers/daemonset/).

### Step: Fetch the Portworx spec

```
VER=`kubectl version --short | awk -Fv '/Server Version: /{print $3}'`
curl -L -s -o px-spec.yaml "http://install.portworx.com/2.0?c=px-demo&k=etcd://master:4001&kbVer=${VER}&s=/dev/vdb"
```{{execute T1}}

Observe how we used [query parameters](https://docs.portworx.com/scheduler/kubernetes/install.html#generating-the-spec) in the curl command to customize our spec.

In our comamnd:
- `c=px-demo` specifies the cluster name
- `k=etcd://master:4001` specifies the etcd
- `kbVer=${VER}` specifies the Kubernetes version
- `s=/dev/vdb` specifies the block device to use

### Step: Apply the Portworx spec

```
kubectl apply -f px-spec.yaml
```{{execute T1}}

### Step: Wait till Portworx pods are ready

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

*It can take a few seconds for Portworx to complete initialization*

### Step: Fetch Portworx cluster status

Portworx ships with a `pxctl` command line that you can use for managing Portworx.

Below command executes the `pxctl status` command in one of the Portworx pods to fetch the overall cluster status.

```
PX_POD=$(kubectl get pods -l name=portworx -n kube-system -o jsonpath='{.items[0].metadata.name}')

watch --color kubectl exec -it $PX_POD -n kube-system -- /opt/pwx/bin/pxctl status
```{{interrupt execute}}

We now have a 3-node Portworx cluster up ! 

Let's dive into our cluster status.
- All 3 nodes are online and use Kubernetes node names as the Portworx node IDs.- Observe that Portworx clustered the 20GB block device from each node in a 60GB storage cluster.
- Portworx detected the block device media type as magnetic and created a storage pool for this. If you have different types of devices, for example SSD, a different storage pool is created for the SSD type.
