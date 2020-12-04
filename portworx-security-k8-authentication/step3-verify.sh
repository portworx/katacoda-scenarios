#!/bin/sh
if  [ `kubectl -n kube-system describe ds portworx | grep -i "Pods Status" | grep "3 Running" | wc -l` -eq 1 ] && [ `kubectl -n kube-system describe ds portworx | grep -i jwt_issuer | wc -l ` -eq 1  ] && [ `kubectl -n kube-system describe ds portworx | grep -i "PORTWORX_AUTH" | wc -l` -eq  3  ]; then echo "done"; fi
