docker container inspect etcd | grep -i 4002
if [ $? -eq 0 ]
   then	
echo "done"
fi
