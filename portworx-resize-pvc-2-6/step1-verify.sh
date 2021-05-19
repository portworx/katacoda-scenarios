if [[ `kubectl get pvc www-web-0 | grep 8Gi` ]]
then
	echo "done"
fi
