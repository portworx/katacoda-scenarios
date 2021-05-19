ssh -o strictHostKeyChecking=no node03 "systemctl stop docker;sed -i 's/master:4001/master:4002/g' /opt/pwx/config.json; systemctl restart portworx"
