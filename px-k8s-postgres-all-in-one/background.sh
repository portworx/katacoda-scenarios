ssh-keyscan node01 >> ~/.ssh/known_hosts
ssh-keyscan node02 >> ~/.ssh/known_hosts
ssh-keyscan node03 >> ~/.ssh/known_hosts

ssh root@node01 'docker pull portworx/px-enterprise:1.2.12.0'
ssh root@node02 'docker pull portworx/px-enterprise:1.2.12.0'
ssh root@node03 'docker pull portworx/px-enterprise:1.2.12.0'
