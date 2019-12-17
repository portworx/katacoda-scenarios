<p> **Portworx Lighthouse** is being installed for this cluster in the background. This can take a couple of mintutes.</p>

<p> You can check the status here:</p>
`/tmp/check_lighthouse.sh`{{execute}}
<p></p>

Once the installation is complete, click on the tab **Lighthouse Dashboard** to connect to the UI.</p>

<p>Access the UI with the credentials **admin/Password1**</p>

#### Configure Lighthouse
* To add a PX cluster to Lighthouse, you will need the IP address of any one of the nodes in that cluster. Lighthouse will connect to that node and configure itself to monitor that cluster.

 You can get the IP address of a storage node by running the below command. Look for IP address of the node (example node01), copy and paste it in the Lighthouse add cluster screen.

`pxctl status`{{execute}}


* After your first login, go to ‘click here to add a Cluster to Light House’ -> Add cluster endpoint (Add the IP address of the Storage Node Here) -> Verify. This should automatically fill in the cluster name and UUID. Once verified, click on attach.
