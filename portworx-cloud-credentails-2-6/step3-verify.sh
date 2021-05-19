if [ `ssh  node01 pxctl  cred list | grep -i my-credentials | grep ca-central-1 | wc -l` -eq 1 ]
	then echo "done"
	fi
