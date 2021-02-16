In this step, we will deploy the SQLPad WebUI

### Step: Deploy and Connect SQLPad WebUI
SQLPad provides us with an easy access method to query the SQL Server data.

```
kubectl apply -f sqlpad.yaml
./wait4-sqlpad.sh
```{{execute T1}}

Bring up SQLPad: https://[[HOST_SUBDOMAIN]]-30300-[[KATACODA_HOST]].environments.katacoda.com/queries/<br/>

Login with admin@sqlpad.com/admin

Click the `Choose Connection` button.<br/>

Select the `Manage Connections` button.<br/>

Select the `Add Connection` button.<br/>

Give connection a name.<br/>

Select `SQL Server` as connection Driver.<br/>

Use the following info:
* Port:  1433
* Database: IndexInternals2008
* Database Username: sa
* Database Password: P@ssw0rd
* Domain: (leave empty)

Test and save the connection.

In the workspace area, type `select count(*) from Employee`.<br/>
Then click `Run`, and take note of the number of rows returned.
If you're asked to login, the credentials are "abc@abc.com/abc"
