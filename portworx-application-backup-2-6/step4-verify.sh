if [ `kubectl -n mysql-app describe  applicationbackupschedules.stork.libopenstorage.org backupschedule | grep "Status" | egrep -i 'Successful|inprogress' | wc -l ` -eq 1 ] 
	then echo "done"
fi
