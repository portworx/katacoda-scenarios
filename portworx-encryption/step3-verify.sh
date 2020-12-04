kubectl get storageclasses.storage.k8s.io encrypted-sc  -o json  | grep secure | grep true && kubectl get storageclasses.storage.k8s.io encrypted-sc  -o json  | grep repl | grep 3 && echo "done"
