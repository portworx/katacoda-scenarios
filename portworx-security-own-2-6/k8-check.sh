if [ `kubectl -n kube-system get pods -l name=portworx | grep Running | grep 2/2 | wc -l ` -eq 3 ] 
then
	echo "done"
fi
