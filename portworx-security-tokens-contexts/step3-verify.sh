token=`ssh node01 cat /root/kubernetes-token.txt` && ssh node01 "pxctl context list --json " | jq '.[] | .configurations[] | select(.context| contains("kubernetes"))' | grep $token  && echo "done"
