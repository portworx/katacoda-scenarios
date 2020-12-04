if [[ `kubectl describe  volumesnapshot mysql-snap -n mysql-app | grep -i "Snapshot created successfully"` ]]
then
	echo "done"
fi
