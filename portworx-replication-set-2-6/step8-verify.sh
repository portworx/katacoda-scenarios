ssh root@node02 '[[ $(ls /var/lib/osd/mounts/node02/ | grep file_added_on_node03) ]] && echo \"done\"'
