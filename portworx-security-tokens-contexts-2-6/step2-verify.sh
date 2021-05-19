decode_base64_url() {
  local len=$((${#1} % 4))
  local result="$1"
  if [ $len -eq 2 ]; then result="$1"'=='
  elif [ $len -eq 3 ]; then result="$1"'='
  fi
  echo "$result" | tr '_-' '/+' | openssl enc -d -base64
}

decode_jwt(){
   decode_base64_url $(echo -n $2 | cut -d "." -f $1) | jq .
}
token=`ssh  node01 cat /root/kubernetes-token.txt` && decode_jwt 2 $token | grep system.user && decode_jwt 2 $token | grep iss | grep example-domain.com && decode_jwt 2 $token | grep sub | grep "kubernetes@local.net/kubernetes"  && echo "done"
