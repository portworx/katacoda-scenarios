if [[ `kubectl -n kube-system get pods -l name=portworx | grep 2/2 | grep Running` ]]
then
	echo "done"
fi
