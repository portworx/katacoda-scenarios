ssh -o strictHostKeyChecking=no root@node01 pxctl volume inspect local_volume --json | jq '.[].spec.shared' | grep true && echo "done"
