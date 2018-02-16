launch.sh
echo "sytem coming online, this will take 20 seconds"
wait 15
ssh-keyscan node01 >> ~/.ssh/known_hosts
ssh-keyscan node02 >> ~/.ssh/known_hosts
ssh-keyscan node03 >> ~/.ssh/known_hosts
clear
