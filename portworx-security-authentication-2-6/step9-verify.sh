if [[ `kubectl get pvc auth-pvc | grep -i bound` ]] 
then
	echo "done"
fi
