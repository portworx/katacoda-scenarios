until [ `kubectl get pods | grep px-minio | grep Running | grep 1/1 | wc -l` == 2 ]; do sleep 1;done

wget -O /usr/bin/mc https://dl.minio.io/client/mc/release/linux-amd64/mc

chmod +x /usr/bin/mc

MINIO_ENDPOINT=$(kubectl describe svc px-minio | grep Endpoints | awk '{print $2}')

MINIO_ENDPOINT2=$(kubectl describe svc px-minio-2 | grep Endpoints | awk '{print $2}')

mc config host add px http://$MINIO_ENDPOINT myaccesskey mysecretkey --api S3v4 

mc config host add object-store-2 http://$MINIO_ENDPOINT2 AAXXBBCCDD Sup3rS3cret --api S3v4


ssh node01 "/opt/pwx/bin/pxctl cred create   --provider s3   \
    --s3-access-key AABBCCDDEEFF   --s3-secret-key N3wSup3rS3cret   \
    --s3-region us-east-1 --s3-endpoint http://10.34.0.3:9000 objectstore-2"

