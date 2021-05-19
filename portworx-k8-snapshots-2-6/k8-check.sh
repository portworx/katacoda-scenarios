if [ `kubectl -n mysql-app  get pods -l app=mysql | grep Running | grep 1/1 | wc -l ` -eq 1 ] 
then
	echo "done"
fi

