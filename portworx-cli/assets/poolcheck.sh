poolcount=`ssh -t -o strictHostKeyChecking=no root@node01 bash -c \"pxctl service pool show\" | grep ID | wc -l`; [ $poolcount -eq '2' ]
