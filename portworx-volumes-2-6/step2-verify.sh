ssh -o strictHostKeyChecking=no node01 pxctl volume inspect user_volume --json | jq '.[].spec.ha_level' | grep 2 && ssh -o strictHostKeyChecking=no node01 pxctl volume list | grep user_volume | awk '{print $3,$4}' | grep "2 GiB" && echo "done"