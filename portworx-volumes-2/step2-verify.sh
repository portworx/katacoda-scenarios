volname=`ssh -o strictHostKeyChecking=no root@node01 "pxctl volume list | grep -i user_volume" | awk '{print $2}'`
if [ "$volname" == "user_volume" ]
   then
echo "done"
fi
