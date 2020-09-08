Enable and start Portworx service on node01

Make use of systemctl to enable and start PX service

`systemctl enable portworx`
`systemctl start portworx`

Note: Once the service is started, it can take a couple of minutes for Portworx to initalize. Use the below command to monitor the PX cluster status:
`pxctl status`{{execute}}

The above command may intially say `PX is not running on this host`, wait a few minutes and it should come online. You can also check the status by running `systemctl status portworx`{{execute}}

You should see `Status: PX is operational` from `pxctl status`{{execute}}
