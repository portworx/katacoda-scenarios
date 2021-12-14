docker container inspect etcd | grep -i 2379/tcp
if [ $? -eq 0 ]
   then	
echo "done"
fi
