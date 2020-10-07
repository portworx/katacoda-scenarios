scp /tmp/*authconfig.yaml node01:/tmp
ssh node01 "pxctl auth token generate  --auth-config /tmp/developer-authconfig.yaml --issuer example-domain.com  --shared-secret Sup3rs3cr3t --output /tmp/developer-self-signed-token.txt "

ssh node01 "pxctl auth token generate  --auth-config /tmp/tester-authconfig.yaml --issuer example-domain.com  --shared-secret Sup3rs3cr3t --output /tmp/tester-self-signed-token.txt "

ssh node01 "pxctl auth token generate  --auth-config /tmp/admin-authconfig.yaml --issuer example-domain.com  --shared-secret Sup3rs3cr3t --output /tmp/admin-self-signed-token.txt "

ssh node01 "pxctl context create user-context1 --token \$(cat /tmp/developer-self-signed-token.txt)"

ssh node01 "pxctl context create user-context2 --token \$(cat /tmp/tester-self-signed-token.txt)"

ssh node01 "pxctl context create admin-context --token \$(cat /tmp/admin-self-signed-token.txt)"

ssh node01 "pxctl context set user-context1; pxctl volume create app-volume-1 --size 2 --io_priority high"

ssh node01 "pxctl context set user-context2; pxctl volume create test-volume-1 --size 2 --io_priority high"

ssh node01 "pxctl context set admin-context; pxctl volume access update --groups developer:a --owner \"Aaron Ramsey\"  app-volume-1"

ssh node01 "pxctl context set admin-context; pxctl volume access update --groups tester:w --owner \"Gabi Martin\"  test-volume-1"

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
