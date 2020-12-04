if [[ `storkctl get applicationrestores  restore -n mysql-app  | grep Final | grep Successful` ]]
then
	echo "done"
fi
