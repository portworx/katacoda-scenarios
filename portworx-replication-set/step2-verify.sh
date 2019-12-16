ssh -o strictHostKeyChecking=no root@node01 pxctl volume inspect vol_f --json | jq '.[].spec.ha_level' | grep 2  && echo "done"
