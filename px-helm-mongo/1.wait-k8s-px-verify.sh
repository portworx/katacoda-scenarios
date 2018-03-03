(( $(kubectl get pods -n kube-system 2>/dev/null | grep portworx | awk '{print $2}' | grep -e 0/1 | wc -l) >= 1 )) && echo \"done\"
