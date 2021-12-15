docker container inspect etcd | grep -i hostport | grep  -q 4002
if [ $? -eq 0 ]
   then	
echo "done"
fi
