if [[ `ssh -o strictHostKeyChecking=no node01 pxctl status | grep "3 online"` ]]
then
	echo "done"
fi
