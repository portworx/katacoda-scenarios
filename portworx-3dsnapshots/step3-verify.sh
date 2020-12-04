if [[ `kubectl get volumesnapshot mysql-3d-snapshot -o=jsonpath='{.metadata.annotations}' | grep mysql-presnap-rule` ]] && [[ `kubectl get volumesnapshot mysql-3d-snapshot -o=jsonpath='{.spec.persistentVolumeClaimName}' | grep px-mysql-pvc` ]]
then
	echo "done"
fi
