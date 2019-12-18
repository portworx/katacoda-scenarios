ssh -o strictHostKeyChecking=no node01 "ls -ld /opt/pwx/oci"
if [ $? -eq 0 ]
   then
echo "done"
fi
