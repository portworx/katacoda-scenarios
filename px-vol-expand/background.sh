ssh root@[[HOST_IP]] 'echo "Host *" >> /root/.ssh/config && echo "    StrictHostKeyChecking no" >> /root/.ssh/config && chmod 400 /root/.ssh/config'
dd if=/dev/zero of=/root/1bg.img bs=1024 count=$[1024*1000]
