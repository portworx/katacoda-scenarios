(($(kubectl -n kube-system get pod px-etcd -o jsonpath='{.spec.nodeName}') == "node03" )) && (( $(kubectl -n kube-system get pod px-etcd -o jsonpath='{.status.phase}') == "Running" )) && echo "done"
