if  [[ `ssh node01 pxctl volume access show app-volume-1 | grep -A1 Groups | grep tester | grep -i  write` ]]  
then
	echo "done"
fi
