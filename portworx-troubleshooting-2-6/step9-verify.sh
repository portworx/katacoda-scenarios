if [[ `kubectl -n gamma describe pvc px-gamma-pvc | grep px-gamma-sc` ]] && [[ `kubectl -n gamma describe sc px-gamma-sc | grep repl | grep 3` ]]
	then echo "done"
	fi
