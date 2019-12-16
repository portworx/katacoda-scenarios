volname=`ssh -o strictHostKeyChecking=no root@node01 "pxctl volume list"| grep new_vol | awk '{print $2}'`;
if [ ! "$volname" ] ; 
then 
	echo done; 
fi
