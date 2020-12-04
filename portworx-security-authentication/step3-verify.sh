if  [ `kubectl -n kube-system get pods -l name=portworx | grep portworx | wc -l ` -eq 3 ] && [[ `kubectl -n kube-system describe ds portworx | grep -i jwt_issuer` ]] && [ `kubectl -n kube-system describe ds portworx | grep -i "PORTWORX_AUTH" | wc -l` -eq  3  ]
then 
	echo "done"; 
fi
