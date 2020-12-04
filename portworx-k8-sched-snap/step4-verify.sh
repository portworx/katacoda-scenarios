if [ `kubectl get pvc | grep www-web | grep Bound | wc -l` -eq 2 ] 
then
	echo "done"
fi
