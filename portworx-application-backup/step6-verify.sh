if [[ `storkctl get applicationclones  clone-mysql -n kube-system | grep clone-mysql | grep Final | grep Successful` ]] && [[ `kubectl -n clone-mysql get deployments. mysql | grep "1/1"` ]]
then
	echo "done"
fi
