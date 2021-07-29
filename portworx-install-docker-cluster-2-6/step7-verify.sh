ssh -o strictHostKeyChecking=no root@node01 "pxctl status | grep Nodes: | grep \"3 online\"" 
if [ $? -eq 0 ]
   then
echo "done"
fi
