Install the PX OCI Bundle on node01

First, SSH to node01:

ssh to node01
`ssh -o strictHostKeyChecking=no node01`{{execute}}

Make use of the latest stable image:
`latest_stable=$(curl -fsSL "https://install.portworx.com/?type=dock&stork=false" | awk '/image: / {print $2}')`{{execute}}

`echo $latest_stable`{{execute}}

Using the latest stable release, let's install the bundle using the reference link below:

[Install PX OCI Bundle](https://docs.portworx.com/install-with-other/docker/standalone/#step-1-install-the-px-oci-bundle/)

You can check the above link for more information or to confirm the command.

`sudo docker run --entrypoint /runc-entry-point.sh --rm -i --privileged=true -v /opt/pwx:/opt/pwx -v /etc/pwx:/etc/pwx $latest_stable`{{execute}}
