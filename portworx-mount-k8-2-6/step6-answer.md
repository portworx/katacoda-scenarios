<pre>
kind: PersistentVolumeClaim
apiVersion: v1
metadata:
  name: shared-nginx-pvc
spec:
  storageClassName: px-sc-shared
  accessModes:
    - ReadWriteMany
  resources:
    requests:
      storage: 1Gi
</pre>