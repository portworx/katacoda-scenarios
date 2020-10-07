if [[ `kubectl describe  schedulepolicy  daily-schedule -n mysql-app | grep -i "10:00"` ]]
then
	echo "done"
fi
