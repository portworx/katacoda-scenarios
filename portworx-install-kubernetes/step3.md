Now that we have a working KVDB, let's set up a Portworx cluster. To do this, we will make use of the px-spec.yaml. 

Update the YML file located at /root/px-spec.yaml with the etcd details and drives to be added to the storage pool. Use the spec below:

# 1. Drives: /dev/vdb
# 2. KVDB: Use the ETCD endpoint from the previous step.
# 3. Create the Portworx cluster. 

Note: It can take a few minutes for the cluster to be Ready! Check that Portworx pods are running before you proceed to the next question.
`kubectl get pods -o wide -n kube-system -l name=portworx`{{execute}}

Check the installation logs:
`PX_POD=$(kubectl get pods -l name=portworx -n kube-system -o jsonpath='{.items[0].metadata.name}'); kubectl -n kube-system logs -f $PX_POD`{{execute}}

To exit out of the logs, press (CTRL+C)


Warning: If the Portworx cluster is set up with an incorrect px-spec.yaml file, a cleanup would be needed before you attempt to re-install!

Refer: [Uninstall Portworx on K8s](/https://docs.portworx.com/portworx-install-with-kubernetes/operate-and-maintain-on-kubernetes/uninstall/uninstall/)
