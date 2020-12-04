Run the below commands to create the credentials:

`MINIO_ENDPOINT=$(kubectl describe svc px-minio-1 | grep Endpoints | awk '{print $2}')`{{execute}}

`ssh -o strictHostKeyChecking=no node01 pxctl cred create --provider s3 --s3-region ca-central-1 --s3-access-key ZZYYXXWWVVUU --s3-secret-key 0ldSup3rS3cr3t --s3-endpoint http://$MINIO_ENDPOINT my-credentials`{{execute}}
