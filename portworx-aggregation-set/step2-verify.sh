ssh -o strictHostKeyChecking=no root@node01 pxctl volume inspect vol_b --json | jq '.[].spec.aggregation_level' | grep 3  && echo "done"
