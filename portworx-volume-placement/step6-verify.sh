if [[ `kubectl -n mysql-app describe  volumesnapshotrestores.stork.libopenstorage.org  mysql-snap-restore  | grep -i stork | grep -i "Restore completed"` ]] 
then
	echo "done"
fi
