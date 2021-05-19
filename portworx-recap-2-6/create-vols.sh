kubectl delete ds kube-keepalived-vip -n kube-system
ssh -o strictHostKeyChecking=no node01 "pxctl volume create vol1"

ssh -o strictHostKeyChecking=no node02 "pxctl volume create vol2 --nodes=LocalNode"

ssh -o strictHostKeyChecking=no node03 "pxctl volume create vol3 --nodes=LocalNode --repl=3"

ssh -o strictHostKeyChecking=no node01 "pxctl volume create vol4"

