kubectl -n portworx get secret px-vol-encryption -o yaml | grep cluster-wide-secret-key | grep c1VwM3JjcjN0 && echo "done"
