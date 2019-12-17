ssh -o strictHostKeyChecking=no root@node01 '(($(pxctl volume list | grep local_volume | grep Shared | grep yes))) && echo \"done\"'
