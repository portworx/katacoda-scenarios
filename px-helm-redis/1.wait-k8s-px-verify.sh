<<<<<<< HEAD
[ `kubectl get pods -n kube-system 2>/dev/null | grep portworx | awk '{print $2}' | grep -e 0/1 | wc -l` -eq '0' ] && echo "done"
=======
[ `kubectl get pods -n kube-system 2>/dev/null | grep portworx | awk '{print $2}' | grep -e 0/1 | wc -l` -eq '0'] && echo "done"
>>>>>>> 74da5f09ed27ef003eace421b621864cf3bc785c
