kubectl delete ds kube-keepalived-vip -n kube-system
ssh -o strictHostKeyChecking=no node01 "pxctl role create --role-config /root/role.json"

