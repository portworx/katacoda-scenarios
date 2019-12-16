[[ $(kubectl get pod | grep shared-deploy | grep Running | wc -l) -eq '3' ]] && kubectl describe deployment nginx | grep -i nginx-pvc && echo "done"
