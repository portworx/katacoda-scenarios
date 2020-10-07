if [[ `kubectl get pvc | grep www-clone-0 | grep stork-snapshot-sc | grep -i bound` ]] 
then
	echo "done"
fi
