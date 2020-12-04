if [[ `kubectl -n gamma get pvc px-gamma-pvc | grep -i Bound` ]] 
	then echo "done"
	fi
