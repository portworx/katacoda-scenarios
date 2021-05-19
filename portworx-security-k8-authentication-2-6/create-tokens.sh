scp -o StrictHostKeyChecking=no /tmp/*yaml node01:/tmp
ssh node01 "pxctl auth token generate  --auth-config /tmp/finance-authconfig.yaml --issuer example-domain.com  --shared-secret Sup3rs3cr3t --output /tmp/finance-self-signed-token.txt "

ssh node01 "pxctl auth token generate  --auth-config /tmp/engineering-authconfig.yaml --issuer example-domain.com  --shared-secret Sup3rs3cr3t --output /tmp/engineering-self-signed-token.txt "

ssh node01 "pxctl auth token generate  --auth-config /tmp/admin-authconfig.yaml --issuer example-domain.com  --shared-secret Sup3rs3cr3t --output /tmp/admin-self-signed-token.txt "

ssh node01 "pxctl context create user-context1 --token \$(cat /tmp/finance-self-signed-token.txt)"

ssh node01 "pxctl context create user-context2 --token \$(cat /tmp/engineering-self-signed-token.txt)"

ssh node01 "pxctl context create user-context3 --token \$(cat /tmp/admin-self-signed-token.txt)"


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
