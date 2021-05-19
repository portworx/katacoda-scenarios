if [[ `kubectl get rules.stork.libopenstorage.org  mysql-presnap-rule -o=jsonpath='{.rules[].actions[].value}'  | grep "mysql --user=root --password=\$MYSQL_ROOT_PASSWORD" | grep "flush tables with read lock"` ]]; 
then         
	echo "done"; 
fi
