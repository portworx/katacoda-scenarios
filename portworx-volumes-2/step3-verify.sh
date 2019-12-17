ssh -o strictHostKeyChecking=no root@node01 '(( ! $(pxctl volume list | grep new_vol))) && echo \"done\"'
