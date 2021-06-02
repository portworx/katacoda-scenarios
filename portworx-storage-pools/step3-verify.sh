ssh -o strictHostKeyChecking=no node01 pxctl service pool show  | grep "IO Priority:" | awk '{print $NF}' | grep -q  "MEDIUM" &&  echo "done"
