</br>

##### Create a new auth token using the below parameters. Save the token at the location `/root/kubernetes-token.txt` on node01.


       name = Kubernetes
       email = kubernetes@local.net 
       sub = kubernetes@local.net/kubernetes 
       roles = system.user 
       groups = kubernetes
       Issuer = example-domain.com
       shared-secret = Sup3rS3cr3t
