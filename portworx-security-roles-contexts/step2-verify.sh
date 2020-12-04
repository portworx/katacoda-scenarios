ssh -o strictHostKeyChecking=no node01 pxctl role inspect --name test.view | jq  -S '.[] | .rules[] | select(.services[] | contains("volumes")).apis[]'  | grep -i create  && echo "done"
