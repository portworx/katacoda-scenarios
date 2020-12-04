if [[ `kubectl get sc px-secure-sc -o yaml | grep  px-k8s-user` ]] &&  [[ `kubectl get sc px-secure-sc -o yaml |  grep  '${pvc.namespace}'` ]] && [[ `kubectl get sc px-secure-sc -o yaml | grep repl | grep  1` ]]
then
	echo "done"
fi
