docker container inspect etcd | grep -i hostport| grep  -q 2379
if [ $? -eq 0 ]
   then	
echo "done"
fi
