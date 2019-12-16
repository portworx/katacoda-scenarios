ssh -o strictHostKeyChecking=no node01 "pxctl volume create testvol"

ssh -o strictHostKeyChecking=no node02 "pxctl volume create local_volume --nodes=LocalNode"

ssh -o strictHostKeyChecking=no node03 "pxctl volume create ha_volume --nodes=LocalNode --repl=3"

ssh -o strictHostKeyChecking=no node01 "pxctl volume create new_vol"
