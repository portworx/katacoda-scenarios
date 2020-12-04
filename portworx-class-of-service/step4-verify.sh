if [ `kubectl get pods -l app=nginx | grep -i Running | grep 1/1 | wc -l` -eq 2 ] 
then
	echo "done"
fi
