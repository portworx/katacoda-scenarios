helm install --name px-minio-1 --set accessKey=ZZYYXXWWVVUU --set secretKey=0ldSup3rS3cr3t --set persistence.storageClass=px-ha-sc --set resources.requests.memory=1Gi stable/minio 2> /tmp/helm.out

