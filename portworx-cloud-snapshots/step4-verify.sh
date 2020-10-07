if [ `kubectl describe pvc px-mysql-clone-pvc | grep stork-snapshot | grep -i  "successfully provisioned volume" | wc -l` -eq 0 ]
	then echo "done"
	fi
