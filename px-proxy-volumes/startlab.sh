
# Start nfs server on node01
#ssh node01 "apt-get install -y nfs-kernel-server"
ssh node01 "mkdir -p /mnt/nfs_share"
ssh node01 "chown -R nobody:nogroup /mnt/nfs_share/"
ssh node01 "chmod 777 /mnt/nfs_share/"
ssh node01 "echo '/mnt/nfs_share  172.0.0.0/8(rw,sync,no_subtree_check)' > /etc/exports"
ssh node01 "exportfs -a"
ssh node01 "systemctl restart nfs-kernel-server"
ssh node01 "ufw allow from 172.0.0.0/8 to any port nfs"
ssh node01 "ufw reload"

