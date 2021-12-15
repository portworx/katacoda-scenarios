docker container inspect etcd | grep -q 4002
if [ $? -eq 0 ]
   then	
echo "done"
fi
