PX_POD=$(kubectl get pods -l name=portworx -n kube-system -o jsonpath='{.items[0].metadata.name}')
if [[ `kubectl exec $PX_POD -n kube-system -- /opt/pwx/bin/pxctl status | grep Status: | grep -i operational` ]]
then
	echo "done"
fi
