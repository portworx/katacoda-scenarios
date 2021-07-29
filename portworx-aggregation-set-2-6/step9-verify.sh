ssh root@node01 '[[ $(pxctl volume inspect testvol | grep State | grep -i detached) ]] && echo \"done\"'
