kubectl delete ds kube-keepalived-vip -n kube-system
scp -o StrictHostKeyChecking=no /tmp/*.yaml /tmp/*.json node01:/tmp

kubectl create -f /tmp/px-sc.yaml


cat >> .bash_profile << EOF
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

source ~/.bash_profile
