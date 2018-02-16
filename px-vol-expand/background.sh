ssh root@[[HOST_IP]] 'echo "Host *" >> /root/.ssh/config && echo "    StrictHostKeyChecking no" >> /root/.ssh/config && chmod 400 /root/.ssh/config'

ssh root@node01 'docker pull portworx/px-enterprise:1.2.12.0'
ssh root@node02 'docker pull portworx/px-enterprise:1.2.12.0'
ssh root@node03 'docker pull portworx/px-enterprise:1.2.12.0'
dd if=/dev/zero of=/root/1bg.img bs=1024 count=$[1024*1000]
