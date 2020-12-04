if [ `kubectl get pods -l app=cassandra | grep "1/1" | grep -i Running | wc -l` -eq 3 ] 
then
	echo "done"
fi
