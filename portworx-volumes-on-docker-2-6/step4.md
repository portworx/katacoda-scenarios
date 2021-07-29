>>Q5: Now lets combine step 2 and 3 in to one. Create a new container called redis with image redis. The container should mount a Docker volume called redis_px_vol created using the PX driver at the target mount point /data. Size = 10 GiB<<


Refer: [Portworx Volumes on Docker](https://docs.portworx.com/install-with-other/docker/how-to/volume-plugin/#docker-interaction-with-portworx/)
