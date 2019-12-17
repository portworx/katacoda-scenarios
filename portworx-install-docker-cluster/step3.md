>>Install the PX OCI Bundle on node01<<
Install the Bundle using the reference link below:

[Install PX OCI Bundle](https://docs.portworx.com/install-with-other/docker/standalone/#step-1-install-the-px-oci-bundle/)

ssh to node01
`ssh -o strictHostKeyChecking=no node01`{{execute}}


Make use of the latest stable image:
`latest_stable=$(curl -fsSL "https://install.portworx.com/?type=dock&stork=false" | awk '/image: / {print $2}')`{{execute}}
`echo $latest_stable`{{execute}}
