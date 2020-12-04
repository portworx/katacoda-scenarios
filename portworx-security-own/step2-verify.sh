if [[ `ssh node01 pxctl context list | grep -i  current | grep user-context2` ]] && [[ ! `ssh node01 pxctl volume inspect app-volume-1 | grep dept | grep development` ]]
then
	echo "done"
fi
