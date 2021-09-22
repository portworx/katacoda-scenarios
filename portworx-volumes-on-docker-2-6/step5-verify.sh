ssh root@node01 '[[ $(pxctl volume inspect ha_volume | grep Label | grep env=qa) ]] && echo \"done\"'
