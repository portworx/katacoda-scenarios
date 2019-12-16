ssh root@node01 docker inspect redis | grep redis_px_vol:/data  && echo "done"
