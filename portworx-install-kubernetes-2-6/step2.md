Let's set up a Portworx cluster. To do this, we will make use of an installation URL from central.portworx.com

# 1. Drives: The drive /dev/vdb is available on each node.
# 2. KVDB: We will be using the Portworx Built-in KVDB.
# 3. Create the Portworx cluster. 


Once the YAML file is updated, run the below command to install:

`kubectl apply -f 'https://install.portworx.com/2.6?mc=false&kbver=1.18.0&b=true&s=%2Fdev%2Fvdb&c=my-px-cluster&stork=true&st=k8s'`{{execute}}

Note: It can take a few minutes for the cluster to be Ready! Check that Portworx pods are running before you proceed to the next question.
`kubectl get pods -o wide -n kube-system -l name=portworx`{{execute}}

Check the installation logs:
`PX_POD=$(kubectl get pods -l name=portworx -n kube-system -o jsonpath='{.items[0].metadata.name}'); kubectl -n kube-system logs -f $PX_POD`{{execute}}

To exit out of the logs, press (CTRL+C)


Warning: If the Portworx cluster is set up with an incorrect px-spec.yaml file, a cleanup would be needed before you attempt to re-install!

Refer: [Uninstall Portworx on K8s](/https://docs.portworx.com/portworx-install-with-kubernetes/operate-and-maintain-on-kubernetes/uninstall/uninstall/)
