ssh -o strictHostKeyChecking=no root@node01 pxctl sched-policy list  | grep pol1 | grep daily | grep @12:30 && echo "done"
