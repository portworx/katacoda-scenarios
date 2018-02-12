cat <<EOF | cat -
apiVersion: v1
kind: ReplicationController
metadata:
  name: nginx-ingress-rc
  labels:
    app: nginx-ingress
spec:
  replicas: 1
  selector:
    app: nginx-ingress
  template:
    metadata:
      labels:
        app: nginx-ingress
    spec:
      containers:
      - image: nginxdemos/nginx-ingress:0.9.0
        name: nginx-ingress
        ports:
        - containerPort: 80
          hostPort: 80
---
apiVersion: v1
kind: Service
metadata:
  name: nginx-ingress-lb
  labels:
    app: nginx-ingress
spec:
  externalIPs:
  - $(kubectl get nodes -o jsonpath='{.items[*].status.addresses[?(@.type!="ExternalIP")].address}'  | awk -F' ' '{print $1}')
  ports:
  - port: 80
    name: http
    targetPort: 80
  selector:
    app: nginx-ingress
---
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: webapp-ingress
spec:
  rules:
  - host: my.kubernetes.example
    http:
      paths:
      - path: /webapp1
        backend:
          serviceName: webapp1-svc
          servicePort: 80
      - path: /webapp2
        backend:
          serviceName: webapp2-svc
          servicePort: 80
      - backend:
          serviceName: webapp3-svc
          servicePort: 80
EOF
