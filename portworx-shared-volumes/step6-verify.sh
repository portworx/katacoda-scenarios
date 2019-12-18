ssh -o strictHostKeyChecking=no root@node03 mount | grep /var/lib/osd/mounts/node03 | grep px  && echo "done"
