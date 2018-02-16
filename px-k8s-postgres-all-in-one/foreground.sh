echo "This initialization will only take a minute, once the screen clears you're ready to start."
launch.sh
sleep 15
ssh-keyscan node01 >> ~/.ssh/known_hosts
ssh-keyscan node02 >> ~/.ssh/known_hosts
ssh-keyscan node03 >> ~/.ssh/known_hosts
clear
