if [[ `storkctl get applicationclones  clone-mysql -n kube-system | grep clone-mysql | grep Final | grep Successful` ]]
then
	echo "done"
fi
