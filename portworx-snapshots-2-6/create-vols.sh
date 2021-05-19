kubectl delete ds kube-keepalived-vip -n kube-system

ssh -o strictHostKeyChecking=no node01 "pxctl volume create testvol"

ssh -o strictHostKeyChecking=no node02 "pxctl volume create local_volume --nodes=LocalNode"

ssh -o strictHostKeyChecking=no node03 "pxctl volume create ha_volume --nodes=LocalNode --repl=3"

ssh -o strictHostKeyChecking=no node01 "pxctl volume create new_vol"

ssh -o strictHostKeyChecking=no node01 "pxctl volume snapshot create --name user_snapshot --label color=blue,env=test testvol"
