if  [ `kubectl -n kube-system get pods -l name=portworx | grep Running | grep "1/1" | wc -l ` -eq 3 ] 
then 
	echo "done"; 
fi
