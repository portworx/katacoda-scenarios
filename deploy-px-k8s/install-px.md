PX can be deployed with a single command in Kubernetes as a DaemonSet.

### Step: Fetch the Portworx spec

```
K8S_VERSION=`kubectl version --short | grep Server | awk '{print $3}'` &&
IP=$(hostname -I | awk '{print $1}') &&
curl -o px-spec.yaml "http://install.portworx.com?cluster=katacoda-demo&kvdb=etcd://${IP}:4001&k8sVersion=${K8S_VERSION}&master=true&drives=/dev/loop18"
```{{execute HOST1}}

### Step: Apply the spec

```
kubectl apply -f px-spec.yaml
```{{execute HOST1}}

### Step: Wait till PX pods are ready

`watch kubectl get pods -n kube-system -l name=portworx -o wide`{{execute HOST1}}

*Hit Control + C to stop the command once pods are in Ready (1/1) state*

### Step: Fetch Portworx cluster status with pxctl

`watch /opt/pwx/bin/pxctl status`{{execute HOST2}}

*It can take a few seconds for Portworx to complete initialization*