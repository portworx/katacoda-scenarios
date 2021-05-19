if [[ `kubectl -n alpha describe pvc px-alpha-pvc | grep px-alpha-sc` ]] && [[ `kubectl -n alpha get deployments mysql | grep 1/1` ]]
	then echo "done"
	fi
