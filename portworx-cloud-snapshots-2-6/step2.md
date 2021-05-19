</br>

##### Create a new Portworx credential called `my-cloud-credentials` with the below parameters:


       provider = s3
       s3 region = us-east-1
       access key = ZZYYXXWWVVUU
       secret key = 0ldSup3rS3cr3t


Run the below command to obtain the object store endpoint:

`MINIO_ENDPOINT=$(kubectl describe svc px-minio-1 | grep Endpoints | awk '{print $2}');echo $MINIO_ENDPOINT`{{execute}}
