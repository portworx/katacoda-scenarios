cat << EOF > /opt/configure-environment.sh
#!/bin/bash
curl -L -s -o px-spec.yaml "http://install.portworx.com/26'?mc=false&kbVer=v1.18.0&b=true&s=%2Fdev%2Fvdb&c=px-demo&stork=true&st=k8s" && \
kubectl apply -f px-spec.yaml
EOF

chmod +x /opt/configure-environment.sh
