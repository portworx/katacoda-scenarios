if [ `ssh  node01 pxctl  cred list | grep -i my-cloud-credentials | grep us-east-1 | wc -l` -eq 1 ]
	then echo "done"
	fi
