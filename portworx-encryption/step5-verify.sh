ssh -o strictHostKeyChecking=no node01 pxctl volume inspect ha_volume | grep Label | grep env=q && echo "done"
