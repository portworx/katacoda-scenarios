(( $(kubectl get pods -n kube-system -l statefulset.kubernetes.io/pod-name=prometheus-prometheus-0 2>/dev/null | grep Running | grep 3/3 | awk '{print $2}' | wc -l) == 1)) && echo \"done\"