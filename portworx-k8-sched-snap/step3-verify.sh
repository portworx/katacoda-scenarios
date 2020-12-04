if [[ `kubectl  describe  sc px-nginx-scheduled | grep -i "daily-schedule"` ]] 
then
	echo "done"
fi
