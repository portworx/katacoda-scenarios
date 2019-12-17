>>Install the PX OCI Bundle<<
Install the Bundle:


`latest_stable=$(curl -fsSL "https://install.portworx.com/?type=dock&stork=false" | awk '/image: / {print $2}')`{{execute node01}}

`sudo docker run --entrypoint /runc-entry-point.sh \
    --rm -i --privileged=true \
    -v /opt/pwx:/opt/pwx -v /etc/pwx:/etc/pwx \
    $latest_stable`{{execute}}
