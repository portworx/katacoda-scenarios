ssh -o strictHostKeyChecking=no root@node01 journalctl -u portworx* | grep -i restore | grep VOLUME_STATE_RESTORE  && echo "done"
