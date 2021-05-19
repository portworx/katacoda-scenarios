kubectl create -f /tmp/create-objects.yaml

curl -fsSL https://git.io/get_helm.sh | bash

helm init --service-account helm

helm install --name px-minio     --set accessKey=ZZYYXXWWVVUUTT     --set secretKey=0ldSup3rS3cr3t     --set persistence.storageClass=px-ha-sc  --set resources.requests.memory=1Gi    stable/minio

helm install --name px-minio-2     --set accessKey=AABBCCDDEEFF    --set secretKey=N3wSup3rS3cret     --set persistence.storageClass=px-ha-sc   --set resources.requests.memory=1Gi   stable/minio
