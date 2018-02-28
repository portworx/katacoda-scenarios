In this step, we will deploy the SQLPad WebUI

### Step: Deploy and Connect SQLPad WebUI
SQLPad provides us with an easy access method to query the SQL Server data.

```
kubectl apply -f sqlpad.yaml
./wait4-sqlpad.sh
```{{execute T1}}

Bring up SQLPad: https://[[HOST_SUBDOMAIN]]-30300-[[KATACODA_HOST]].environments.katacoda.com/queries/<br/>

Click the `New Query` button.<br/>
In the workspace area, type `select count(*) from Employee`.<br/>
Then click `Run`, and take note of the number of rows returned.
If you're asked to login, the credentials are "abc@abc.com/abc"
