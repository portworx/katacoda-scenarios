<p> **Portworx Lighthouse** is being installed for this cluster in the background. This can take a couple of mintutes.</p>

<p> You can check the status here:</p>
`/tmp/check_lighthouse.sh`{{execute}}
<p></p>

Once the installation is complete, click on the tab **Lighthouse Dashboard** to connect to the UI.</p>

<p>Access the UI with the credentials **admin/Password1**</p>

#### Add a Cluster
To add a PX cluster to Lighthouse, you will need the IP address of any one of the nodes in that cluster. Lighthouse will connect to that node and configure itself to monitor that cluster.

After your first login, go to ‘click here to add a Cluster to Light House’ -> Add cluster endpoint -> Verify. This should automatically fill in the cluster name and UUID. Once verified, click on attach.

Reference: [Add Cluster to Lighthouse](https://docs.portworx.com/reference/lighthouse/#adding-a-px-cluster/)
