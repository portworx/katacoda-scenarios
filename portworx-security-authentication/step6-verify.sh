if [[ `kubectl get pvc test-pvc | grep -i pending` ]] 
then
	echo "done"
fi
