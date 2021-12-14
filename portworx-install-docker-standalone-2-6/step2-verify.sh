docker container inspect etcd | grep -i hostport| grep  -q 4001
if [ $? -eq 0 ]
   then	
echo "done"
fi
