In this step, you will install the PX OCI bundle on 3 seperate hosts.

## Install the OCI bundle
PX runs as an OCI runC container.  In order to run PX, you must first install the OCI bundle.  The OCI bundle is distributed as a Docker image.

>**Note:**<br/>The documentation for this task are here: https://docs.portworx.com/runc/#install-the-px-oci-bundle

### Task
You can install the bundle by running the following **command**

`sudo docker run --entrypoint /runc-entry-point.sh \
   --rm -i --privileged=true \
   -v /opt/pwx:/opt/pwx \
   -v /etc/pwx:/etc/pwx \
   portworx/px-enterprise:1.2.11-rc8`{{execute}}
