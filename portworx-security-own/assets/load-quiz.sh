#!/bin/bash
cd /tmp/

launch.sh

sh /tmp/create-pxkeys.sh

##Create an etcd container
#sh /tmp/install-etcd.sh


##Install Portworx with CSI
cp /tmp/px-spec.yaml /root/px-spec.yaml


kubectl delete ds kube-keepalived-vip -n kube-system

kubectl apply -f /root/px-spec.yaml

kubectl create ns finance

kubectl create ns engineering


cat >> /root/.bash_profile << EOF
decode_base64_url() {
  local len=\$((\${#1} % 4))
  local result="\$1"
  if [ \$len -eq 2 ]; then result="\$1"'=='
  elif [ \$len -eq 3 ]; then result="\$1"'='
  fi
  echo "\$result" | tr '_-' '/+' | openssl enc -d -base64
}

decode_jwt(){
   decode_base64_url \$(echo -n \$2 | cut -d "." -f \$1) | jq .
}

# Decode JWT header
alias jwth="decode_jwt 1"

# Decode JWT Payload
alias jwtp="decode_jwt 2"
EOF

source /root/.bash_profile
