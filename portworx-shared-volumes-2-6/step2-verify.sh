ssh -o strictHostKeyChecking=no root@node01 pxctl volume inspect shared_volume | grep Shared | grep yes && ssh node01 pxctl volume inspect shared_volume | grep HA | grep 2  && echo "done"
