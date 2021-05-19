ssh -o strictHostKeyChecking=no node01 pxctl volume list | grep pvc | grep -q "2 GiB" && echo "done"
