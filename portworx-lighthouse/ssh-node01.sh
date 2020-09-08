ssh -o strictHostKeyChecking=no node01 "mkdir /root/.kube" && scp /root/.kube/config node01:/root/.kube/config && ssh -o strictHostKeyChecking=no node01 && clear

