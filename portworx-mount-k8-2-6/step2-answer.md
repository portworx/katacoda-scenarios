```
kind: PersistentVolumeClaim
apiVersion: v1
metadata:
  name: nginx-pvc
spec:
  storageClassName: px-sc
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 1Gi
```