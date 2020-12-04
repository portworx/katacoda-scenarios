if [ `kubectl get pods -l  app=cassandra | grep Running  | grep 1/1 | wc -l` -eq 1 ]
then
	echo "done"
fi
