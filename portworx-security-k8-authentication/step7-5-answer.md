Generate Token:
`ssh -o strictHostKeyChecking=no node01 pxctl auth token generate    --auth-config=/tmp/engineering-authconfig.yaml --issuer=example-domain.com    --shared-secret=Sup3rs3cr3t`{{execute}}



Use the token from the previous step and create the secret using the command:
`kubectl -n engineering create secret generic px-k8s-user --from-literal=auth-token=<token_string>`{{copy}}
