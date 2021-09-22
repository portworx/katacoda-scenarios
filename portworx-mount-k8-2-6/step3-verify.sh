kubectl get pod | grep nginx | grep Running && kubectl describe deployment nginx | grep -i nginx-pvc && echo "done"
