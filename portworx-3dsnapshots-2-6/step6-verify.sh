if [[ `kubectl get groupvolumesnapshots mongodb-3d-snapshot -o jsonpath='{.metadata.annotations}'| grep pre-snapshot:mongodb-presnap-rule | grep post-snapshot:mongodb-postsnap-rule` ]] && [[ `kubectl get groupvolumesnapshots mongodb-3d-snapshot -o jsonpath='{.spec.pvcSelector.matchLabels.app}' | grep mongo` ]]
then
	echo "done"
fi
