while [ ! -f /tmp/wait-script.sh ]
do
  sleep .2
done
sleep 5
chmod 755 /tmp/wait-script.sh; /tmp/wait-script.sh
