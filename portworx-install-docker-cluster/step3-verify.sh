ssh -o strictHostKeyChecking=no node01 "ls /opt/pwx/bin/px-runc"
if [ $? -eq 0 ]
   then
echo "done"
fi
