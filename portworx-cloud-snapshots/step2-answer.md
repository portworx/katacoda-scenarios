Get the minio endpoint from the 'px-minio-1' service and use it to create portworx credential: 

`MINIO_ENDPOINT=$(kubectl describe svc px-minio-1 | grep Endpoints | awk '{print $2}')`{{execute}}

`ssh -o strictHostKeyChecking=no node01 pxctl credentials create --provider s3 --s3-access-key ZZYYXXWWVVUU --s3-secret-key 0ldSup3rS3cr3t --s3-endpoint http://$MINIO_ENDPOINT --s3-region us-east-1 my-cloud-credentials`{{execute}}
