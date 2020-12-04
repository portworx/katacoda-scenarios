ssh -o strictHostKeyChecking=no root@node01 pxctl volume inspect ha_volume --json | jq '.[].spec.snapshot_schedule' | grep pol1  && echo "done"
