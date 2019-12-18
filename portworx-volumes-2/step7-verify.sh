ssh -o strictHostKeyChecking=no root@node03 '(( $(ls /var/lib/osd/mounts/testvol/ | grep file_added_on_node03))) && echo \"done\"'
