if [ `kubectl  describe volumesnapshot mysql-snapshot | grep -i "Snapshot created successfully and it is ready" | wc -l ` -eq 1 ] && [[ `kubectl describe volumesnapshot mysql-snapshot | grep snapshot-type | grep  cloud` ]]
then 
		echo "done"
	fi
