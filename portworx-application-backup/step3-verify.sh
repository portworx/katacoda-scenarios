if [[ `kubectl describe applicationbackup.stork.libopenstorage.org backup  -n mysql-app | grep -i "Backup successful for volume"` ]]
	then echo "done"
	fi
