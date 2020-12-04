ssh -o strictHostKeyChecking=no root@node01 pxctl alerts show | grep ha_volume | grep -qi "restored from snapshot snap-0" && echo "done"
