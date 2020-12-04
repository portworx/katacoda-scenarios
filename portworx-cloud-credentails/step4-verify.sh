if [ `ssh  node01 pxctl  cred list | grep -i objectstore-2 | wc -l` -eq 0 ]
	then echo "done"
	fi
