if [ `cat /root/px-spec.yaml | grep jwt_issuer | grep example-domain.com| wc -l` -eq 1 ] && [ `cat /root/px-spec.yaml | grep PORTWORX_AUTH | wc -l` -eq 3 ] 
then
	echo "done"
fi
