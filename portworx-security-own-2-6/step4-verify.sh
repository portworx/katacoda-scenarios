ssh node01 pxctl context list | grep current | grep -iq  user-context2 && ssh node01 pxctl volume inspect app-volume-1 | grep -i label | grep dept | grep -iq development && echo "done"
