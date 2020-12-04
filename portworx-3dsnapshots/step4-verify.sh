if [[ `kubectl get rules.stork.libopenstorage.org  mongodb-presnap-rule -o=jsonpath='{.rules[].actions[].value}'   | grep "mongo --eval \"printjson(db.fsyncLock())\""` ]]
then
	echo "done"
fi
