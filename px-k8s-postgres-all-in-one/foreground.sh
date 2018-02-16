launch.sh
echo "sytem coming online"
wait 5
ssh-keyscan node01 >> ~/.ssh/known_hosts
ssh-keyscan node02 >> ~/.ssh/known_hosts
ssh-keyscan node03 >> ~/.ssh/known_hosts
