ssh -o strictHostKeyChecking=no root@node01 mount | grep /var/lib/osd/mounts/node03 | grep px  && echo "done"
