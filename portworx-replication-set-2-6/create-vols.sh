ssh -o strictHostKeyChecking=no node03 pxctl volume create vol_d --nodes=LocalNode
ssh -o strictHostKeyChecking=no node01 pxctl volume create vol_e --repl 3
