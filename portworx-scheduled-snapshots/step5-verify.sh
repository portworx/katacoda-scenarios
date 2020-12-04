ssh -o strictHostKeyChecking=no root@node01 pxctl sched-policy list  | grep pol1 | grep periodic | grep 1h0m0s | grep "last 5"  && echo "done"
