</br>

##### Create a new credential called `my-credentials`.  Use the below spec:

       provider = s3
       s3 region = ca-central-1
       access key = ZZYYXXWWVVUU  
       secret key = 0ldSup3rS3cr3t


Run the below command to obtain the object store endpoint:

`MINIO_ENDPOINT=$(kubectl describe svc px-minio-1 | grep Endpoints | awk '{print $2}');echo $MINIO_ENDPOINT`{{execute}}
