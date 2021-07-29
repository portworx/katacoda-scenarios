ssh -o strictHostKeyChecking=no node01 pxctl volume inspect vol_c  --json | jq '.[].spec.ha_level' | grep 2 && echo "done"
