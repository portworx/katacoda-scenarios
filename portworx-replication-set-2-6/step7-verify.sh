ssh root@node03 '[[ $(ls /var/lib/osd/mounts/node03/ | grep file_added_on_node03) ]] && echo \"done\"'
