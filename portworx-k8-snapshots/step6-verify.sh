if [[ `kubectl get pvc | grep web-clone-0 | grep stork-snapshot-sc | grep -i bound` ]] 
then
	echo "done"
fi
