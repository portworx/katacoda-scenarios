if [[ `kubectl -n finance get pvc  finance-pvc | grep -i bound` ]] && [[ `kubectl -n engineering get pvc  engineering-pvc | grep -i bound` ]] 
then
	echo "done"
fi
