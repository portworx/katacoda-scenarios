ssh -o strictHostKeyChecking=no root@node01 "systemctl status portworx | grep -i  active | grep -i running"
if [ $? -eq 0 ]
   then
echo "done"
fi
