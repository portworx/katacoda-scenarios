>>Install the PX OCI Bundle<<
Install the Bundle:

`export REL="/2.2"`{{execute}}

`latest_stable=$(curl -fsSL "https://install.portworx.com$REL/?type=dock&stork=false" | awk '/image: / {print $2}')`{{execute node01}}

`sudo docker run --entrypoint /runc-entry-point.sh \
    --rm -i --privileged=true \
    -v /opt/pwx:/opt/pwx -v /etc/pwx:/etc/pwx \
    $latest_stable`{{execute}}
