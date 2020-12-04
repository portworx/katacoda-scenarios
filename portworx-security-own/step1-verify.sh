if [ `kubectl -n kube-system describe secret pxkeys | egrep 'system-secret|shared-secret|stork-secret' | wc -l` -eq 3 ] 
then
	echo "done"
fi
