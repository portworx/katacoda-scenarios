pxctl status | grep -q demo-px-cluster
if [ $? -eq 0 ]
   then
echo "done"
fi
