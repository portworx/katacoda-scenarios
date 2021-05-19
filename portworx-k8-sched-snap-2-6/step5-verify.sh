if [ `kubectl describe groupvolumesnapshots.stork.libopenstorage.org cassandra-group-snap | grep -A2 Stage | egrep -i 'Final|Successful' | wc -l` -eq 2]
then
	echo "done"
fi
