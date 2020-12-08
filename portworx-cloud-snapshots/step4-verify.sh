if [ `kubectl describe pvc px-mysql-clone-pvc | grep stork-snapshot | grep -i  "successfully provisioned volume" | wc -l` -eq 1 ]
	then echo "done"
	fi
