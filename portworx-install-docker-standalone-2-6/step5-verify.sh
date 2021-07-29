systemctl status portworx | grep -i active | grep -qi running
if [ $? -eq 0 ]
   then
echo "done"
fi
