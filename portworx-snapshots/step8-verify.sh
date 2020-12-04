ssh -o strictHostKeyChecking=no root@node02 ls /var/lib/osd/mounts/testvol_node02/ | grep file_added_on_node03 && echo "done"
