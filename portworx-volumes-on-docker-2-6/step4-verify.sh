ssh root@node01 docker inspect redis | grep redis_px_vol | grep /data | grep size=10  && echo "done"
