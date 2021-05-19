if [[ `storkctl -n mysql-app get backuplocation | grep mysql | grep ZZYYXXWWVVUU` ]]
then
	echo "done"
fi
