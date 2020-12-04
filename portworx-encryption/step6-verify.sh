ssh -o strictHostKeyChecking=no root@node03 mount | grep /var/lib/osd/mounts/testvol | grep px && echo "done"
