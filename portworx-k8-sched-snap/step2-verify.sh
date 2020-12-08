if [[ `kubectl get  schedulepolicy  daily-schedule -n mysql-app -o json  | jq -r ".policy.daily.time" | grep -w 10:00PM` ]] && [[ `kubectl get  schedulepolicy  daily-schedule -n mysql-app -o json  | jq -r ".policy.daily.retain" | grep -w 5` ]]
then
	echo "done"
fi
