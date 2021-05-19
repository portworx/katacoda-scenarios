if [[ `kubectl -n beta describe pvc px-beta-pvc | grep px-beta-sc` ]] && [[ `kubectl -n beta get deployments mysql | grep 1/1` ]]
	then echo "done"
	fi
