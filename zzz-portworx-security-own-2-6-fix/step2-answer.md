To update the volume, run:

`pxctl volume update app-volume-1 --label dept=development`{{execute}}


This should fail as the users of context user-context2 do not have permission to make this change on the volume. The volume is currently owned by the user "Aaron Ramsey", The group "developer" has admin access.


To see the current context:
`pxctl context list | grep current`{{execute}} 


Additionally, if you want to see the roles permissions assigned to user-context2, run a jwt decode against the token:
