if [[ `kubectl get sc px-secure-sc -o yaml | grep openstorage.io/auth-secret-name | grep px-k8s-user`  ]] &&  [[ `kubectl get sc px-secure-sc -o yaml | grep openstorage.io/auth-secret-namespace | grep portworx` ]]
then
	echo "done"
fi
