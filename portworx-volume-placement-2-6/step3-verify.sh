if [[ `kubectl get  sc px-data  -o jsonpath='{.parameters.placement_strategy}' | grep statefulset-data` ]] && [[ `kubectl get  sc px-data  -o jsonpath='{.parameters.repl}' | grep 1` ]] && [[ `kubectl get  sc px-config  -o jsonpath='{.parameters.placement_strategy}' | grep statefulset-config` ]] && [[ `kubectl get  sc px-config  -o jsonpath='{.parameters.repl}' | grep 1` ]]
then 
	echo "done"
fi
