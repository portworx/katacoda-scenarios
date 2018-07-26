[ `kubectl get pvc | grep shared  | wc | awk '{print $1}'` -eq 1 ] && echo "done"
