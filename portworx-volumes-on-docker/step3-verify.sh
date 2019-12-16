ssh root@node01 docker inspect nginx | grep px_volume:/var/www/html && echo "done"
