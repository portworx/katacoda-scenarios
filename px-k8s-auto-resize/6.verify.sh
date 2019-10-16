ssh root@host01 "[ \`kubectl get pods -l app=postgres 2>/dev/null | grep Running | grep 1/1 | awk '{print $2}' | wc -l\` -eq '1' ] && echo \"done\""
