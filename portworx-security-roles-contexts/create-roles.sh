scp -o StrictHostKeyChecking=no /tmp/role.json node01:/root
scp -o StrictHostKeyChecking=no /tmp/role-update.json node01:/tmp
scp -o StrictHostKeyChecking=no /tmp/developer.json node01:/tmp
kubectl delete ds kube-keepalived-vip -n kube-system
ssh -o strictHostKeyChecking=no node01 "pxctl role create --role-config /root/role.json"

