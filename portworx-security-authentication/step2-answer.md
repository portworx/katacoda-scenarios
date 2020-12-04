Add the below args to the Portworx Deamonset:
         - -jwt_issuer
         - example-domain.com



Add the below environment variables to the Portworx Daemonset:

         - name: "PORTWORX_AUTH_JWT_SHAREDSECRET"
           valueFrom:
                secretKeyRef:
                  name: pxkeys
                  key: shared-secret
         - name: "PORTWORX_AUTH_SYSTEM_KEY"
           valueFrom:
                secretKeyRef:
                  name: pxkeys
                  key: system-secret
         - name: "PORTWORX_AUTH_STORK_KEY"
           valueFrom:
               secretKeyRef:
                  name: pxkeys
                  key: stork-secret


Add the below environment variables to the Stork Deployment:

         - name: "PX_SHARED_SECRET"
          valueFrom:
             secretKeyRef:
                name: pxkeys
                key: stork-secret
