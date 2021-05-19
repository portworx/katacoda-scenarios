if [[ `kubectl get rules.stork.libopenstorage.org  mongodb-postsnap-rule -o=jsonpath='{.rules[].actions[].value}'   | grep "mongo --eval \"printjson(db.fsyncUnLock())\""` ]]
then
	echo "done"
fi
